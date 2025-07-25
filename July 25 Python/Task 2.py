# 1. BMI Calculator
import math

def calculate_bmi(weight, height):
    bmi = weight / math.pow(height, 2)
    if bmi < 18.5:
        return "Underweight"
    elif 18.5 <= bmi <= 24.9:
        return "Normal"
    else:
        return "Overweight"

weight = float(input("Enter your weight (kg): "))
height = float(input("Enter your height (m): "))
result = calculate_bmi(weight, height)
print("You are:", result)


# 2. Strong Password Check
import string

special_chars = "!@#$"

while True:
    password = input("Enter a strong password: ")
    if (any(c.isupper() for c in password) and
        any(c.isdigit() for c in password) and
        any(c in special_chars for c in password)):
        print("Password is strong!")
        break
    else:
        print("Password must have at least 1 uppercase letter, 1 digit, and 1 special character (!@#$). Try again.")


# 3. Weekly Expense Calculator
def analyze_expenses(expenses):
    total = sum(expenses)
    average = total / len(expenses)
    highest = max(expenses)
    print("Total spent:", total)
    print("Average per day:", average)
    print("Highest spend in a day:", highest)

expenses = []
for i in range(7):
    amt = float(input(f"Enter expense for day {i+1}: "))
    expenses.append(amt)

analyze_expenses(expenses)

# 4.Guess the Number

import random

secret = random.randint(1, 50)

for i in range(5):
    guess = int(input("Guess the number (1-50): "))
    if guess == secret:
        print("Correct! You guessed it.")
        break
    elif guess < secret:
        print("Too Low.")
    else:
        print("Too High.")
else:
    print("Sorry! Out of chances. The number was:", secret)

# 5. Student Report Card

import datetime

def total_and_average(marks):
    total = sum(marks)
    average = total / len(marks)
    return total, average

def grade(average):
    if average >= 90:
        return "A"
    elif average >= 70:
        return "B"
    else:
        return "C"

name = input("Enter student name: ")
marks = [float(input(f"Enter mark for subject {i+1}: ")) for i in range(3)]

total, avg = total_and_average(marks)
print("Total:", total)
print("Average:", avg)
print("Grade:", grade(avg))
print("Date:", datetime.date.today())

# 6.Contact Saver
contacts = {}

while True:
    print("\n1. Add Contact\n2. View Contacts\n3. Save & Exit")
    choice = input("Enter choice: ")

    if choice == "1":
        name = input("Enter name: ")
        phone = input("Enter phone number: ")
        contacts[name] = phone

    elif choice == "2":
        for name, phone in contacts.items():
            print(f"{name} : {phone}")

    elif choice == "3":
        with open("contacts.txt", "w") as f:
            for name, phone in contacts.items():
                f.write(f"{name}:{phone}\n")
        print("Contacts saved to contacts.txt")
        break

    else:
        print("Invalid choice. Try again.")
