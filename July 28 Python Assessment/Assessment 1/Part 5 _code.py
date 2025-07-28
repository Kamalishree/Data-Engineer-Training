import json

# Step 1: Read the products.json
with open("products.json", "r") as f:
    products = json.load(f)

# Step 2: Increase price by 10%
for item in products:
    item['price'] = round(item['price'] * 1.10, 2)  # rounding to 2 decimal places

# Step 3: Save updated data
with open("products_updated.json", "w") as f:
    json.dump(products, f, indent=4)

print("products_updated.json created successfully.")
