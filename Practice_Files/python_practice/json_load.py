import json

jsonString = '{ "id": 121, "name": "Naveen", "course": "MERN Stack"}'
student_details = json.loads(jsonString)

print(student_details)
print(student_details['name'])
print(student_details['course'])
