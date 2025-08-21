#if statement
print("\n=== if statement ===")
x = 20
if x > 10:
    print("X is greater than 10")

#If-Else Statement
print("\n=== If-Else Statement ===")
x = 3
if x > 5:
    print("x is greater than 5")
else:
    print("x is not greater than 5")

#If-Elif-Else Statement
print("\n=== If-Elif-Else Statement ===")
x = 5
if x > 5:
    print("x is greater than 5")
elif x == 5:
    print("x is equal to 5")
else:
    print("x is less than 5")

#control structure
print("\n=== For loop ===")
for x in "Tejashree":
  print(x)

print("\n=== While loop ===")
count = 0
while (count < 3):
    count = count + 1
    print("Hello World")

print("\n=== Nested loop ===")
x = [1, 5]
y = [3, 5]

for i in x:
  for j in y:
    print(i, j)

print("\n Break Statement")
for i in range(5):
    if i == 3:
        break   
    print(i)

print("\nContinue Statement")
for i in range(5):
    if i == 3:
        continue  
    print(i)

print("\nPass Statement")
for i in range(5):
    if i == 3:
        pass  
    print(i)


print("\nInput and Output")
name = input("Enter your name: ")
print("Hello,", name, "Welcome!")
