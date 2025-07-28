import pandas as pd
import numpy as np

# Load cleaned data
df = pd.read_csv("students_cleaned.csv")

# Add 'Status' column
def get_status(score):
    if score >= 85:
        return 'Distinction'
    elif score >= 60:
        return 'Passed'
    else:
        return 'Failed'

df['Status'] = df['Score'].apply(get_status)

# Add 'Tax_ID' column
df['Tax_ID'] = df['ID'].apply(lambda x: f"TAX-{x}")

# Save to new file
df.to_csv("students_transformed.csv", index=False)

# Show output
print("students_transformed.csv created with Status and Tax_ID columns.")
print(df)
