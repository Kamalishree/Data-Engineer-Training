import pandas as pd

df = pd.read_csv("students.csv")
df.columns = df.columns.str.strip()  # Remove any hidden spaces

# Fill missing values (without future warning)
df['Age'] = df['Age'].fillna(df['Age'].mean())
df['Score'] = df['Score'].fillna(0)

df.to_csv("students_cleaned.csv", index=False)
print("students_cleaned.csv created successfully.")

df.to_json("students.json", orient='records', indent=4)
print("students.json created successfully.")


