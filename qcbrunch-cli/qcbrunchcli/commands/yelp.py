import click

from ..utils import load_data, save_data

def get_subscribers():
    data = load_data()
    return data['yelp']['subscribers']

def set_subscribers(count):
    data = load_data()
    data['yelp']['subscribers'] = count
    save_data(data)

@click.group()
def yelp():
    pass

@yelp.command()
@click.option('--count', type=int, help='Collection subscribers count')
def subscribers(count):
    old_count = get_subscribers()
    if count is not None:
        set_subscribers(count)
        print(f'updated subscribers count from {old_count} to {count}')
    else:
        print(f'yelp.subscribers: {old_count}')
