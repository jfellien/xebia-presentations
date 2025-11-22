# Integrating Trainer Slide into Presentations

This guide shows how to add the trainer slide to any presentation in the repository.

## Quick Integration (3 Steps)

### Step 1: Add the Slide Reference

In your presentation's main `slides.md` file, add this line where you want the trainer slide to appear:

```markdown
---
src: ../../common/trainers/speaker.md
---
```

**Typical placement** (after intro, before agenda):

```markdown
---
theme: default
# ... other frontmatter
---

---
src: ./slides/intro.md
---

---
src: ../../common/trainers/speaker.md  # ← Add this
---

---
src: ./slides/agenda.md
---

# ... rest of slides
```

### Step 2: Configure the Trainer

Create or edit `.env` file in your presentation directory:

```bash
cd presentations/your-presentation
echo "VITE_TRAINER_NAME=jane-smith" > .env
```

### Step 3: Test It

```bash
npm run dev
```

Navigate to the trainer slide and verify it displays correctly.

## Complete Example

### Creating a New Presentation with Trainer Slide

Let's create a complete example presentation from scratch:

#### 1. Create Presentation Directory

```bash
mkdir -p presentations/my-new-talk/slides
cd presentations/my-new-talk
```

#### 2. Create Main Slides File

Create `slides.md`:

```markdown
---
theme: default
background: https://images.unsplash.com/photo-1618401471353-b98afee0b2eb?w=1920
class: text-center
highlighter: shiki
lineNumbers: true
title: My New Talk
mdc: true
---

# My New Talk
## An Amazing Presentation

---

# Introduction

Welcome to my presentation!

---
src: ../../common/trainers/speaker.md
---

---

# Agenda

- Topic 1
- Topic 2
- Topic 3

---

# Topic 1

Content here...

---

# Conclusion

Thanks for attending!
```

#### 3. Configure Trainer

```bash
# Option A: Via .env file
echo "VITE_TRAINER_NAME=john-doe" > .env

# Option B: Via command line
VITE_TRAINER_NAME=john-doe npm run dev
```

#### 4. Run the Presentation

```bash
npm run dev
```

## Advanced Integration Patterns

### Pattern 1: Multiple Speakers

If you have multiple speakers in your presentation, you can create multiple trainer slides:

```markdown
---
src: ../../common/trainers/speaker.md
---

# Speaker 2

To add a second speaker, you could:
1. Create a custom slide for speaker 2
2. Or use two instances with different configurations
3. Or extend speaker.md to support multiple speakers
```

**Note**: Current implementation supports one trainer per presentation. For multiple trainers, consider creating custom slides.

### Pattern 2: Conditional Trainer Slide

You might want to include the trainer slide conditionally:

```markdown
---
src: ../../common/trainers/speaker.md
hideInToc: true
---
```

The `hideInToc: true` frontmatter option hides the slide from the table of contents/agenda.

### Pattern 3: Custom Positioning

Place the trainer slide at different positions:

**At the beginning (after title slide):**
```markdown
---
# Title slide content
---

---
src: ../../common/trainers/speaker.md
---

---
# First content slide
---
```

**At the end (before thank you slide):**
```markdown
---
# Last content slide
---

---
src: ../../common/trainers/speaker.md
---

---
# Thank you slide
---
```

**As a section divider:**
```markdown
---
# End of Part 1
---

---
src: ../../common/trainers/speaker.md
---

---
# Beginning of Part 2
---
```

## Presentation-Specific Configuration

### Using Different Trainers for Different Talks

Each presentation can use a different trainer:

**Presentation 1:**
```bash
cd presentations/talk1
echo "VITE_TRAINER_NAME=john-doe" > .env
npm run dev
```

**Presentation 2:**
```bash
cd presentations/talk2
echo "VITE_TRAINER_NAME=jane-smith" > .env
npm run dev
```

### Build Scripts for Multiple Presentations

Add presentation-specific scripts to `package.json`:

```json
{
  "scripts": {
    "dev:talk1": "cd presentations/talk1 && VITE_TRAINER_NAME=john-doe npm run dev",
    "dev:talk2": "cd presentations/talk2 && VITE_TRAINER_NAME=jane-smith npm run dev",
    "build:talk1": "cd presentations/talk1 && VITE_TRAINER_NAME=john-doe npm run build",
    "build:talk2": "cd presentations/talk2 && VITE_TRAINER_NAME=jane-smith npm run build"
  }
}
```

## Customizing the Trainer Slide

### Option 1: Override Styles

Create a `styles.css` in your presentation directory:

```css
/* Custom styles for trainer slide */
.trainer-slide {
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
}

.trainer-slide h1 {
  color: #ffffff;
  font-size: 3rem;
}

.trainer-slide img {
  border: 5px solid #ffffff;
  box-shadow: 0 10px 30px rgba(0,0,0,0.3);
}
```

Reference in your `slides.md`:

```markdown
---
theme: default
css: ./styles.css
---
```

### Option 2: Create a Custom Variant

Copy and modify the trainer slide:

```bash
cp common/trainers/speaker.md presentations/my-talk/slides/custom-speaker.md
```

Edit `custom-speaker.md` to customize layout, styling, or content.

Then reference the custom version:

```markdown
---
src: ./slides/custom-speaker.md
---
```

### Option 3: Extend with Additional Content

Create a wrapper slide:

```markdown
---
layout: default
---

<div class="custom-header">
  <h2>Meet Your Trainer</h2>
</div>

---
src: ../../common/trainers/speaker.md
---

<div class="custom-footer">
  <p>Feel free to reach out with questions!</p>
</div>
```

## Integration Checklist

When integrating the trainer slide into a new presentation:

- [ ] Add trainer slide reference to `slides.md`
- [ ] Configure trainer via `.env` or environment variable
- [ ] Test in development mode (`npm run dev`)
- [ ] Verify trainer data displays correctly
- [ ] Check that profile picture loads
- [ ] Verify slide positioning in presentation flow
- [ ] Test build process (`npm run build`)
- [ ] Test export process if needed (`npm run export`)
- [ ] Update presentation README with trainer info
- [ ] Document which trainer is used for this talk

## Troubleshooting Integration Issues

### Issue: "Cannot find module" error

**Problem**: Slide reference path is incorrect

**Solution**: Verify the relative path from your `slides.md` to `speaker.md`
- If your presentation is in `presentations/my-talk/`, use `../../common/trainers/speaker.md`
- If nested deeper, adjust accordingly

### Issue: Trainer slide doesn't appear

**Problem**: Slide reference not formatted correctly

**Solution**: Ensure proper Slidev slide separator syntax:
```markdown
---
src: ../../common/trainers/speaker.md
---
```

Note the `---` before and after the `src:` line.

### Issue: Wrong trainer displays

**Problem**: Environment variable not set or not read

**Solution**:
1. Check environment variable is set: `echo $VITE_TRAINER_NAME`
2. Restart dev server after changing `.env`
3. Verify `.env` file is in correct directory
4. Check for typos in trainer name

### Issue: Image doesn't load

**Problem**: Image path incorrect or file missing

**Solution**:
1. Verify image exists in `img/trainers/`
2. Check `image` field in trainer JSON
3. Ensure path is absolute: `/img/trainers/filename.jpg`
4. Check browser console for 404 errors

## Migration Guide

### Migrating Existing Presentations

If you have existing presentations with hardcoded speaker slides:

#### Before:
```markdown
---
layout: two-cols
---

# Speaker Name

![Photo](/path/to/photo.jpg)

Position: Senior Engineer
Email: email@example.com
```

#### After:
```markdown
---
src: ../../common/trainers/speaker.md
---
```

**Steps**:
1. Extract speaker info into trainer JSON
2. Move speaker photo to `img/trainers/`
3. Replace hardcoded slide with reference
4. Configure environment variable
5. Test the presentation

## Best Practices

1. **Consistent Placement**: Place trainer slide in same position across all presentations (e.g., always after intro)

2. **Use .env Files**: Commit `.env.example`, not `.env`, to allow each presenter to configure their own trainer

3. **Document the Trainer**: In presentation README, mention which trainer is typically used

4. **Test Before Presenting**: Always verify trainer slide works before important presentations

5. **Keep Profiles Updated**: Regularly update trainer JSON files with current information

6. **Backup Plan**: Have screenshots of trainer slide in case of technical issues

## Examples from Existing Presentations

### Example 1: GitHub Copilot Platform Talk

See: `presentations/github-copilot-platform/slides.md`

```markdown
---
src: ./slides/intro.md
---

---
src: ../../common/trainers/speaker.md  # Trainer slide here
---

---
src: ./slides/agenda.md
---
```

Configuration in `.env`:
```bash
VITE_TRAINER_NAME=john-doe
```

## Support

For help with integration:

1. Check this guide first
2. Review [QUICKSTART.md](./QUICKSTART.md) for basic usage
3. See [README.md](./README.md) for detailed documentation
4. Check [TESTING.md](./TESTING.md) for testing procedures
5. Open an issue if problems persist

## Additional Resources

- **Slidev Documentation**: https://sli.dev/
- **Slidev Layouts**: https://sli.dev/builtin/layouts.html
- **Vue 3 Composition API**: https://vuejs.org/guide/extras/composition-api-faq.html
- **Vite Environment Variables**: https://vitejs.dev/guide/env-and-mode.html

---

**Ready to integrate?** Follow the Quick Integration steps above and you'll be up and running in minutes! 🚀
