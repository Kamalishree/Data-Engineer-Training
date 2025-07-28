import numpy as np
import pandas as pd

# Generate 20 random scores between 35 and 100
scores = np.random.randint(35, 101, size=20)

# Count above 75
count_above_75 = np.sum(scores > 75)

# Mean and Standard Deviation
mean = np.mean(scores)
std_dev = np.std(scores)

print("Scores:", scores)
print("Above 75:", count_above_75)
print("Mean:", mean)
print("Standard Deviation:", std_dev)

# Save to CSV
df = pd.DataFrame({'Score': scores})
df.to_csv("scores.csv", index=False)
