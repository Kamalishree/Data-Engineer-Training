# 1. Check if a number is prime

def is_prime(n):
    if n <= 1:
        return False
    for i in range(2, int(n ** 0.5) + 1):
        if n % i == 0:
            return False
    return True


# 2. Reverse a string and check palindrome

def check_palindrome():
    s = input("Enter a string: ")
    reversed_s = s[::-1]
    print("Reversed string:", reversed_s)
    if s == reversed_s:
        print("It's a palindrome.")
    else:
        print("Not a palindrome.")

check_palindrome()


# 3. Remove duplicates, sort, find second largest


def process_list(nums):
    nums = list(set(nums))  # Remove duplicates
    nums.sort()
    print("Sorted list without duplicates:", nums)
    if len(nums) >= 2:
        print("Second largest number:", nums[-2])
    else:
        print("Not enough elements to find second largest.")

process_list([4, 1, 2, 7, 2, 4, 8, 1])

# 4. Base class and derived class with override


class Person:
    def __init__(self, name, age):
        self.name = name
        self.age = age

    def display(self):
        print(f"Name: {self.name}, Age: {self.age}")


class Employee(Person):
    def __init__(self, name, age, employee_id, department):
        super().__init__(name, age)
        self.employee_id = employee_id
        self.department = department

    def display(self):
        super().display()
        print(f"Employee ID: {self.employee_id}, Department: {self.department}")


e = Employee("John", 30, "E123", "HR")
e.display()

# 5. Method overriding example

class Vehicle:
    def drive(self):
        print("Vehicle is moving")

class Car(Vehicle):
    def drive(self):
        print("Car is driving smoothly on the road")

c = Car()
c.drive()


# 6. Clean and save CSV

import pandas as pd

df = pd.read_csv("students.csv")
df['Age'].fillna(df['Age'].mean(), inplace=True)
df['Score'].fillna(0, inplace=True)
df.to_csv("students_cleaned.csv", index=False)


# 7. Convert cleaned CSV to JSON

df = pd.read_csv("students_cleaned.csv")
df.to_json("students.json", orient="records", indent=2)

# 8. Add Status and Tax_ID columns
import numpy as np

df = pd.read_csv("students_cleaned.csv")

def get_status(score):
    if score >= 85:
        return "Distinction"
    elif score >= 60:
        return "Passed"
    else:
        return "Failed"

df['Status'] = df['Score'].apply(get_status)
df['Tax_ID'] = df['ID'].apply(lambda x: f"TAX-{int(x)}")
df.to_csv("students_transformed.csv", index=False)

# 9. Increase prices by 10% in JSON

import json

with open("products.json") as f:
    products = json.load(f)

for product in products:
    product["price"] = round(product["price"] * 1.1, 2)

with open("products_updated.json", "w") as f:
    json.dump(products, f, indent=2)









