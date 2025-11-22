# Trainer/Speaker Slide Configuration

This directory contains the configuration system for displaying trainer/speaker information in presentations.

## Overview

The trainer slide is a reusable component that displays:
- Profile picture
- Name
- Position/Title
- Short biography
- Contact information (GitHub, LinkedIn, Email)
- Company affiliation

## Directory Structure

```
common/trainers/
├── README.md              # This file
├── speaker.md             # Reusable trainer slide component
├── trainer-schema.json    # JSON schema for trainer data
├── john-doe.json         # Sample trainer profile
└── jane-smith.json       # Sample trainer profile

img/trainers/
├── john-doe.svg          # Profile picture for John Doe
└── jane-smith.svg        # Profile picture for Jane Smith
```

## Quick Start

### 1. Add Trainer Slide to Presentation

In your main `slides.md` file, add the trainer slide reference:

```markdown
---
src: ../../common/trainers/speaker.md
---
```

### 2. Configure Which Trainer to Display

#### Option A: Environment Variable (Recommended)

Create or edit `.env` file in the presentation directory:

```bash
VITE_TRAINER_NAME=jane-smith
```

Then run:

```bash
npm run dev
```

#### Option B: Command Line

Set the environment variable when starting Slidev:

```bash
VITE_TRAINER_NAME=jane-smith npm run dev
```

For build:

```bash
VITE_TRAINER_NAME=jane-smith npm run build
```

For export:

```bash
VITE_TRAINER_NAME=jane-smith npm run export
```

## Adding a New Trainer

### Step 1: Create Trainer Data File

Create a new JSON file in `common/trainers/` named after the trainer (use kebab-case):

**Example: `common/trainers/alex-johnson.json`**

```json
{
  "name": "Alex Johnson",
  "position": "Cloud Solutions Architect",
  "bio": "Specializing in cloud-native architectures and DevOps practices. 8+ years of experience helping organizations transform their development workflows.",
  "email": "alex.johnson@example.com",
  "github": "alexj",
  "linkedin": "https://www.linkedin.com/in/alexjohnson",
  "twitter": "@alexj",
  "company": "Xebia",
  "image": "alex-johnson.jpg"
}
```

### Step 2: Add Trainer Profile Picture

Add the trainer's profile picture to `img/trainers/`:

- Supported formats: JPG, PNG, SVG
- Recommended size: 400x400 pixels (square)
- Filename must match the `image` field in the JSON file
- Use the same base name as the JSON file

**Example:**
- JSON file: `common/trainers/alex-johnson.json`
- Image file: `img/trainers/alex-johnson.jpg`

### Step 3: Update speaker.md (if needed)

If you want the new trainer to be available in the hardcoded fallback list, edit `common/trainers/speaker.md` and add the trainer to the `trainers` object:

```javascript
const trainers = {
  'john-doe': { /* ... */ },
  'jane-smith': { /* ... */ },
  'alex-johnson': {
    name: 'Alex Johnson',
    position: 'Cloud Solutions Architect',
    // ... rest of the data
  }
}
```

**Note:** This step is optional if you're loading trainer data dynamically via fetch or import.

### Step 4: Test the Configuration

```bash
VITE_TRAINER_NAME=alex-johnson npm run dev
```

## Trainer Data Schema

All trainer JSON files should follow this schema:

### Required Fields

- `name` (string): Full name of the trainer
- `position` (string): Job title or role

### Optional Fields

- `bio` (string): Short biography (max 500 characters)
- `email` (string): Contact email address
- `github` (string): GitHub username (without @)
- `linkedin` (string): Full LinkedIn profile URL
- `twitter` (string): Twitter/X handle
- `company` (string): Company or organization name
- `image` (string): Filename of profile picture in `img/trainers/`

### Example

See `trainer-schema.json` for the complete JSON Schema definition.

## Usage in Different Presentations

The trainer slide can be used in any presentation within this repository:

```markdown
# In presentations/my-talk/slides.md

---
src: ../../common/trainers/speaker.md
---
```

## Customization

### Styling

The trainer slide uses Tailwind CSS classes. To customize the layout, edit `common/trainers/speaker.md`.

### Layout Options

The current implementation uses Slidev's `two-cols` layout with:
- Left column: Profile picture
- Right column: Name, position, bio, and links

You can change the layout by modifying the frontmatter:

```markdown
---
layout: center  # or 'default', 'image-right', etc.
---
```

## Troubleshooting

### Trainer not displaying

1. Check that `VITE_TRAINER_NAME` matches the JSON filename (without extension)
2. Verify the JSON file exists in `common/trainers/`
3. Check browser console for errors
4. Ensure the image file exists in `img/trainers/`

### Image not loading

1. Verify the `image` field in JSON matches the actual filename
2. Check that the image path is correct: `/img/trainers/{filename}`
3. Ensure image format is supported (JPG, PNG, SVG)
4. Check browser console for 404 errors

### Default trainer shows instead of configured one

1. Verify environment variable is set correctly
2. Restart the dev server after changing `.env`
3. Check that the trainer name in environment variable matches the JSON filename

## Environment Variables Reference

| Variable | Description | Example |
|----------|-------------|---------|
| `VITE_TRAINER_NAME` | Primary variable for trainer selection | `jane-smith` |
| `SLIDEV_TRAINER` | Fallback variable name | `jane-smith` |

Both variables accept the trainer's JSON filename without the `.json` extension.

## Examples

### Example 1: Development with specific trainer

```bash
# Create .env file
echo "VITE_TRAINER_NAME=jane-smith" > .env

# Run development server
npm run dev
```

### Example 2: Build with different trainer

```bash
VITE_TRAINER_NAME=john-doe npm run build
```

### Example 3: Export PDF with trainer

```bash
VITE_TRAINER_NAME=alex-johnson npm run export
```

## Best Practices

1. **Naming Convention**: Use kebab-case for filenames (e.g., `jane-smith.json`, not `Jane_Smith.json`)
2. **Image Quality**: Use high-quality, professional profile pictures
3. **Image Size**: Keep images under 500KB for faster loading
4. **Bio Length**: Keep bios concise (2-3 sentences max)
5. **Contact Info**: Only include publicly available contact information
6. **Version Control**: Commit both JSON and image files together

## Future Enhancements

Potential improvements for this system:

- [ ] Dynamic JSON loading via fetch API
- [ ] Support for multiple trainers on one slide
- [ ] Different slide layouts (vertical, minimal, etc.)
- [ ] Integration with company directory/API
- [ ] Automated image optimization
- [ ] Multi-language support for bio
- [ ] QR code generation for contact info

## Support

For issues or questions:

1. Check this README first
2. Review the `trainer-schema.json` for data format
3. Examine `speaker.md` for implementation details
4. Open an issue in the repository

## License

This configuration system is part of the xebia-presentations repository.
