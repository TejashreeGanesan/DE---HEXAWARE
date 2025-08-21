# Square each number in a list
numbers = [1, 2, 3, 4, 5]
squares = map(lambda x: x ** 2, numbers)
print("Mapping Function (squares):", list(squares))

#String Functions
text = "  hello world  "
print("Uppercase:", text.upper())
print("Lowercase:", text.lower())
print("Title:", text.title())
print("Strip (remove spaces):", text.strip())
print("Replace:", text.replace("world", "Python"))
print("Split:", text.split())

x = -10
y = 3.14
print("Absolute value:", abs(x))
print("Round:", round(y))
print("Power:", pow(2, 3))  # 2^3
print("Max:", max(10, 20, 5))
print("Min:", min(10, 20, 5))

from datetime import datetime, timedelta

now = datetime.now()
print("Current Date & Time:", now)
print("Formatted Date:", now.strftime("%Y-%m-%d %H:%M:%S"))
yesterday = now - timedelta(days=1)
print("Yesterday:", yesterday.date())


def greet(name):
    return f"Hello, {name}!"

print(greet("Alice"))

def power(base, exponent=2):  # default exponent = 2
    return base ** exponent

print("Default Argument (5^2):", power(5))
print("Custom Argument (5^3):", power(5, 3))

def describe_person(name, age):
    print(f"Name: {name}, Age: {age}")

describe_person(age=25, name="John")  # Order doesn't matter with keyword args
