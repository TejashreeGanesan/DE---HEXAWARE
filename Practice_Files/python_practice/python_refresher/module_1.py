#Writing and Running First Program
print("Hello world!")

#Keywords & Identifiers
print("\n Keywords & Identifiers")
import keyword
print(keyword.kwlist) #this will list the keywords in python

a = 10 #a is identifier

#Variables & Operators
print("\n Variables & Operators")
x = 10
y = 5
sum_val = x +y
diff_val = x - y
prod_val = x * y
div_val = x/y
mod_val = x % y
power_val = x ** y
print(f"Sum: {sum_val}, Sub: {diff_val}, Multiplication: {prod_val}, "
      f"Division: {div_val}, Module: {mod_val}, Power: {power_val}")

#Data Types
print("\n Data Types")
print("=== Numeric Types ===")
a = 10 #int
b = 3.14 #float
c = 2 + 3j #complex

print("Integer a:", a)
print("Float b:", b)
print("Complex c:", c)
print("Real part of c:", c.real)
print("Imaginary part of c:", c.imag)

print("\n=== Sequence Types ===")
text = "Hello"     # string
numbers = [1, 2, 3]   # list
points = (4, 5, 6)     # tuple
range_vals = range(5)  # range

print("String text:", text)
print("First letter of text:", text[0])
print("List numbers:", numbers)
print("Second number:", numbers[1])
print("Tuple points:", points)
print("Range values:", list(range_vals))

# Boolean Type
print("\n=== Boolean Type ===")
is_valid = True
is_greater = a > b
is_equal = a == 10

print("Boolean is_valid:", is_valid)
print("Is a > b?", is_greater)
print("Is a == 10?", is_equal)


