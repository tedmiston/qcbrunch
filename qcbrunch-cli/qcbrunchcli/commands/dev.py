import subprocess

import click

from ..conf import BUILD_DIR, SOURCE_DIR

@click.group()
def dev():
    pass

@dev.command()
def build():
    directories = 'css images js'
    files = '.nowignore browserconfig.xml now.json robots.txt serve.json sitemap.txt stats.html'
    subprocess.run(f'cp -R {directories} {files} build/', cwd=SOURCE_DIR, shell=True)

@dev.command()
def run():
    # subprocess.run('make run', cwd=BUILD_DIR, shell=True)
    subprocess.run('serve -l 5001', cwd=BUILD_DIR, shell=True)
