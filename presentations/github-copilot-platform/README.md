# GitHub Copilot on Platform - Presentation

A comprehensive 2-hour talk exploring how GitHub Copilot empowers your daily development workflow on the GitHub platform, beyond just IDE code completion.

## 📋 Overview

**Title:** How GitHub Copilot Empowers You on GitHub Platform  
**Duration:** 2 hours (including breaks and demos)  
**Language:** English  
**Format:** Slidev presentation with live demonstrations  
**Audience:** Mixed developers (beginners to experts) already using GitHub

## 🎯 Topics Covered

- **What is GitHub Copilot on Platform?** - Understanding the full platform integration
- **Architecture & How It Works** - Technical deep dive into components and data flow
- **Daily Work Use Cases** - Real-world scenarios and practical applications
- **Comparison** - IDE Copilot vs Platform Copilot features and when to use each
- **Configuration & Security** - Enterprise controls and best practices
- **Live Demos** - PR summaries, code reviews, and the coding agent in action
- **Best Practices** - Team guidelines, prompting techniques, and maximizing value

## 🚀 Quick Start

### Prerequisites

- Node.js 18+ installed
- npm or yarn package manager
- Modern web browser (Chrome, Firefox, Edge)

### Installation

```bash
# Clone or navigate to this repository
cd github-copilot-on-github-platform

# Install dependencies
npm install

# Start development server
npm run dev
```

The presentation will automatically open in your browser at `http://localhost:3030`

### Available Commands

```bash
npm run dev          # Start dev server with hot reload
npm run build        # Build for production
npm run export       # Export slides
npm run export:pdf   # Export as PDF
npm run export:pptx  # Export as PowerPoint
```

## 📁 Repository Structure

```
.
├── slides.md              # Main presentation slides (Slidev markdown)
├── DEMO-SCRIPTS.md        # Detailed demo instructions
├── README.md              # This file
├── package.json           # Dependencies and scripts
└── public/               # Images and assets (create as needed)
```

## 🎬 Demo Preparation

### Demo 1: PR Summary Generation
**Preparation time:** 15 minutes

1. Create a feature branch with multiple commits
2. Include realistic changes (refactoring, tests, bug fixes)
3. **Do not create the PR yet** - this is done live

### Demo 2: Code Review with Copilot
**Preparation time:** 10 minutes

1. Create a PR with intentionally flawed code
2. Include common issues:
   - Security vulnerabilities (plaintext passwords)
   - Missing async/await patterns
   - No input validation
   - Poor error handling

### Demo 3: GitHub Copilot Coding Agent
**Preparation time:** 20 minutes

1. Enable GitHub Copilot coding agent in your repository
2. Create a detailed issue with clear requirements
3. **Have a backup PR ready** in case live demo takes too long

📖 **See [DEMO-SCRIPTS.md](./DEMO-SCRIPTS.md) for detailed step-by-step instructions**

## 🖼️ Image Suggestions

Throughout the presentation, slides include comments suggesting visuals:

- Architecture diagrams (use Mermaid or draw.io)
- GitHub UI screenshots
- Before/after comparisons
- Security layer diagrams
- Workflow illustrations

Place images in the `public/` directory and reference them in `slides.md`:

```markdown
![Description](/image-name.png)
```

## 🎨 Customization

### Updating Content

Edit `slides.md` to customize:
- Add your organization's logo
- Update statistics with your team's data
- Add company-specific examples
- Include your own screenshots

### Branding

Modify the frontmatter in `slides.md`:

```yaml
---
theme: default  # Change to your preferred theme
background: https://your-image-url
# Add your custom configuration
---
```

### Theme Options

Slidev supports many themes. To change:

```bash
npm install @slidev/theme-seriph  # Example theme
```

Then update `slides.md`:
```yaml
theme: seriph
```

See [Slidev themes](https://sli.dev/themes/gallery.html) for more options.

## 📝 Presentation Flow

### Part 1: Foundation (40 minutes)
- Introduction and agenda
- What is GitHub Copilot on Platform?
- Architecture and how it works
- **Break** (5 minutes)

### Part 2: Deep Dive (40 minutes)
- Daily work use cases
- Comparison: IDE vs Platform
- Configuration and security
- **Break** (10 minutes)

### Part 3: Hands-On (40 minutes)
- Demo 1: PR Summary Generation (5-7 min)
- Demo 2: Code Review with Copilot (8-10 min)
- Demo 3: Coding Agent (10-12 min)
- Best practices and tips
- Q&A (remaining time)

## 🔧 Technical Requirements

### For Presenter

- **Computer**: Modern laptop with good internet connection
- **Browser**: Chrome or Edge (best Slidev compatibility)
- **GitHub Account**: With Copilot Business/Enterprise access
- **Demo Repositories**: Prepared and tested
- **Backup**: Mobile hotspot, pre-recorded videos, screenshots

### For Venue

- **Projector/Screen**: 1920x1080 or better
- **Internet**: Stable WiFi or ethernet
- **Audio**: Microphone if room is large
- **Backup**: Ability to connect to alternative internet source

## 📚 Resources

### Official Documentation
- [GitHub Copilot Documentation](https://docs.github.com/copilot)
- [Slidev Documentation](https://sli.dev/)
- [GitHub Copilot Trust Center](https://copilot.github.trust.page/)

### Learning Materials
- [Microsoft Learn - GitHub Copilot](https://learn.microsoft.com/en-us/training/modules/introduction-to-github-copilot/)
- [GitHub Skills](https://skills.github.com/)
- [GitHub Blog - Copilot Updates](https://github.blog/tag/github-copilot/)

## 🤝 Contributing

Improvements and feedback welcome! To contribute:

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test the presentation locally
5. Submit a pull request

## 📄 License

This presentation is provided as-is for educational and professional use.

## 🐛 Troubleshooting

### Slides not loading
```bash
# Clear cache and reinstall
rm -rf node_modules package-lock.json
npm install
npm run dev
```

### Export fails
```bash
# Ensure playwright is installed
npx playwright install chromium
npm run export:pdf
```

### Copilot not working in demos
- Verify your GitHub Copilot subscription is active
- Check repository settings for Copilot features
- Review [Demo Scripts](./DEMO-SCRIPTS.md) fallback plans

### Presentation mode issues
- Try different browser (Chrome recommended)
- Disable browser extensions temporarily
- Check browser console for errors

## 💡 Tips for Presenters

### Before Presenting

- [ ] Run through slides at least once
- [ ] Test all demos in presentation environment
- [ ] Verify internet connectivity
- [ ] Prepare backup content (screenshots, videos)
- [ ] Clear browser notifications and history
- [ ] Close unnecessary applications
- [ ] Have demo repositories open in tabs
- [ ] Test screen sharing/projection

### During Presentation

- [ ] Use presenter mode (press `P` in Slidev)
- [ ] Speak to the audience, not the screen
- [ ] Pause for questions after major sections
- [ ] Monitor time and adjust pace accordingly
- [ ] Engage with audience during demos
- [ ] Have water nearby

### After Presentation

- [ ] Share slide link with attendees
- [ ] Collect feedback
- [ ] Follow up on questions you couldn't answer
- [ ] Update slides based on feedback

## 📞 Support

For issues or questions about:

- **Slidev**: [Slidev GitHub Issues](https://github.com/slidevjs/slidev/issues)
- **GitHub Copilot**: [GitHub Support](https://support.github.com)
- **This Presentation**: Open an issue in this repository

## 🎓 About

This presentation was created to help developers and teams understand and leverage GitHub Copilot's full platform capabilities beyond IDE code completion.

**Target Audience:**
- Developers using GitHub and interested in AI assistance
- Teams evaluating GitHub Copilot
- Engineering managers exploring productivity tools
- DevOps professionals optimizing workflows

**Learning Outcomes:**

After this talk, attendees will:
- ✅ Understand GitHub Copilot's platform features
- ✅ Know when to use IDE vs Platform Copilot
- ✅ Be able to configure and secure Copilot for their team
- ✅ Have practical knowledge of PR summaries, code reviews, and coding agents
- ✅ Apply best practices for prompting and collaboration

## 🌟 Acknowledgments

Built with:
- [Slidev](https://sli.dev/) - Presentation framework for developers
- [Mermaid](https://mermaid.js.org/) - Diagram generation
- [GitHub Copilot](https://github.com/features/copilot) - The star of the show!

---

**Ready to present?** Run `npm run dev` and navigate through the slides with arrow keys or Space bar!

For detailed demo instructions, see [DEMO-SCRIPTS.md](./DEMO-SCRIPTS.md)

Good luck! 🚀
