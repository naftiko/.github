# Badges deploy

Pushes badge JSON files to the `badges` branch of the calling repository. A rejected push (a
concurrent run pushed first) is retried up to 5 times: fetch, rebase, push. On a clash on the same
file, the latest run wins.

A `concurrency` group is not an alternative: GitHub keeps one running and one pending job per
group and cancels the others, so a pending run silently loses its badges and PR comment.

Pin by commit SHA. The caller's workflow needs `contents: write`.

```yaml
- uses: naftiko/.github/.github/actions/deploy-badges@<sha> # naftiko/.github#<PR>
  with:
    source-dir: badges-output   # default
```

Tests (offline, bash + git): `bash .github/actions/deploy-badges/tests/run-tests.sh`
