from requests_html import HTML, HTMLSession

session = None

def place_serializer(biz):
    return {'name': biz.text, 'url': list(biz.absolute_links)[0]}

def get_page_urls(initial_offset, total_count, page_size):
    """Get pages 2 and beyond."""
    url_template = 'https://www.yelp.com/collection/user/rendered_items?collection_id=Ntw8wQeFY35dpevGB-Et_A&offset={}&sort_by=alpha'
    return [url_template.format(x) for x in range(initial_offset, total_count, page_size)]

def get_places_from_page(url):
    """Extract places from pages 2 and beyond."""
    print(f'* fetching page {url}')
    html = HTML(html=session.get(url).json()['list_markup'])
    return [place_serializer(biz) for biz in html.find('a.biz-name')]

def get_initial_yelp_collection_places():
    """Get places from page 1."""
    global session
    print('* fetching first page')
    session = HTMLSession()
    response = session.get('https://www.yelp.com/collection/Ntw8wQeFY35dpevGB-Et_A?sort_by=alpha')
    return [place_serializer(biz) for biz in response.html.find('a.biz-name')]

def get_all_yelp_place_urls():
    all_places = get_initial_yelp_collection_places()
    # TODO: pull total count dynamically
    for url in get_page_urls(initial_offset=30, total_count=129, page_size=30):
        all_places.extend(get_places_from_page(url))
    for x in all_places:
        print(x['url'])
    return [x['url'] for x in all_places]
