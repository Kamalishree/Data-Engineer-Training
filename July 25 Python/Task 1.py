# 1. FizzBuzz Challenge
for i in range(1, 51):
    if i % 3 == 0 and i % 5 == 0:
        print("FizzBuzz")
    elif i % 3 == 0:
        print("Fizz")
    elif i % 5 == 0:
        print("Buzz")
    else:
        print(i)
# 2. Login Simulation
for attempt in range(3):
    username = input("Enter username: ")
    password = input("Enter password: ")
    if username == "admin" and password == "1234":
        print("Login successful")
        break
else:
    print("Account Locked")

# 3. Palindrome Checker
word = input("Enter a word: ")
if word == word[::-1]:
    print("Palindrome")
else:
    print("Not a palindrome")


# 4. Prime Numbers in a Range
n = int(input("Enter a number: "))
for num in range(2, n+1):
    for i in range(2, int(num**0.5)+1):
        if num % i == 0:
            break
    else:
        print(num, end=" ")


# 5. Star Pyramid
n = int(input("Enter number of rows: "))
for i in range(1, n+1):
    print('*' * i)


# 6. Sum of Digits

num = input("Enter a number: ")
total = sum(int(digit) for digit in num)
print("Sum of digits:", total)

# 7. Multiplication Table Generator
num = int(input("Enter a number: "))
for i in range(1, 11):
    print(f"{num} x {i} = {num * i}")

# 8. Count Vowels in a String
sentence = input("Enter a sentence: ").lower()
vowels = "aeiou"
count = sum(1 for char in sentence if char in vowels)
print("Number of vowels:", count)

