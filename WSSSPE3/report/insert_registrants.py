#!/usr/bin/env python
import re, operator

with open("registrants.txt", 'r') as f:
  people = []
  person = {}
  for line in f:
    if 'institution: ' in line:
      person['institution'] = re.search('institution: (.*)', line).group(1).replace('&', r'\&')
    elif 'email: ' in line:
      person['email'] = re.search('email: (.*)', line).group(1)
    elif len(line) > 2:
      person['name'] = line[:-1].replace('&', r'\&')
    else:
      people.append(person)
      person = {}
if 'name' in person:
  people.append(person)

for person in sorted(people, key=lambda x: x['name'].split()[-1]):
  print(person['name'] + ' & ' + person['institution'] + r'\\')
