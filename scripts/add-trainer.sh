#!/bin/bash

# Script to help create a new trainer profile
# Usage: ./scripts/add-trainer.sh

set -e

echo "============================================"
echo "  Add New Trainer Profile"
echo "============================================"
echo ""

# Get trainer information
read -p "Trainer's full name: " name
read -p "Position/Title: " position
read -p "Short bio (optional): " bio
read -p "Email (optional): " email
read -p "GitHub username (optional): " github
read -p "LinkedIn URL (optional): " linkedin
read -p "Company (default: Xebia): " company
company=${company:-Xebia}

# Generate filename from name (convert to kebab-case)
filename=$(echo "$name" | tr '[:upper:]' '[:lower:]' | tr ' ' '-' | sed 's/[^a-z0-9-]//g')

echo ""
echo "Generated filename: $filename"
echo ""

# Ask for image filename
read -p "Image filename (e.g., $filename.jpg) [default: $filename.svg]: " image
image=${image:-$filename.svg}

# Confirm
echo ""
echo "============================================"
echo "  Summary"
echo "============================================"
echo "Name:     $name"
echo "Position: $position"
echo "Bio:      $bio"
echo "Email:    $email"
echo "GitHub:   $github"
echo "LinkedIn: $linkedin"
echo "Company:  $company"
echo "Image:    $image"
echo ""
echo "Files to create:"
echo "  - common/trainers/$filename.json"
echo "  - img/trainers/$image (you need to add this manually)"
echo ""
read -p "Create trainer profile? (y/n): " confirm

if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
    echo "Cancelled."
    exit 0
fi

# Create JSON file with proper formatting
json_file="common/trainers/$filename.json"

# Start building JSON content
json_content="{\n  \"name\": \"$name\",\n  \"position\": \"$position\""

# Add optional fields
[ -n "$bio" ] && json_content+=",\n  \"bio\": \"$bio\""
[ -n "$email" ] && json_content+=",\n  \"email\": \"$email\""
[ -n "$github" ] && json_content+=",\n  \"github\": \"$github\""
[ -n "$linkedin" ] && json_content+=",\n  \"linkedin\": \"$linkedin\""
[ -n "$company" ] && json_content+=",\n  \"company\": \"$company\""
[ -n "$image" ] && json_content+=",\n  \"image\": \"$image\""

# Close JSON
json_content+="\n}"

# Write to file
echo -e "$json_content" > "$json_file"

echo ""
echo "✅ Created $json_file"
echo ""
echo "Next steps:"
echo "1. Add profile picture to: img/trainers/$image"
echo "2. Test the trainer slide:"
echo "   VITE_TRAINER_NAME=$filename npm run dev"
echo ""
echo "Done!"
