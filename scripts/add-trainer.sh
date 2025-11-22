#!/usr/bin/env bash

# Script to help create a new trainer profile
# Usage: ./scripts/add-trainer.sh

set -e

echo "============================================"
echo "  Add New Trainer Profile"
echo "============================================"
echo ""

# Check if jq is available
if ! command -v jq &> /dev/null; then
    echo "Error: jq is required but not installed."
    echo "Please install jq: https://stedolan.github.io/jq/download/"
    exit 1
fi

# Get trainer information
read -p "Trainer's full name: " name
read -p "Position/Title: " position
read -p "Short bio (optional): " bio
read -p "Email (optional): " email
read -p "GitHub username (optional): " github
read -p "LinkedIn URL (optional): " linkedin
read -p "Company (optional, default: Xebia): " company
# Set default only if user pressed enter without input
if [ -z "$company" ]; then
    company="Xebia"
    company_provided="default"
else
    company_provided="yes"
fi

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
if [ "$company_provided" = "default" ]; then
    echo "Company:  $company (default)"
else
    echo "Company:  $company"
fi
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

# Create JSON file using jq for proper escaping
json_file="common/trainers/$filename.json"

# Build JSON object with jq (properly escapes all values)
jq -n \
  --arg name "$name" \
  --arg position "$position" \
  --arg bio "$bio" \
  --arg email "$email" \
  --arg github "$github" \
  --arg linkedin "$linkedin" \
  --arg company "$company" \
  --arg image "$image" \
  '{
    name: $name,
    position: $position
  }
  | if $bio != "" then . + {bio: $bio} else . end
  | if $email != "" then . + {email: $email} else . end
  | if $github != "" then . + {github: $github} else . end
  | if $linkedin != "" then . + {linkedin: $linkedin} else . end
  | if $company != "" then . + {company: $company} else . end
  | if $image != "" then . + {image: $image} else . end
  ' > "$json_file"

echo ""
echo "✅ Created $json_file"
echo ""
echo "Next steps:"
echo "1. Add profile picture to: img/trainers/$image"
echo "2. Test the trainer slide:"
echo "   VITE_TRAINER_NAME=$filename npm run dev"
echo ""
echo "Done!"
