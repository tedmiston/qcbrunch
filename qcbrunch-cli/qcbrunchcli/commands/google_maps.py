import click

from ..utils import load_data, save_data

def get_views():
    data = load_data()
    return data['google-maps']['views']

def set_views(count):
    data = load_data()
    data['google-maps']['views'] = count
    save_data(data)

@click.group()
def google_maps():
    pass

@google_maps.group()
def views():
    pass

@views.command()
def get():
    print('google-maps.views:', get_views())

@views.command()
@click.argument('count', type=int)
def set(count):
    old_count = get_views()
    set_views(count)
    print(f'updated views count from {old_count} to {count}')
