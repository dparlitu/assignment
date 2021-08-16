#!/usr/bin/python3

import subprocess
import re
from urllib.request import urlopen

url = "https://urlhaus.abuse.ch/api/"
page = urlopen(url)
html = page.read().decode("utf-8")

# scrape page Title
pattern = "<title.*?>.*?</title.*?>"
match_results = re.search(pattern, html, re.IGNORECASE)
title = match_results.group()
title = re.sub("<.*?>", "", title) # Remove HTML tags

# scrape Header3 subtitle
pattern = "<h3.*?>.*?</h3.*?>"
match_results = re.search(pattern, html, re.IGNORECASE)
h3 = match_results.group()
h3 = re.sub("<.*?>", "", h3) # Remove HTML tags

# scrape paragraph
pattern = "<p.*?>.*?</p.*?>"
match_results = re.search(pattern, html, re.IGNORECASE)
p = match_results.group()
p = re.sub("<.*?>", "", p) # Remove HTML tags

print()
print(title)
print(h3)
print(p)
print()

subprocess.call(['sh', './viewMalUrl.sh'])




# https://realpython.com/python-web-scraping-practical-introduction/
# https://stackoverflow.com/questions/3777301/how-to-call-a-shell-script-from-python-code