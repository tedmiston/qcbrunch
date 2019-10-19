import subprocess

import click

from ..conf import BUILD_DIR, SOURCE_DIR

@click.command()
def clean():
    # TODO: clean events build
    subprocess.run(f'rm -rf {BUILD_DIR}', cwd=SOURCE_DIR, shell=True)
