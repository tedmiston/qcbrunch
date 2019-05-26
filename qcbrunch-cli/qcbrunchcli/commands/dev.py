import subprocess

import click

from ..conf import BUILD_DIR, SOURCE_DIR

@click.group()
def dev():
    pass

@dev.command()
def serve():
    subprocess.run('serve -l 5001', cwd=BUILD_DIR, shell=True)

@dev.command()
def run():
    subprocess.run('qcbrunch clean && qcbrunch render && qcbrunch build && qcbrunch dev serve', cwd=SOURCE_DIR, shell=True)
