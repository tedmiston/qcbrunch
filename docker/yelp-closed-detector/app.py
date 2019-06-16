#!/usr/bin/env python3

import sys

from requests_html import HTMLSession

yelp_urls = [
    "https://www.yelp.com/biz/blackbird-eatery-cincinnati",  # closed
    "https://www.yelp.com/biz/the-rook-otr-cincinnati-2",  # closed
    "https://www.yelp.com/biz/tuckers-restaurant-cincinnati-2",  # open
    "https://www.yelp.com/biz/urbana-cafe-cincinnati-3",  # open
]

# get open / closed statuses from yelp
session = HTMLSession()
is_closed = {}
for url in yelp_urls:
    response = session.get(url)
    if not response.ok:
        print("bad response")
        sys.exit(1)
    title = response.html.find("title", first=True).text
    is_closed[url] = "CLOSED" in title

# summarize results
closed_urls = [k for (k, v) in is_closed.items() if v]
closed_count = len(closed_urls)
open_count = len(is_closed) - closed_count
total_count = len(is_closed)
closed_urls_str = "\n- ".join(closed_urls)
summary = f"""
Closed Count: {closed_count}
Open Count:   {open_count}
Total Count:  {total_count}

Closed URLs:
- {closed_urls_str}
""".strip()

print("* summary:")
print(summary)
