import subprocess

import click

from ..conf import SOURCE_DIR

@click.command()
def build():
    directories = ' '.join([
        # vercel
        '.vercel',

        # site main
        'css',
        'images',
        'js',
    ])
    files = ' '.join([
        # vercel
        '.vercelignore',
        'vercel.json',

        # site meta
        'browserconfig.xml',
        'robots.txt',
        'sitemap.txt',

        # site main
        'stats.html',
    ])
    subprocess.run(f'cp -R {directories} {files} build/', cwd=SOURCE_DIR, shell=True)
