# QCBrunch Gen

Generate a new place to add to QCBrunch.

---

Add a new place following prompts.

```
cookiecutter place-cc
```

Add a new place overriding with `data.yaml` config and writing to a dir inside `output/`.

```
cookiecutter place-cc --output-dir=output --config-file=data.yaml && cat output/**/*.html
```

Example data.yaml:

```
default_context:
    slug: my-slug
```
