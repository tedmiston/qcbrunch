import subprocess

import click

from ..conf import SOURCE_DIR

@click.command()
def build():
    directories = '.now css images js'
    files = '.nowignore browserconfig.xml robots.txt sitemap.txt stats.html'
    subprocess.run(f'cp -R {directories} {files} build/', cwd=SOURCE_DIR, shell=True)
