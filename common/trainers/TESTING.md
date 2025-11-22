# Trainer Slide Testing Guide

This guide helps you test the trainer slide feature to ensure it works correctly.

## Prerequisites

Before testing, ensure:
- [ ] Node.js 18+ is installed
- [ ] Dependencies are installed (`npm install`)
- [ ] At least one trainer JSON file exists in `common/trainers/`
- [ ] Corresponding trainer image exists in `img/trainers/`

## Test Scenarios

### Test 1: Default Trainer (john-doe)

**Purpose**: Verify default trainer appears when no environment variable is set.

**Steps**:
1. Ensure no `VITE_TRAINER_NAME` is set:
   ```bash
   unset VITE_TRAINER_NAME
   ```
2. Start dev server:
   ```bash
   cd presentations/github-copilot-platform
   npm run dev
   ```
3. Navigate to the trainer slide (should be slide #2, after intro)

**Expected Result**:
- Profile picture for John Doe appears
- Name: "John Doe"
- Position: "Senior Software Engineer"
- Bio and GitHub link are displayed

**Pass Criteria**: ✅ Default trainer (john-doe) is displayed correctly

---

### Test 2: Switch to Different Trainer (jane-smith)

**Purpose**: Verify environment variable correctly switches trainer.

**Steps**:
1. Set environment variable:
   ```bash
   export VITE_TRAINER_NAME=jane-smith
   ```
2. Start dev server:
   ```bash
   cd presentations/github-copilot-platform
   npm run dev
   ```
3. Navigate to the trainer slide

**Expected Result**:
- Profile picture for Jane Smith appears
- Name: "Jane Smith"
- Position: "DevOps Trainer & Cloud Architect"
- Bio, GitHub, and LinkedIn links are displayed

**Pass Criteria**: ✅ Trainer switches correctly based on environment variable

---

### Test 3: Invalid Trainer Name (Fallback)

**Purpose**: Verify fallback to default trainer when invalid name is provided.

**Steps**:
1. Set invalid trainer name:
   ```bash
   export VITE_TRAINER_NAME=nonexistent-trainer
   ```
2. Start dev server:
   ```bash
   cd presentations/github-copilot-platform
   npm run dev
   ```
3. Navigate to the trainer slide
4. Check browser console for any errors

**Expected Result**:
- Falls back to default trainer (john-doe)
- No JavaScript errors in console
- Slide renders normally

**Pass Criteria**: ✅ Gracefully handles invalid trainer name with fallback

---

### Test 4: Environment Variable via .env File

**Purpose**: Verify .env file is properly read.

**Steps**:
1. Create `.env` file in presentation directory:
   ```bash
   cd presentations/github-copilot-platform
   echo "VITE_TRAINER_NAME=jane-smith" > .env
   ```
2. Start dev server:
   ```bash
   npm run dev
   ```
3. Navigate to the trainer slide

**Expected Result**:
- Jane Smith trainer is displayed
- Settings from .env file are applied

**Pass Criteria**: ✅ .env file configuration works correctly

**Cleanup**:
```bash
rm .env
```

---

### Test 5: Build with Specific Trainer

**Purpose**: Verify trainer is correctly set during build process.

**Steps**:
1. Build with specific trainer:
   ```bash
   cd presentations/github-copilot-platform
   VITE_TRAINER_NAME=john-doe npm run build
   ```
2. Serve the built files:
   ```bash
   npx serve dist
   ```
3. Open browser to served URL
4. Navigate to trainer slide

**Expected Result**:
- Built presentation includes john-doe trainer
- All assets (images, data) are correctly bundled
- Slide renders correctly in production build

**Pass Criteria**: ✅ Production build includes correct trainer

**Cleanup**:
```bash
rm -rf dist
```

---

### Test 6: Add New Trainer with Helper Script

**Purpose**: Verify the add-trainer helper script works correctly.

**Steps**:
1. Run the helper script:
   ```bash
   npm run add-trainer
   ```
2. Enter test data:
   - Name: "Test User"
   - Position: "Test Engineer"
   - Bio: "This is a test profile"
   - Email: "test@example.com"
   - GitHub: "testuser"
   - Company: "Xebia"
   - Confirm creation: y
3. Add a test image:
   ```bash
   cp img/trainers/john-doe.svg img/trainers/test-user.svg
   ```
4. Test the new trainer:
   ```bash
   VITE_TRAINER_NAME=test-user npm run dev
   ```

**Expected Result**:
- JSON file created: `common/trainers/test-user.json`
- File contains correct data
- Test trainer displays correctly in presentation

**Pass Criteria**: ✅ Helper script creates valid trainer profile

**Cleanup**:
```bash
rm common/trainers/test-user.json
rm img/trainers/test-user.svg
```

---

### Test 7: Image Loading (Different Formats)

**Purpose**: Verify different image formats are supported.

**Steps**:
1. Test with SVG (already done with john-doe)
2. Create a test trainer with JPG:
   - Create `common/trainers/test-jpg.json` with `"image": "test.jpg"`
   - Add a JPG image to `img/trainers/test.jpg`
   - Run: `VITE_TRAINER_NAME=test-jpg npm run dev`
3. Create a test trainer with PNG:
   - Create `common/trainers/test-png.json` with `"image": "test.png"`
   - Add a PNG image to `img/trainers/test.png`
   - Run: `VITE_TRAINER_NAME=test-png npm run dev`

**Expected Result**:
- All image formats (SVG, JPG, PNG) load correctly
- Images are properly sized and styled
- No broken image icons

**Pass Criteria**: ✅ All supported image formats work

---

### Test 8: Responsive Layout

**Purpose**: Verify slide layout works at different screen sizes.

**Steps**:
1. Start dev server with a trainer:
   ```bash
   VITE_TRAINER_NAME=jane-smith npm run dev
   ```
2. Navigate to trainer slide
3. Test different viewport sizes:
   - Desktop (1920x1080)
   - Laptop (1366x768)
   - Tablet (768x1024)
   - Mobile (375x667)
4. Use browser dev tools to resize viewport

**Expected Result**:
- Layout adjusts appropriately for different screen sizes
- Text remains readable
- Image scales proportionally
- No content overflow or clipping

**Pass Criteria**: ✅ Slide is responsive across different viewports

---

### Test 9: Missing Optional Fields

**Purpose**: Verify slide handles missing optional fields gracefully.

**Steps**:
1. Create minimal trainer JSON:
   ```json
   {
     "name": "Minimal User",
     "position": "Tester",
     "image": "john-doe.svg"
   }
   ```
   Save as `common/trainers/minimal-user.json`
2. Run: `VITE_TRAINER_NAME=minimal-user npm run dev`
3. Check trainer slide

**Expected Result**:
- Name and position display correctly
- Missing fields (bio, GitHub, LinkedIn) don't cause errors
- Layout still looks good without optional content
- No JavaScript errors in console

**Pass Criteria**: ✅ Handles missing optional fields gracefully

**Cleanup**:
```bash
rm common/trainers/minimal-user.json
```

---

### Test 10: Multiple Presentations

**Purpose**: Verify trainer slide works in different presentations.

**Steps**:
1. Note: This would require creating a second presentation
2. Add trainer slide to new presentation's slides.md:
   ```markdown
   ---
   src: ../../common/trainers/speaker.md
   ---
   ```
3. Run the new presentation with a specific trainer
4. Verify slide appears correctly

**Expected Result**:
- Trainer slide works in multiple presentations
- Same trainer configuration applies across presentations
- No path or import issues

**Pass Criteria**: ✅ Reusable across multiple presentations

---

## Browser Compatibility Testing

Test in multiple browsers:

- [ ] Chrome/Chromium
- [ ] Firefox
- [ ] Safari
- [ ] Edge

**For each browser**:
1. Run dev server
2. Navigate to trainer slide
3. Verify rendering
4. Check console for errors

**Pass Criteria**: ✅ Works in all major browsers

---

## Performance Testing

**Test loading time**:
1. Open browser dev tools (Network tab)
2. Start dev server
3. Navigate to trainer slide
4. Check load times for:
   - JSON file
   - Image file
   - Total page load

**Expected Result**:
- JSON loads in < 50ms
- Image loads in < 200ms (for < 500KB images)
- No noticeable lag

**Pass Criteria**: ✅ Fast loading with no performance issues

---

## Accessibility Testing

**Test screen reader compatibility**:
1. Enable screen reader (NVDA on Windows, VoiceOver on Mac)
2. Navigate to trainer slide
3. Verify screen reader announces:
   - Trainer name
   - Position
   - Bio content
   - Link descriptions

**Test keyboard navigation**:
1. Use Tab key to navigate through slide
2. Verify focus indicators are visible
3. Test that links are accessible via keyboard

**Pass Criteria**: ✅ Accessible to screen readers and keyboard users

---

## Integration Testing

**Test with CI/CD**:
1. Commit changes to feature branch
2. Verify CI builds successfully
3. Check that environment variables work in CI
4. Verify built artifacts are correct

**Pass Criteria**: ✅ Works in CI/CD pipeline

---

## Edge Cases

### Test with Special Characters in Name

Create trainer with special characters:
```json
{
  "name": "François Müller",
  "position": "Software Engineer",
  "image": "john-doe.svg"
}
```

**Expected**: Special characters display correctly

### Test with Very Long Bio

Create trainer with 500-character bio.

**Expected**: Bio displays properly, no overflow

### Test with Missing Image File

Create trainer JSON with image that doesn't exist.

**Expected**: Graceful error handling, alt text shows

---

## Test Results Summary

| Test # | Test Name | Status | Notes |
|--------|-----------|--------|-------|
| 1 | Default Trainer | ⏳ Pending | |
| 2 | Switch Trainer | ⏳ Pending | |
| 3 | Invalid Trainer | ⏳ Pending | |
| 4 | .env File | ⏳ Pending | |
| 5 | Build Process | ⏳ Pending | |
| 6 | Helper Script | ⏳ Pending | |
| 7 | Image Formats | ⏳ Pending | |
| 8 | Responsive Layout | ⏳ Pending | |
| 9 | Optional Fields | ⏳ Pending | |
| 10 | Multiple Presentations | ⏳ Pending | |

Status Legend:
- ⏳ Pending
- ✅ Passed
- ❌ Failed
- ⚠️ Passed with Issues

---

## Automated Testing Script

For quick smoke testing, run:

```bash
#!/bin/bash
# Quick smoke test

echo "Testing default trainer..."
npm run dev &
sleep 5
pkill -f "slidev"

echo "Testing jane-smith trainer..."
VITE_TRAINER_NAME=jane-smith npm run dev &
sleep 5
pkill -f "slidev"

echo "Testing invalid trainer (should fallback)..."
VITE_TRAINER_NAME=invalid npm run dev &
sleep 5
pkill -f "slidev"

echo "Smoke tests complete!"
```

---

## Reporting Issues

When reporting issues, include:

1. **Test number** that failed
2. **Steps to reproduce**
3. **Expected vs actual behavior**
4. **Screenshots** (if visual issue)
5. **Browser console errors**
6. **Environment details**:
   - Node.js version
   - npm version
   - Operating system
   - Browser and version

---

## Success Criteria

Feature is considered fully tested and ready when:

- ✅ All 10 core tests pass
- ✅ Works in all major browsers
- ✅ Accessible to screen readers
- ✅ Performance is acceptable
- ✅ No console errors
- ✅ Documentation is accurate
- ✅ Edge cases are handled gracefully

---

**Testing completed by**: ___________________

**Date**: ___________________

**Overall Status**: ⏳ Pending / ✅ Passed / ❌ Failed
