#!/usr/bin/python3

import subprocess
import re
from urllib.request import urlopen

url = "https://feodotracker.abuse.ch/blocklist/"
page = urlopen(url)
html = page.read().decode("utf-8")

# scrape page Title
pattern = "<title.*?>.*?</title.*?>"
match_results = re.search(pattern, html, re.IGNORECASE)
title = match_results.group()
title = re.sub("<.*?>", "", title) # Remove HTML tags

# scrape Header2 subtitle
pattern = "<h2.*?>.*?</h2.*?>"
match_results = re.search(pattern, html, re.IGNORECASE)
h2 = match_results.group()
h2 = re.sub("<.*?>", "", h2) # Remove HTML tags

# scrape Header2 subtitle
pattern = "<p.*?>.*?</p.*?>"
match_results = re.search(pattern, html, re.IGNORECASE)
p = match_results.group()
p = re.sub("<.*?>", "", p) # Remove HTML tags

print()
print(title)
print(h2)
print(p)
print()

subprocess.call(['sh', './viewIPblock.sh'])




# https://realpython.com/python-web-scraping-practical-introduction/
# https://stackoverflow.com/questions/3777301/how-to-call-a-shell-script-from-python-code