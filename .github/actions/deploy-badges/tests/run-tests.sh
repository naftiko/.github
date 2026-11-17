#!/usr/bin/env bash
# Offline tests for deploy.sh. A bare repo stands in for the badges branch; a pre-push hook
# plays the concurrent run that pushes first.
set -uo pipefail

DEPLOY="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../scripts/deploy.sh"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
export GIT_AUTHOR_NAME=t GIT_AUTHOR_EMAIL=t@example.com GIT_COMMITTER_NAME=t GIT_COMMITTER_EMAIL=t@example.com
export RETRY_DELAY=0  # no wait between attempts

failed=0
expect() { [ "$2" = "$3" ] && echo "ok   $1" || { failed=1; echo "FAIL $1: expected '$2', got '$3'"; }; }

setup() { # name: bare remote holding main/old.json, plus a shallow clone like actions/checkout
  R="$TMP/$1.git"; git init -q --bare -b badges "$R"
  git clone -q "$R" "$TMP/$1-seed" 2>/dev/null
  mkdir -p "$TMP/$1-seed/main"; echo old > "$TMP/$1-seed/main/old.json"
  git -C "$TMP/$1-seed" add -A; git -C "$TMP/$1-seed" commit -qm seed
  git -C "$TMP/$1-seed" push -q origin HEAD:badges
  git clone -q --depth 1 --branch badges "file://$R" "$TMP/$1"
  mkdir -p "$TMP/$1-src/feat"; printf mine > "$TMP/$1-src/feat/badge.json"
}
show() { git -C "$R" show "badges:$1" 2>/dev/null; }
deploy() { SOURCE_DIR="$TMP/$1-src" BRANCH_DIR="$TMP/$1" bash "$DEPLOY" >/dev/null 2>&1; }
race() { # name file content [always]: push from another clone just before the real push
  git clone -q --depth 1 --branch badges "file://$R" "$TMP/$1-racer"
  cat > "$TMP/$1/.git/hooks/pre-push" <<EOF
#!/usr/bin/env bash
unset GIT_DIR
[ "${4:-}" = always ] || { [ -e "$TMP/$1-raced" ] && exit 0; }; touch "$TMP/$1-raced"
cd "$TMP/$1-racer"; mkdir -p "\$(dirname $2)"; printf '$3' > $2
git add -A; git commit -q --allow-empty -m racer; git pull -q --rebase origin badges; git push -q origin HEAD:badges
EOF
  chmod +x "$TMP/$1/.git/hooks/pre-push"
}

setup t1
deploy t1; expect "deploy exits 0" 0 $?
expect "badge is published" mine "$(show feat/badge.json)"
expect "existing files are kept" old "$(show main/old.json)"
before="$(git -C "$R" rev-list --count badges)"
rm -rf "$TMP/t1"; git clone -q --depth 1 --branch badges "file://$R" "$TMP/t1"
deploy t1
expect "no change, no commit" "$before" "$(git -C "$R" rev-list --count badges)"

setup t2; race t2 other/badge.json theirs
deploy t2; expect "race on another folder exits 0" 0 $?
expect "our badge survives" mine "$(show feat/badge.json)"
expect "their badge survives" theirs "$(show other/badge.json)"

setup t3; race t3 feat/badge.json theirs
deploy t3; expect "race on the same file exits 0" 0 $?
expect "latest run wins" mine "$(show feat/badge.json)"

setup t4; race t4 other/badge.json theirs always
deploy t4; expect "gives up after 5 rejected pushes" 1 $?
expect "badge is not published when giving up" "" "$(show feat/badge.json)"

exit $failed
