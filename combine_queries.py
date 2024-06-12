import os
import json

# Initialize an empty list to hold all the queries
combined_query = {
    "bool": {
        "should": []
    }
}

# Loop through all files in the current directory
for filename in os.listdir('.'):
    # Check if the file is a JSON file
    if filename.endswith('.json'):
        # Open the file
        with open(filename, 'r') as file:
            # Load the JSON data from the file
            data = json.load(file)
            # Add the query from this file to the combined query
            combined_query["bool"]["should"].append(data)

# Save the combined query to a new JSON file
with open('combined_query.json.txt', 'w') as outfile:
    json.dump(combined_query, outfile, indent=4)
