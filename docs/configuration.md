$PACKAGE_NAME contain the job build stage for all rollup-umd project.

You can run the build stage by doing:

```bash
npx $PACKAGE_NAME
```

It should be installed as a `devDependencies` so we can follow the version used by the rollup-umd project.

It is also automatically removed if the package goes public.

To use it, just use the script within your `.travis.yml`:


```yml
jobs:
  include:

    # Job: Build
    - stage: build
      node_js:
        - 'lts/*'
        - '10'
        - '8'
      script:
        - npx $PACKAGE_NAME
```
