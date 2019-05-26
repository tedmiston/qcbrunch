import click

from . import conf
from .commands import clean, dev, google_maps, render, yelp

@click.group()
def cli():
    pass

cli.add_command(clean)
cli.add_command(dev)
cli.add_command(google_maps)
cli.add_command(render)
cli.add_command(yelp)
