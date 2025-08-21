class Car:
    def start(self):
        print("Car started")

my_car = Car()
my_car.start()

class Demo:
    def __init__(self):
        self.public_var = "Public"
        self._protected_var = "Protected"
        self.__private_var = "Private"

    def show(self):
        print(self.__private_var)

obj = Demo()
print(obj.public_var)       # Public
print(obj._protected_var)   # Protected
# print(obj.__private_var)  # Error
obj.show()                  # Accessing private via method

class Person:
    def __init__(self, name, age):
        self.name = name
        self.age = age

    def display(self):
        print(f"Name: {self.name}, Age: {self.age}")

p1 = Person("Alice", 25)
p1.display()

class Animal:
    def sound(self):
        print("Animal makes a sound")

class Dog(Animal):
    def bark(self):
        print("Dog barks")

d = Dog()
d.sound()
d.bark()

class Cat:
    def sound(self):
        print("Meow")

class Cow:
    def sound(self):
        print("Moo")

def animal_sound(animal):
    animal.sound()

animal_sound(Cat())
animal_sound(Cow())

class Parent:
    def show(self):
        print("Parent class method")

class Child(Parent):
    def show(self):
        print("Child class method")

c = Child()
c.show()

# Write to a file
with open("example.txt", "w") as f:
    f.write("Hello, File Handling!")

# Read from a file
with open("example.txt", "r") as f:
    content = f.read()
    print("File Content:", content)

try:
    num = int("abc")  
except ValueError as e:
    print("Error occurred:", e)
finally:
    print("This block always executes")


