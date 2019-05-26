from os.path import join

import yaml

from .conf import SOURCE_DIR

def load_data():
    with open(join(SOURCE_DIR, 'data.yaml')) as fp:
        return yaml.safe_load(fp)

def save_data(data):
    with open(join(SOURCE_DIR, 'data.yaml'), 'w') as fp:
        yaml.dump(data, fp)
