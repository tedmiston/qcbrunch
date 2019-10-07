import subprocess

import click

from ..conf import BUILD_DIR, COPY_URL, SOURCE_DIR

@click.group()
def dev():
    pass

@dev.command()
def serve():
    if COPY_URL:
        command = 'now dev --listen 5001'
    else:
        command = 'now dev --no-clipboard --listen 5001'
    subprocess.run(command, cwd=BUILD_DIR, shell=True)

@dev.command()
def run():
    subprocess.run('qcbrunch clean && qcbrunch render && qcbrunch build && qcbrunch dev serve', cwd=SOURCE_DIR, shell=True)
