import json

with open("inventory.json") as f:
    inventory = json.load(f)

for item in inventory:
    item['status'] = "In Stock" if item['stock'] > 0 else "Out of Stock"

with open("inventory_updated.json", "w") as f:
    json.dump(inventory, f, indent=4)
