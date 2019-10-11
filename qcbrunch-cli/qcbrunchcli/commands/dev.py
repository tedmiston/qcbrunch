import subprocess

import click

from ..conf import BUILD_DIR, COPY_URL, SOURCE_DIR

@click.group()
def dev():
    pass

@dev.command()
def serve():
    if COPY_URL:
        command = 'now dev --listen 3000'
    else:
        # TODO: re-add `--no-clipboard` here once now bug is fixed where it doesn't break without auth
        # command = 'now --no-clipboard dev --listen 3000'
        command = 'now dev --listen 3000'
    subprocess.run(command, cwd=BUILD_DIR, shell=True)

@dev.command()
def run():
    subprocess.run('qcbrunch clean && qcbrunch render && qcbrunch build && qcbrunch dev serve', cwd=SOURCE_DIR, shell=True)
