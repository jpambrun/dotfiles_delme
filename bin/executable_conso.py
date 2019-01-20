#!/usr/bin/env python
import re
import urllib.request

param    = { 'actions' : 'list',
             'DELETE_lng' : 'en',
             'lng' : 'en',
             'code' : 'VLGMBOLP'}

encparam = urllib.parse.urlencode(param).encode('utf-8')

data     = urllib.request.urlopen("http://conso.ebox.ca/index.php", encparam ).read().decode("utf-8")

regex = re.compile('(?<=drawChart\()\d{1,}\.\d{1,}(?=, \d{1,})')
print(re.search(regex, data).group(0))

