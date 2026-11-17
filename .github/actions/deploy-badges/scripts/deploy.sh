#!/usr/bin/env bash
# Push the badge files to the badges branch, retrying when a concurrent run pushed first.
# Env: SOURCE_DIR (badge files), BRANCH_DIR (checkout of the badges branch), GITHUB_SHA.
set -euo pipefail

SOURCE_DIR="$(cd "${SOURCE_DIR:?}" && pwd)"
cd "${BRANCH_DIR:?}"

cp -R "$SOURCE_DIR/." .  # adds or overwrites the published files, keeps the others
git config user.name 'github-actions[bot]'
git config user.email 'github-actions[bot]@users.noreply.github.com'
git add -A
git diff --cached --quiet && { echo "No badge change to deploy."; exit 0; }
git commit -q -m "deploy: ${GITHUB_SHA:-manual}"

for attempt in 1 2 3 4 5; do
  git push origin HEAD:badges && exit 0
  echo "::warning::Push rejected (attempt $attempt/5), rebasing on the remote branch."
  git fetch -q origin badges
  git rebase -X theirs origin/badges  # same file in both runs: the latest run wins
  sleep $((attempt * ${RETRY_DELAY:-2}))
done
echo "::error::Could not push to the badges branch after 5 attempts."
exit 1
