# Trainer Slide Quick Start Guide

## 🚀 For Presenters: Using an Existing Trainer

### Option 1: Using .env file (Recommended for development)

1. Copy the example environment file:
   ```bash
   cp .env.example .env
   ```

2. Edit `.env` and set your trainer:
   ```bash
   VITE_TRAINER_NAME=jane-smith
   ```

3. Start the presentation:
   ```bash
   npm run dev
   ```

### Option 2: Command line (Good for one-off builds)

```bash
# Development
VITE_TRAINER_NAME=jane-smith npm run dev

# Build
VITE_TRAINER_NAME=jane-smith npm run build

# Export PDF
VITE_TRAINER_NAME=jane-smith npm run export
```

### Option 3: Using export in terminal session

```bash
export VITE_TRAINER_NAME=jane-smith
npm run dev
npm run build
npm run export
```

## 📋 Available Trainers

Check `common/trainers/` directory for available trainers:

```bash
ls common/trainers/*.json
```

Current trainers:
- `john-doe` (default)
- `jane-smith`

## ➕ Adding Your Trainer Profile

### Quick Method (Interactive)

```bash
npm run add-trainer
```

Follow the prompts to create your profile.

### Manual Method

1. Create `common/trainers/your-name.json`:
   ```json
   {
     "name": "Your Name",
     "position": "Your Title",
     "bio": "Your bio...",
     "email": "your.email@example.com",
     "github": "yourusername",
     "company": "Xebia",
     "image": "your-name.jpg"
   }
   ```

2. Add your profile picture to `img/trainers/your-name.jpg`

3. Test it:
   ```bash
   VITE_TRAINER_NAME=your-name npm run dev
   ```

## 🎨 Image Requirements

- **Format**: JPG, PNG, or SVG
- **Size**: 400x400px (1:1 aspect ratio recommended)
- **Max file size**: < 500KB for good performance
- **Location**: `img/trainers/`
- **Naming**: Must match the `image` field in your JSON

## ❓ Troubleshooting

### Trainer not showing

**Problem**: Default trainer (john-doe) appears instead of configured one

**Solutions**:
1. Check environment variable name: `VITE_TRAINER_NAME` (note the prefix)
2. Verify the value matches a JSON filename (without .json extension)
3. Restart dev server after changing .env file
4. Check browser console for errors

### Image not loading

**Problem**: Broken image icon or missing profile picture

**Solutions**:
1. Verify image file exists in `img/trainers/`
2. Check the `image` field in JSON matches actual filename
3. Ensure image format is supported (JPG, PNG, SVG)
4. Check browser console for 404 errors
5. Verify image path: should be `/img/trainers/{filename}`

### Changes not appearing

**Problem**: Updated trainer data not reflected in slides

**Solutions**:
1. Hard refresh browser (Ctrl+F5 or Cmd+Shift+R)
2. Clear browser cache
3. Restart dev server
4. Check that you're editing the correct JSON file

## 📖 More Information

- **Full Documentation**: See [README.md](./README.md)
- **JSON Schema**: See [trainer-schema.json](./trainer-schema.json)
- **Helper Script**: Run `npm run add-trainer`

## 💡 Tips

1. **For presentations**: Set trainer in `.env` before building
2. **For demos**: Keep multiple trainer profiles for different speakers
3. **For testing**: Use SVG placeholders until real photos are available
4. **For privacy**: Only include publicly available contact information
5. **For consistency**: Use kebab-case for filenames (e.g., `john-doe`, not `John_Doe`)

## 🔍 Examples

### Example 1: Switch trainer for a specific presentation

```bash
cd presentations/my-talk
VITE_TRAINER_NAME=jane-smith npm run dev
```

### Example 2: Build presentation with specific trainer

```bash
VITE_TRAINER_NAME=john-doe npm run build
```

### Example 3: Create PDF with your profile

```bash
VITE_TRAINER_NAME=your-name npm run export
```

## 🏗️ Integration in Presentations

To add the trainer slide to a new presentation:

1. Open your presentation's `slides.md`
2. Add this line where you want the trainer slide (typically after intro, before agenda):
   ```markdown
   ---
   src: ../../common/trainers/speaker.md
   ---
   ```

That's it! The trainer slide will automatically use the configured trainer.

## 🆘 Need Help?

1. Check the [full README](./README.md)
2. Verify your JSON follows the [schema](./trainer-schema.json)
3. Look at existing examples: [john-doe.json](./john-doe.json), [jane-smith.json](./jane-smith.json)
4. Open an issue in the repository

---

**Happy Presenting! 🎤**
