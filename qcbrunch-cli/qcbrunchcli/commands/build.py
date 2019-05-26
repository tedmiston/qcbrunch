import subprocess

import click

from ..conf import SOURCE_DIR

@click.command()
def build():
    directories = 'css images js'
    files = '.nowignore browserconfig.xml now.json robots.txt serve.json sitemap.txt stats.html'
    subprocess.run(f'cp -R {directories} {files} build/', cwd=SOURCE_DIR, shell=True)
