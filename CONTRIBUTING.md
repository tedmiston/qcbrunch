# Contributing

QCBrunch is now deployed on Zeit Now.  It was previously hosted on GitHub Pages.

## Add a Place

To add a place, fill out as much info as possible using [TEMPLATE.html](https://github.com/tedmiston/qcbrunch/blob/master/TEMPLATE.html) to match what other listings have already in index.html, then submit as an issue or pull request.

## Development

To run the site locally:

```
serve
```

To deploy:

```
now
```

To point prod to the latest deploy:

```
now alias
```

## Notes

The package.json file is temporarily named package.json.ignore because its presence trips up Zeit Now into thinking this is a Node app instead of a static site.  It's not currently used but will be used in the future.
