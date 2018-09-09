# Contributing

QCBrunch is now deployed on Zeit Now.  It was previously hosted on GitHub Pages.

## Development

To run the site locally:

```
serve
```

To deploy:

```
now
```

To alias the prod domain to the latest deploy:

```
now alias qcbrunch-fbfjmiyzkx.now.sh qcbrunch.com
```

(Replace the first URL with the most recently deployed URL.)

TODO: can i get the domain alias stored in now.json?

## Notes

The package.json file is temporarily named package.json.ignore because its presence trips up Zeit Now into thinking this is a Node app instead of a static site.  It's not currently used but will be used in the future.
