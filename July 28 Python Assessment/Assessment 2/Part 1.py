def factorial(n):
    result = 1
    for i in range(2, n+1):
        result *= i
    return result

# Example
print(factorial(5))



students = [("Aarav", 80), ("Sanya", 65), ("Meera", 92), ("Rohan", 55)]

# Names with score above 75
for name, score in students:
    if score > 75:
        print(name)

# Average score
total = sum(score for _, score in students)
average = total / len(students)
print("Average Score:", average)




