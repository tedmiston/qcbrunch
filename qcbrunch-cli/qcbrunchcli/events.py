import json
from os.path import join

from .conf import SOURCE_DIR

def load_events():
    with open(join(SOURCE_DIR, 'events/output.html')) as fp:
        events_html = fp.read()
        return events_html
