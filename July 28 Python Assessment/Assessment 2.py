# 1. Factorial using loop
def factorial(n):
    result = 1
    for i in range(2, n + 1):
        result *= i
    return result

print(factorial(5))  # Example


# 2. List of student tuples

students = [("Aarav", 80), ("Sanya", 65), ("Meera", 92), ("Rohan", 55)]

# Print names with score > 75
print("Students scoring above 75:")
for name, score in students:
    if score > 75:
        print(name)

# Calculate average score
total_score = sum(score for _, score in students)
average = total_score / len(students)
print("Average score:", average)

# 3. BankAccount class

class BankAccount:
    def __init__(self, holder_name, balance=0):
        self.holder_name = holder_name
        self.balance = balance

    def deposit(self, amount):
        self.balance += amount

    def withdraw(self, amount):
        if amount > self.balance:
            raise Exception("Insufficient balance")
        self.balance -= amount


# 4. SavingsAccount class

class SavingsAccount(BankAccount):
    def __init__(self, holder_name, balance, interest_rate):
        super().__init__(holder_name, balance)
        self.interest_rate = interest_rate

    def apply_interest(self):
        self.balance += self.balance * (self.interest_rate / 100)


# 5. Clean orders.csv using Pandas

import pandas as pd

df = pd.read_csv("orders.csv")

df['CustomerName'].fillna('Unknown', inplace=True)
df['Quantity'].fillna(0, inplace=True)
df['Price'].fillna(0, inplace=True)

df['TotalAmount'] = df['Quantity'] * df['Price']

df.to_csv("orders_cleaned.csv", index=False)


# 6. Update inventory.json with stock status

import json

with open("inventory.json") as f:
    inventory = json.load(f)

for item in inventory:
    item["status"] = "In Stock" if item["stock"] > 0 else "Out of Stock"

with open("inventory_updated.json", "w") as f:
    json.dump(inventory, f, indent=2)


# 7. Random scores and stats

import numpy as np
import pandas as pd

scores = np.random.randint(35, 101, size=20)

above_75 = np.sum(scores > 75)
mean_score = np.mean(scores)
std_dev = np.std(scores)

print("Scores:", scores)
print("Count > 75:", above_75)
print("Mean:", mean_score)
print("Standard Deviation:", std_dev)

df_scores = pd.DataFrame({"Score": scores})
df_scores.to_csv("scores.csv", index=False)
