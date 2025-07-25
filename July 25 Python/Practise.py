# print("hello")
#
# name = input("What is your name? ")
#
# greeting ="hello ram..."
# print(greeting)
# # print (greeting[0])
# # print (greeting[-1])
#
# print(greeting.upper())
#
# # Declaring a list
# fruits = ["apple", "banana", "cherry"]
#
# # Accessing elements
# print(fruits[1])        # banana
#
# # Adding elements
# fruits.append("orange")
# print(fruits)           # ['apple', 'banana', 'cherry', 'orange']
#
# # Removing elements
# fruits.remove("banana")
# print(fruits)           # ['apple', 'cherry', 'orange']
#
# # Slicing
# print(fruits[1:])       # ['cherry', 'orange']
#
# # Looping
# for fruit in fruits:
#     print(fruit)
#
#
# # Declaring a tuple
# colors = ("red", "green", "blue")
#
# # Accessing elements
# print(colors[0])         # red
#
# # Slicing
# print(colors[1:3])       # ('green', 'blue')
#
# # Tuple is immutable
# # colors[0] = "yellow"   # This line will raise an error: TypeError
# movie = "The Lion King"
# print(movie[4:8])   # Output: Lion
#
# foods = ["pizza", "biryani", "pasta", "dosa"]
#
# # Add one more
# foods.append("burger")
#
# # Remove the 2nd item (index 1)
# foods.pop(1)
#
# # Print the final list
# print(foods)   # Output will be something like: ['pizza', 'pasta', 'dosa', 'burger']
#
# numbers = (10, 20, 30)
#
# # Accessing the last number
# print(numbers[-1])   # Output: 30
#
#
#
# # Age eligibility checker
# age = int(input("Enter your age: "))
#
# if age >= 18:
#     print("You can vote!")
# else:
#     print("You are too young to vote.")
#
# # Grade calculator
# marks = int(input("Enter your marks: "))
#
# if marks >= 90:
#     print("Grade A")
# elif marks >= 75:
#     print("Grade B")
# elif marks >= 50:
#     print("Grade C")
# else:
#     print("Grade F")
#
# count = 1
# while count <= 5:
#     print ("count is:",count)
#     count += 1
# # Loop 1: i from 0 to 4
# for i in range(5):  # 0 to 4
#     print("Number:", i)
#
# # Loop 2: i from 1 to 5
# for i in range(1, 6):  # 1 to 5
#     print(i)
#
# # Loop 3: demonstrate continue and break
# for i in range(1, 10):
#     if i == 5:
#         continue  # skips 5
#     if i == 8:
#         break  # stops at 8
#     print(i)
#
# def greet():
#     print("Hello from Hexaware")
# greet()
#
# # Function to greet user
# def greet_user(name):
#     print(f"Hello, {name}! Welcome.")
#
# greet_user("Kamali")
#
# ###############################
#
# # Function to add two numbers
# def add(a, b):
#     return a + b
#
# result = add(a=10, b=5)
# print("Sum is:", result)
#
# ###############################
#
# # Function to calculate power
# def power(base, exponent=2):
#     return base ** exponent
#
# print(power(5))                  # 25
# print(power(base=5, exponent=3)) # 125
#
# name = "Kamali"
# print(len(name))
#
# print(len("name"))         # 4
#
# print(type(5))             # <class 'int'>
# print(type("Hello"))       # <class 'str'>
#
# age = "12"
# print(int(age) + 5)        # 17

# name = input("Enter name: ")
# print("Hello", name)

nums = [5, 9, 3]
print(sum(nums))           # 17
print(max(nums))           # 9
print(min(nums))           # 3

names = ["Zara", "Amin", "Lina"]
print(sorted(names))       # ['Amin', 'Lina', 'Zara']

print(abs(-9))             # 9

print(round(3.75))         # 4
print(round(3.7567, 2))    # 3.76


import math

import math

print(math.sqrt(16))  # 4.0
print(math.pow(2, 3))  # 8.0
print(math.pi)  # 3.14159...
# 3.14159...

# Module is a Collection of Functions

###############################################

import datetime as d

today = d.date.today()
print("Today's date is:", today)

now = d.datetime.now()
print("Current time is:", now.strftime("%H:%M:%S"))

def add(a,b):
    return a+b;
