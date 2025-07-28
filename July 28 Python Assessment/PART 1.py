###Prime Number Function
def is_prime(n):
    if n <= 1:
        return False
    for i in range(2, int(n**0.5)+1):
        if n % i == 0:
            return False
    return True

#Palindrome Checker
s = input("Enter a string: ")
reversed_s = s[::-1]
print("Palindrome" if s == reversed_s else "Not a palindrome")

# List Processing
nums = [10, 20, 30, 20, 10, 40, 50]
unique_sorted = sorted(set(nums))
print("Second largest:", unique_sorted[-2])