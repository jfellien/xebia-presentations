# Trainer Slide System - Documentation Index

Welcome to the Trainer Slide System documentation. This system provides a reusable, configurable trainer/speaker slide for Slidev presentations.

## 📚 Documentation Overview

### For Presenters (Quick Start)

If you just want to use an existing trainer profile in your presentation:

👉 **[QUICKSTART.md](./QUICKSTART.md)** - Get started in 5 minutes

**Quick commands**:
```bash
# Set your trainer and run
VITE_TRAINER_NAME=jane-smith npm run dev

# Or use .env file
echo "VITE_TRAINER_NAME=jane-smith" > .env
npm run dev
```

### For Adding New Trainers

If you need to add yourself or a new trainer to the system:

👉 **[README.md](./README.md)** - Complete guide on adding trainers

**Quick method**:
```bash
npm run add-trainer  # Interactive script
```

### For Integration

If you're creating a new presentation and want to include the trainer slide:

👉 **[INTEGRATION.md](./INTEGRATION.md)** - How to integrate into presentations

**Quick integration**:
```markdown
---
src: ../../common/trainers/speaker.md
---
```

### For Testing

If you're testing the trainer slide feature or troubleshooting:

👉 **[TESTING.md](./TESTING.md)** - Comprehensive testing guide

### For Understanding the Schema

If you want to know what fields are available in trainer profiles:

👉 **[trainer-schema.json](./trainer-schema.json)** - JSON Schema definition

## 🎯 Quick Navigation

### I want to...

| Goal | Documentation | Command/Action |
|------|--------------|----------------|
| **Use an existing trainer** | [QUICKSTART.md](./QUICKSTART.md) | `VITE_TRAINER_NAME=jane-smith npm run dev` |
| **Add a new trainer** | [README.md](./README.md) | `npm run add-trainer` |
| **Integrate into my presentation** | [INTEGRATION.md](./INTEGRATION.md) | Add `src: ../../common/trainers/speaker.md` |
| **Troubleshoot an issue** | [QUICKSTART.md](./QUICKSTART.md#-troubleshooting) | Check troubleshooting section |
| **Test the feature** | [TESTING.md](./TESTING.md) | Follow test scenarios |
| **Understand the data format** | [trainer-schema.json](./trainer-schema.json) | Review JSON schema |
| **See examples** | [john-doe.json](./john-doe.json), [jane-smith.json](./jane-smith.json) | View sample files |
| **Customize the slide** | [INTEGRATION.md](./INTEGRATION.md#customizing-the-trainer-slide) | Copy and modify speaker.md |

## 📁 File Structure

```
common/trainers/
├── INDEX.md              ← You are here
├── README.md             ← Main documentation
├── QUICKSTART.md         ← Quick reference guide
├── INTEGRATION.md        ← Integration guide
├── TESTING.md            ← Testing procedures
├── speaker.md            ← The trainer slide component
├── trainer-schema.json   ← Data format definition
├── john-doe.json         ← Sample trainer #1
└── jane-smith.json       ← Sample trainer #2

img/trainers/
├── john-doe.svg          ← Profile picture #1
└── jane-smith.svg        ← Profile picture #2

scripts/
└── add-trainer.sh        ← Helper script for adding trainers
```

## 🚀 Common Workflows

### Workflow 1: Presenter Using Existing Profile

```bash
# 1. Check available trainers
ls common/trainers/*.json

# 2. Set your trainer
echo "VITE_TRAINER_NAME=john-doe" > .env

# 3. Run presentation
npm run dev
```

### Workflow 2: Adding New Trainer Profile

```bash
# 1. Run helper script
npm run add-trainer

# 2. Follow prompts to enter your info

# 3. Add your profile picture
cp ~/my-photo.jpg img/trainers/your-name.jpg

# 4. Test it
VITE_TRAINER_NAME=your-name npm run dev
```

### Workflow 3: Creating New Presentation with Trainer

```bash
# 1. Create presentation structure
mkdir -p presentations/my-talk/slides
cd presentations/my-talk

# 2. Create slides.md with trainer slide reference
cat > slides.md << 'EOF'
---
theme: default
title: My Talk
---

---
src: ./slides/intro.md
---

---
src: ../../common/trainers/speaker.md
---

---
# Rest of presentation...
---
EOF

# 3. Configure trainer
echo "VITE_TRAINER_NAME=jane-smith" > .env

# 4. Run it
npm run dev
```

### Workflow 4: Building for Production

```bash
# Set trainer and build
VITE_TRAINER_NAME=john-doe npm run build

# Or export as PDF
VITE_TRAINER_NAME=john-doe npm run export
```

## 🔑 Key Concepts

### Environment Variables

The system uses environment variables to configure which trainer to display:

- **Primary**: `VITE_TRAINER_NAME` (Vite's environment variable format)
- **Fallback**: `SLIDEV_TRAINER` (Alternative name)
- **Default**: `john-doe` (if nothing is set)

### Dynamic Loading

The trainer slide uses Vite's glob import feature to automatically discover and load all trainer JSON files. This means:

✅ No code changes needed when adding new trainers
✅ Just add JSON file and image
✅ Trainer is automatically available

### File Naming Convention

**Important**: Use kebab-case for all filenames:

✅ Good: `john-doe.json`, `jane-smith.json`
❌ Bad: `John_Doe.json`, `jane.smith.json`

The trainer name in `VITE_TRAINER_NAME` must match the filename (without .json).

## 📋 Field Reference

### Required Fields
- `name` - Full name of trainer
- `position` - Job title or role

### Optional Fields
- `bio` - Short biography (max 500 chars)
- `email` - Contact email
- `github` - GitHub username (without @)
- `linkedin` - LinkedIn profile URL
- `twitter` - Twitter handle
- `company` - Company/organization name
- `image` - Profile picture filename

See [trainer-schema.json](./trainer-schema.json) for complete schema.

## ⚙️ Configuration Options

### Option 1: .env File (Best for development)

```bash
# In presentation directory or repository root
VITE_TRAINER_NAME=jane-smith
```

### Option 2: Command Line (Best for one-off builds)

```bash
VITE_TRAINER_NAME=jane-smith npm run dev
```

### Option 3: Export in Shell (Best for multiple commands)

```bash
export VITE_TRAINER_NAME=jane-smith
npm run dev
npm run build
npm run export
```

## 🎨 Customization

The trainer slide can be customized in several ways:

1. **Styling**: Override CSS in your presentation
2. **Layout**: Copy speaker.md and modify
3. **Content**: Edit trainer JSON files
4. **Images**: Replace images in img/trainers/

See [INTEGRATION.md](./INTEGRATION.md#customizing-the-trainer-slide) for details.

## 🐛 Troubleshooting Quick Reference

| Problem | Solution |
|---------|----------|
| Default trainer shows | Check `VITE_TRAINER_NAME` is set and matches a JSON filename |
| Image doesn't load | Verify image exists in `img/trainers/` and filename matches JSON |
| Slide doesn't appear | Check slide reference path: `../../common/trainers/speaker.md` |
| Changes don't apply | Restart dev server and hard refresh browser (Ctrl+F5) |
| JSON errors | Validate JSON syntax at jsonlint.com |

Full troubleshooting guide: [QUICKSTART.md](./QUICKSTART.md#-troubleshooting)

## 📊 Feature Comparison

| Feature | Hardcoded Slide | Trainer System |
|---------|----------------|----------------|
| Reusability | ❌ Copy/paste per presentation | ✅ One component, many uses |
| Maintainability | ❌ Update in multiple places | ✅ Update once, affects all |
| Configurability | ❌ Edit code each time | ✅ Environment variable |
| Scalability | ❌ N slides for N trainers | ✅ N JSON files, 1 component |
| Ease of use | ❌ Requires code changes | ✅ Just set environment variable |

## 📚 Related Documentation

### Slidev Documentation
- [Slidev Official Docs](https://sli.dev/)
- [Slidev Layouts](https://sli.dev/builtin/layouts.html)
- [Slidev Syntax](https://sli.dev/guide/syntax.html)

### Vite Documentation
- [Environment Variables](https://vitejs.dev/guide/env-and-mode.html)
- [Glob Import](https://vitejs.dev/guide/features.html#glob-import)

### Vue Documentation
- [Vue 3 Guide](https://vuejs.org/guide/)
- [Composition API](https://vuejs.org/guide/extras/composition-api-faq.html)

## 🤝 Contributing

To improve this trainer slide system:

1. Test the feature using [TESTING.md](./TESTING.md)
2. Report issues with detailed information
3. Suggest improvements via pull requests
4. Update documentation if you find gaps

## 📝 Changelog

### Version 1.0.0 (Current)

**Features**:
- ✅ Dynamic trainer loading via Vite glob import
- ✅ Environment variable configuration
- ✅ Interactive helper script for adding trainers
- ✅ Comprehensive documentation
- ✅ Sample trainers and images
- ✅ JSON schema validation
- ✅ Responsive layout
- ✅ Support for multiple image formats (JPG, PNG, SVG)

**Documentation**:
- ✅ README.md - Main documentation
- ✅ QUICKSTART.md - Quick reference
- ✅ INTEGRATION.md - Integration guide
- ✅ TESTING.md - Testing procedures
- ✅ INDEX.md - This file

**Tools**:
- ✅ add-trainer.sh - Interactive script
- ✅ npm script: `npm run add-trainer`

## 🎯 Next Steps

Depending on your role:

**If you're a presenter:**
1. Read [QUICKSTART.md](./QUICKSTART.md)
2. Configure your trainer: `VITE_TRAINER_NAME=your-name`
3. Test your presentation

**If you're adding a trainer:**
1. Run `npm run add-trainer`
2. Add your profile picture
3. Test with your trainer name

**If you're integrating:**
1. Read [INTEGRATION.md](./INTEGRATION.md)
2. Add slide reference to your slides.md
3. Configure and test

**If you're troubleshooting:**
1. Check [QUICKSTART.md](./QUICKSTART.md#-troubleshooting)
2. Review [TESTING.md](./TESTING.md)
3. Check browser console for errors

## 💡 Tips & Best Practices

1. **Always test before presenting** - Run through your presentation with the trainer slide
2. **Use .env for development** - Easier than setting environment variables each time
3. **Use command line for builds** - More explicit, better for CI/CD
4. **Keep profiles updated** - Review and update trainer information regularly
5. **Use appropriate images** - Professional photos, properly sized
6. **Follow naming conventions** - Use kebab-case for consistency
7. **Document your setup** - Note which trainer is used in presentation README

## 📞 Support & Help

Need help? Try these resources in order:

1. **Quick questions**: [QUICKSTART.md](./QUICKSTART.md)
2. **How-to guides**: [README.md](./README.md) or [INTEGRATION.md](./INTEGRATION.md)
3. **Troubleshooting**: Check troubleshooting sections in docs
4. **Testing**: [TESTING.md](./TESTING.md) has detailed test scenarios
5. **Schema questions**: [trainer-schema.json](./trainer-schema.json)
6. **Examples**: Look at [john-doe.json](./john-doe.json) and [jane-smith.json](./jane-smith.json)
7. **Still stuck**: Open an issue in the repository

## ⭐ Quick Commands Cheat Sheet

```bash
# View available trainers
ls common/trainers/*.json

# Add new trainer (interactive)
npm run add-trainer

# Use specific trainer (dev)
VITE_TRAINER_NAME=jane-smith npm run dev

# Build with trainer
VITE_TRAINER_NAME=john-doe npm run build

# Export with trainer
VITE_TRAINER_NAME=jane-smith npm run export

# Test helper script
./scripts/add-trainer.sh

# View trainer schema
cat common/trainers/trainer-schema.json

# Check what's configured
echo $VITE_TRAINER_NAME
```

---

**Documentation Version**: 1.0.0  
**Last Updated**: November 2024  
**Maintained By**: xebia-presentations contributors

**Start Here**: [QUICKSTART.md](./QUICKSTART.md) 🚀
