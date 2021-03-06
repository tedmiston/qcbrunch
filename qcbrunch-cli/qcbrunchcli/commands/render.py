import pathlib
import string
import subprocess
from os.path import join
from pprint import pprint

import click

from ..conf import BUILD_DIR, SOURCE_DIR
from ..events import load_events
from ..utils import get_git_date, load_data

@click.command()
@click.option('--show-diff', default=True, type=bool)
def render(show_diff):
    data = load_data()
    events_html = load_events()

    substitutions = {
        'events': events_html,
        'yelp__subscribers': data['yelp']['subscribers'],
        'yelp__subscribers_display': data['yelp']['subscribers-display'],
        'google_maps__views': data['google-maps']['views'],
        'google_maps__views_display': data['google-maps']['views-display'],
        'updated_date': get_git_date(),
    }
    pprint(substitutions, width=1)

    input_path = join(SOURCE_DIR, 'index.html')
    with open(input_path) as fp:
        template = string.Template(fp.read())

    output = template.safe_substitute(substitutions)

    pathlib.Path(BUILD_DIR).mkdir(exist_ok=True)
    output_path = join(BUILD_DIR, 'index.html')
    with open(output_path, 'w') as fp:
        fp.write(output)

    if show_diff:
        subprocess.run(f'diff {input_path} {output_path}', shell=True)
