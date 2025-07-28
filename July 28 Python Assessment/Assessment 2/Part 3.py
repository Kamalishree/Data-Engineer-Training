import pandas as pd

df = pd.read_csv("orders.csv")

# Fill missing values
df['CustomerName'] = df['CustomerName'].fillna('Unknown')
df['Quantity'] = df['Quantity'].fillna(0)
df['Price'] = df['Price'].fillna(0)

# Add TotalAmount
df['TotalAmount'] = df['Quantity'] * df['Price']

# Save cleaned file
df.to_csv("orders_cleaned.csv", index=False)
