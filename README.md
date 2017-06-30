Wercker step to register GitHub deploy keys
============================================

This wercker step add GitHub deploy keys to ssh config to allow clone private repositories on GitHub.

# Options

* `key1` ~ `key20` The names of the keys in environment values. You can specify keys up to 20.

# Example

``` yaml
build:
  steps:
    - add-github-deploy-keys:
        key1: FOO_REPO_DEPLOY_KEY
        key2: BAR_THER_REPO_DEPLOY_KEY
		  .
		  .
		  .
        key20: BAZ_REPO_DEPLOY_KEY
```

# Result

## ~/.ssh/config

```
Host github.com
    StrictHostKeyChecking no
    IdentityFile /tmp/tmp.IeIcKD
    IdentityFile /tmp/tmp.FbFoeJ
		  .
		  .
		  .
    IdentityFile /tmp/tmp.koEdmh
```
