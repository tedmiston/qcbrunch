import subprocess
from os.path import join

import yaml

from .conf import SOURCE_DIR

def load_data():
    with open(join(SOURCE_DIR, 'data.yaml')) as fp:
        return yaml.safe_load(fp)

def save_data(data):
    with open(join(SOURCE_DIR, 'data.yaml'), 'w') as fp:
        yaml.dump(data, fp)

def get_git_date():
    result = subprocess.run(
        'git log -1 --date=format:"%B %Y" --format="%ad"',
        cwd=SOURCE_DIR,
        shell=True,
        capture_output=True,
    )
    date = result.stdout.strip().decode()
    assert date != ''
    return date
