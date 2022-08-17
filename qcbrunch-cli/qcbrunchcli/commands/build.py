import subprocess

import click

from ..conf import SOURCE_DIR

@click.command()
def build():
    directories = '.vercel css images js'
    files = '.vercelignore browserconfig.xml robots.txt sitemap.txt stats.html vercel.json'
    subprocess.run(f'cp -R {directories} {files} build/', cwd=SOURCE_DIR, shell=True)
