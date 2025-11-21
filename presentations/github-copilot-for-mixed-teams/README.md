# How AI Empowers You on GitHub Platform – Demos

This folder contains the Slidev deck and supporting materials for a 2-hour talk on how AI features empower you across the GitHub Platform.

## Demos Overview

1. **Demo 1 – Copilot in the editor**
   - **Goal:** Show how AI helps write and refactor C# code.
   - **Setup:**
     - Small C# solution (e.g., minimal Web API or service library).
     - Copilot enabled in your editor (VS Code / JetBrains / VS).
   - **Flow:**
     - Start from an empty or partially implemented class.
     - Use comments and method signatures to ask Copilot for implementations and tests.
     - Perform a quick refactor with AI assistance.

2. **Demo 2 – AI-assisted PR review**
   - **Goal:** Demonstrate AI support during pull request review.
   - **Setup:**
     - GitHub repo with a non-trivial open PR (multiple files changed).
     - AI-powered PR experience enabled (where available) or mocked via prepared screenshots.
   - **Flow:**
     - Open the PR and generate/summarize the description.
     - Ask AI to summarize risks and propose additional tests.
     - Highlight how to accept, adapt, or ignore AI suggestions.

3. **Demo 3 – AI-driven refactoring**
   - **Goal:** Use AI to refactor complex C# code while keeping behavior.
   - **Setup:**
     - C# project with a messy controller/service method and tests available.
   - **Flow:**
     - Show the original method and ask AI for refactoring suggestions.
     - Compare a couple of options and pick one.
     - Run tests (or build) to validate behavior.

## Optional / Supporting Demos

- **Security & Governance:** Use a repo with Dependabot and code scanning alerts and ask AI to explain and prioritize issues.
- **Project Management:** Show a GitHub Project board and use AI to summarize status, generate release notes, or turn raw notes into issues.
- **Actions & Integrations:** Present a simple `ai-pr-helper` GitHub Actions workflow and explain how an internal AI service or marketplace action could be wired in.

## Running the Slides

From the repository root:

```bash
npm install   # once
npx slidev presentations/github-copilot-for-mixed-teams/slides.md
```

Use presenter mode to see the timing hints at the top of each slide’s speaker notes.
