import json

with open('datas.json') as JsonFile:
    data = json.load(JsonFile)

#print(data['people1'])
    
for person in data['people1']:
    print("Name:", person['name'])
    print("Website:", person['website'])
    print("From:", person['from'])
