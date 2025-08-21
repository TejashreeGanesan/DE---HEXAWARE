import my_module

#Python Modules
import math
print("Square root of 16:", math.sqrt(16))
print("Value of pi:", math.pi)

#user defined modules
print(my_module.greet("Alice"))

def greet(name):
    return f"Hello, {name}!"

if __name__ == "__main__":
    print("Module executed directly")
    print(greet("Alice"))

#standard modules
import random
print("Random number (1-10):", random.randint(1, 10))
