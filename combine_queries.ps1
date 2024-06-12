# Initialize an empty array to hold all the queries
$combinedQuery = @{
    "bool" = @{
        "should" = @()
    }
}

# Get all JSON files in the current directory
$jsonFiles = Get-ChildItem -Path . -Filter *.json

# Loop through all JSON files
foreach ($file in $jsonFiles) {
    # Read the content of the file
    $content = Get-Content $file.FullName | ConvertFrom-Json
    # Add the query from this file to the combined query
    $combinedQuery.bool.should += $content
}

# Convert the combined query to JSON
$combinedQueryJson = $combinedQuery | ConvertTo-Json -Depth 100

# Save the combined query to a new JSON file
$combinedQueryJson | Out-File -FilePath combined_query.json.txt