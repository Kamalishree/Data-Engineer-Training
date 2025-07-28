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