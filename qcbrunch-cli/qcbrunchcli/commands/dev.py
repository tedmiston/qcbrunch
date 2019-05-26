import subprocess

import click

from ..conf import BUILD_DIR

@click.group()
def dev():
    pass

@dev.command()
def run():
    # subprocess.run('make run', cwd=BUILD_DIR, shell=True)
    subprocess.run('serve -l 5001', cwd=BUILD_DIR, shell=True)
