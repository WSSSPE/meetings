#!/usr/bin/env python
import re, operator

# set to 'name' for hyperlinking email address with name,
# 'column' for a column, and
# 'off' for no email.
email = 'email'

people = []
with open('participants.txt', 'r') as f:
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
    if email == 'column':
      print(person['name'] + ' & ' +
            r'\href{mailto:' + person['email'] + r'}{' +
            person['email'] + r'} & ' +
            person['institution'] + r'\\'
           )
    elif email == 'off':
        print(person['name'] + ' & ' + person['institution'] + r'\\')
    elif email == 'email':
        print(person['email'] + ',')
    elif email == 'name':
        print(r'\href{mailto:' + person['email'] + r'}{' +
              person['name'] + r'} & ' +
              person['institution'] + r'\\'
             )
