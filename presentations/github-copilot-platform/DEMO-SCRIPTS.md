# Demo Scripts for GitHub Copilot on Platform

This document contains detailed step-by-step instructions for all live demonstrations in the presentation.

## Table of Contents

1. [Demo 1: PR Summary Generation](#demo-1-pr-summary-generation)
2. [Demo 2: Code Review with Copilot](#demo-2-code-review-with-copilot)
3. [Demo 3: GitHub Copilot Coding Agent](#demo-3-github-copilot-coding-agent)

---

## Demo 1: PR Summary Generation

**Duration:** 5-7 minutes  
**Slide Reference:** "Demo 1: PR Summary Generation"

### Prerequisites

- GitHub repository with Copilot enabled
- Feature branch with multiple commits ready: `feature/auth-improvements`
- Changes should include:
  - Authentication service refactoring
  - Configuration updates
  - New unit tests
  - Bug fixes

### Preparation (Before Talk)

1. Create a feature branch with realistic changes
2. Make 4-5 meaningful commits
3. DO NOT create the PR yet (do this live)

### Demo Script

#### Step 1: Navigate to Repository
```
"Let me show you how Copilot helps with PR descriptions. 
I have a feature branch with authentication improvements."
```

- Open your repository on GitHub.com
- Navigate to the "Pull requests" tab
- Show the existing branches

#### Step 2: Create Pull Request
```
"I'll create a new pull request for my auth improvements branch."
```

- Click "New pull request"
- Select base: `main`, compare: `feature/auth-improvements`
- Show the diff briefly:
  - "As you can see, there are multiple files changed"
  - Point out: service files, tests, config

#### Step 3: Show Empty Description
```
"Normally, I'd have to write all of this manually. 
Let's see how Copilot can help."
```

- Scroll to the description field
- Show it's empty
- Point to the Copilot button (sparkle icon)

#### Step 4: Generate Summary
```
"I'll click the Copilot button to generate a summary."
```

- Click "✨ Copilot" or "Generate summary" button
- Wait for generation (usually 5-10 seconds)
- Show the loading indicator

#### Step 5: Review Generated Content
```
"Look at what Copilot generated based on my commits and code changes."
```

Read through sections:
- **Summary**: High-level overview
- **Changes**: Detailed breakdown by category
- **Breaking Changes**: Important callouts
- **Testing**: What was tested

Point out:
- "It categorized changes logically"
- "It identified the breaking change"
- "It even mentioned test coverage"
- "It formatted with proper Markdown"

#### Step 6: Customize (Optional)
```
"I can edit this if needed - it's just a starting point."
```

- Make a small edit (e.g., add an emoji or clarify something)
- Show it's editable markdown
- "This would have taken me 10-15 minutes to write manually"

#### Step 7: Create PR
```
"That's it! I'll create the pull request with this description."
```

- Scroll down
- Click "Create pull request"
- Show the created PR with the nice description

### Key Talking Points

- ✅ Saves 10-15 minutes per PR
- ✅ Consistent format across team
- ✅ Catches details you might forget
- ✅ Always editable - it's a starting point
- ✅ Uses commit messages + actual code changes

### Fallback Plan

If Copilot button doesn't appear or fails:
- Have a pre-recorded video ready
- OR: Have a screenshot showing the before/after
- OR: Show an existing PR with a Copilot-generated description

---

## Demo 2: Code Review with Copilot

**Duration:** 8-10 minutes  
**Slide Reference:** "Demo 2: Code Review with Copilot"

### Prerequisites

- Existing PR with code that has issues (prepared beforehand)
- The code should have realistic problems:
  - Security issue (plaintext password)
  - Missing async/await
  - No input validation
  - Poor error handling

### Preparation (Before Talk)

Create a PR with this intentionally flawed C# code:

```csharp
// UserController.cs
[HttpPost("users")]
public IActionResult CreateUser([FromBody] CreateUserRequest request)
{
    var user = new User
    {
        Email = request.Email,
        Name = request.Name,
        Password = request.Password  // Plaintext password!
    };
    
    _context.Users.Add(user);
    _context.SaveChanges();  // Synchronous
    
    return Ok(user);  // Returns sensitive data
}
```

### Demo Script

#### Step 1: Open the PR
```
"I have a pull request here that adds a new user registration endpoint. 
Let's review it with Copilot's help."
```

- Navigate to the PR
- Show the "Files changed" tab
- Scroll through the code briefly

#### Step 2: Initiate Copilot Review
```
"Instead of reviewing this manually, I'll ask Copilot to analyze it first."
```

- Look for Copilot review button (location varies by GitHub UI version)
- Options:
  - Click "Copilot: Review changes" button
  - Or use comment: "@copilot review this PR"
- Show the loading state

#### Step 3: Review Security Finding
```
"Copilot immediately identified a critical security issue."
```

- Point to the comment about plaintext password
- Read Copilot's explanation
- Show the suggested code fix
- Highlight severity: "🔴 Security Issue"

**Key point:**
```
"This is exactly the kind of thing that's easy to miss in manual review, 
especially for junior developers. Copilot caught it immediately."
```

#### Step 4: Review Best Practice Issues
```
"It also found several best practice violations."
```

Go through each:

1. **Missing Async Pattern**
   - Show synchronous `SaveChanges()`
   - Show Copilot's suggestion for `async/await`
   - Explain why: "Better scalability under load"

2. **No Input Validation**
   - Show missing null checks
   - Show suggested validation code
   - "Defense in depth principle"

3. **No Error Handling**
   - Show lack of try-catch
   - Show suggested exception handling
   - "Production-ready code needs proper error handling"

#### Step 5: Apply a Suggestion
```
"I can apply these suggestions directly in the review."
```

- Click on one of Copilot's suggestions
- Show the "Apply suggestion" button
- Apply it (or simulate)
- Show how it integrates into review workflow

#### Step 6: Request Changes
```
"Based on Copilot's review and my own assessment, 
I'll request changes from the author."
```

- Click "Review changes" button
- Select "Request changes"
- Add comment: "Please address Copilot's security and best practice findings"
- Submit review

### Key Talking Points

- ✅ Catches 60-80% of common issues automatically
- ✅ Educational - explains WHY something is wrong
- ✅ Suggests specific fixes, not just problems
- ✅ Consistent standards across all reviews
- ✅ Frees humans to focus on architecture and business logic
- ⚠️ Still need human review - Copilot is not infallible

### Fallback Plan

If live demo fails:
- Have screenshots of each step
- Pre-recorded video of the review process
- Static example showing before/after code

---

## Demo 3: GitHub Copilot Coding Agent

**Duration:** 10-12 minutes (or longer if you want to show full iteration)  
**Slide Reference:** "Demo 3: GitHub Copilot Coding Agent"

### Prerequisites

- Repository with Copilot coding agent enabled
- GitHub Copilot Business or Enterprise subscription
- A well-defined issue ready to be implemented

### Preparation (Before Talk)

1. **Enable Copilot Coding Agent**
   - Repository Settings → GitHub Apps → Install Copilot
   - Enable "Allow Copilot to create branches and PRs"

2. **Prepare the Issue**

Create an issue with this content:

```markdown
Title: Add CSV export to UserReport

## Description
As a user, I want to export user reports to CSV format for analysis in Excel.

## Requirements
1. Add `ExportToCsv` method to `UserReportService` class
2. Include these fields in CSV:
   - Id (number)
   - Name (text)
   - Email (text) 
   - Created (ISO 8601 date)
   - LastLogin (ISO 8601 date, nullable)
3. CSV must have header row
4. Escape special characters (commas, quotes, newlines)
5. Handle null values as empty strings
6. Handle empty list (return header only)

## Technical Notes
- Use `StringBuilder` for efficiency
- Follow existing code style in `UserReportService.cs`
- Format dates using `ToString("o")` for ISO 8601

## Acceptance Criteria
- [ ] Method returns valid CSV string
- [ ] All fields included in correct order
- [ ] Special characters properly escaped
- [ ] Empty list handled gracefully
- [ ] Unit tests included
- [ ] Tests achieve >90% code coverage

## Files to Modify
- `Services/UserReportService.cs` - add method
- `Services.Tests/UserReportServiceTests.cs` - add tests

## Example
Input: List with 2 users
Output:
```csv
Id,Name,Email,Created,LastLogin
1,John Doe,john@example.com,2024-01-01T00:00:00.0000000Z,2024-11-21T10:30:00.0000000Z
2,Jane Smith,jane@example.com,2024-01-15T00:00:00.0000000Z,
```
```

### Demo Script

#### Step 1: Show the Issue
```
"I have an issue here describing a new feature we need - 
CSV export for user reports. Instead of implementing this myself, 
I'm going to assign it to the Copilot coding agent."
```

- Open the issue
- Scroll through the requirements
- Highlight key points:
  - "Clear requirements"
  - "Acceptance criteria"
  - "Example output"
  - "Specific files to modify"

**Key point:**
```
"Notice how detailed the issue is. The more context you give Copilot, 
the better results you'll get. Think of it as briefing a junior developer."
```

#### Step 2: Assign to Copilot
```
"To trigger the coding agent, I'll add a comment assigning this to Copilot."
```

- Click in the comment box
- Type: `@copilot implement this feature`
- OR type: `@copilot please implement the CSV export as described`
- Submit comment

#### Step 3: Copilot Acknowledges
```
"Copilot acknowledges immediately with the eyes emoji."
```

- Point to Copilot's response (usually within seconds)
- Should see: 👀 emoji reply
- Explain: "This means Copilot is working on it"

#### Step 4: Monitoring Progress
```
"Now Copilot is analyzing the codebase and creating an implementation plan. 
This usually takes 2-5 minutes."
```

**IMPORTANT:** This is where timing matters for live demo

**Option A: If you have time (10+ minutes)**
- Wait for Copilot to complete
- Show the progress updates in real-time
- Point out: "It's analyzing the existing code structure"

**Option B: If timing is tight (recommended)**
- Say: "To save time, I'll show you one I prepared earlier"
- Switch to a pre-completed issue/PR
- Explain: "This is exactly what Copilot generates after a few minutes"

#### Step 5: Review the Implementation

Navigate to the PR that Copilot created:

```
"Copilot has created a pull request with the implementation. 
Let's see what it did."
```

**Review the PR description:**
- Show Copilot's summary of changes
- Point out the implementation plan it followed
- "It documented its approach"

**Review the code:**

```csharp
// Show UserReportService.cs changes
public string ExportToCsv(List<UserReport> reports)
{
    // Point out:
    // - Handles null/empty list
    // - Uses StringBuilder (we requested this)
    // - Proper escaping method
    // - ISO 8601 dates (we requested this)
}
```

**Talk through the code:**
```
"Notice how Copilot:
- Followed our requirements exactly
- Used StringBuilder as we specified
- Created a helper method for CSV escaping
- Formatted dates in ISO 8601
- Handled null values properly"
```

#### Step 6: Review the Tests

Navigate to the test file:

```
"Copilot also wrote comprehensive unit tests."
```

Show the tests:
```csharp
[TestMethod]
public void ExportToCsv_WithValidData_ReturnsCorrectFormat()
{
    // Point out: realistic test data
}

[TestMethod]
public void ExportToCsv_WithEmptyList_ReturnsHeaderOnly()
{
    // Point out: edge case testing
}

[TestMethod]
public void ExportToCsv_WithSpecialCharacters_EscapesProperly()
{
    // Point out: special character handling
}
```

**Key points:**
```
"Copilot wrote tests for:
- Happy path ✓
- Empty list edge case ✓
- Special character escaping ✓
- Null value handling ✓

This is often the part developers skip or rush through!"
```

#### Step 7: Request a Change (Interactive Demo)

```
"Let's say I want to improve something. I can iterate with Copilot 
just like with a human developer."
```

Add a review comment:
```
"@copilot Can you add a method overload that accepts 
a custom delimiter instead of hardcoding commas? 
This would support TSV (tab-separated) export too."
```

Submit the comment

**If time allows, show Copilot's response:**
- Copilot will update the PR
- Show the new overload method
- Show updated tests

**If short on time:**
```
"In a real scenario, Copilot would update the PR with this change. 
The iteration loop continues until you're satisfied."
```

#### Step 8: Approve and Merge

```
"Once I'm happy with the implementation, I approve like any other PR."
```

- Click "Review changes"
- Select "Approve"
- Add comment: "LGTM! Great job @copilot"
- Submit review
- Show merge button

**Don't actually merge unless this is a throwaway repo**

### Key Talking Points

- ✅ Implements features from natural language descriptions
- ✅ Follows your code style and conventions
- ✅ Writes tests automatically
- ✅ Handles edge cases you specified
- ✅ Iterates based on feedback
- ✅ Works like a junior developer you can guide
- ⚠️ Not perfect - always needs human review
- ⚠️ Best for well-defined, scoped tasks

### Best Practices for Issues (mention these)

**Good issue descriptions:**
- ✅ Clear requirements
- ✅ Specific acceptance criteria
- ✅ Example input/output
- ✅ Files to modify
- ✅ Technical constraints
- ✅ Code style preferences

**Bad issue descriptions:**
- ❌ "Make it better"
- ❌ "Fix the bug" (no details)
- ❌ "Rewrite everything"
- ❌ Vague requirements

### Fallback Plan

If live demo doesn't work:

1. **Pre-recorded video**: Have a 3-minute video showing the full flow
2. **Screenshots**: Step-by-step screenshots of the process
3. **Existing PR**: Show a completed PR from a previous run
4. **GitHub status page**: If GitHub is having issues, acknowledge it

---

## General Demo Tips

### Before the Presentation

- [ ] Test all demos in your environment
- [ ] Have backups ready (screenshots, videos)
- [ ] Check GitHub status (status.github.com)
- [ ] Clear browser cache and cookies
- [ ] Test on the presentation WiFi/network
- [ ] Have mobile hotspot as backup internet
- [ ] Practice timing - know where you can cut if needed
- [ ] Prepare "Plan B" for each demo

### During Presentation

- [ ] Have all browser tabs open and ready
- [ ] Be logged into GitHub
- [ ] Have demo repos open in separate tabs
- [ ] Close unnecessary notifications
- [ ] Use presentation mode / zoom browser
- [ ] Speak clearly while clicking
- [ ] Explain what you're clicking before clicking
- [ ] Pause after each major step
- [ ] Ask audience if they can see clearly

### If Something Goes Wrong

**Copilot not responding:**
- "Copilot seems busy right now - let me show you a prepared example"
- Switch to fallback screenshots/video

**GitHub down/slow:**
- "Looks like GitHub is experiencing some latency"
- Show offline documentation or screenshots

**Wrong output from Copilot:**
- "That's interesting - Copilot had a different interpretation"
- Use it as teaching moment about prompt clarity
- Show the prepared example

**Network issues:**
- Switch to mobile hotspot immediately
- Or switch to pre-recorded videos

### Timing Adjustments

**Running ahead of schedule:**
- Do all three demos fully
- Add more Q&A during demos
- Deep dive into code details
- Show additional examples

**Running behind schedule:**
- Skip Demo 3 live execution (show screenshot/video)
- Reduce Q&A during demos
- Skip optional commentary
- Focus on key points only

---

## Post-Demo Actions

After each demo, reinforce key learnings:

1. **Summarize what was accomplished**
   - "In 5 minutes, we generated a comprehensive PR description"
   - "Copilot caught 4 issues that could have reached production"
   - "The coding agent implemented a feature with tests in minutes"

2. **Connect to their work**
   - "Think about your last PR - how long did the description take?"
   - "How many PRs in your backlog need review right now?"
   - "What's one feature you could delegate to Copilot?"

3. **Invite questions**
   - "Any questions about what you just saw?"
   - "Who wants to try this with their team?"

---

## Additional Resources for Demos

### Sample Repositories

Create these sample repos before the talk:

1. **demo-pr-summary** - For Demo 1
   - Simple C# console app
   - Feature branch with auth changes ready

2. **demo-code-review** - For Demo 2
   - Web API project
   - PR with intentional issues open

3. **demo-coding-agent** - For Demo 3
   - Larger application
   - Issues prepared for Copilot

### Demo Checklist

Print this and have it handy:

```
Pre-Talk Setup:
□ All demo repos accessible
□ Browser tabs organized
□ Logged into GitHub
□ Copilot enabled and working
□ Test internet connection
□ Backup videos/screenshots ready
□ Presentation mode configured
□ Notifications silenced

Demo 1 Ready:
□ Feature branch exists
□ Changes are meaningful
□ No PR created yet

Demo 2 Ready:
□ PR with flawed code open
□ Issues are realistic
□ Files changed visible

Demo 3 Ready:
□ Issue created with details
□ Coding agent enabled
□ Fallback PR ready

Post-Demo:
□ Repo links shared with audience
□ Questions answered
□ Follow-up info collected
```

---

## Troubleshooting

### Common Issues

**Issue**: Copilot button not visible
- **Cause**: Not enabled for repo or user
- **Fix**: Check Settings → GitHub → Copilot, verify subscription

**Issue**: Copilot produces poor results
- **Cause**: Insufficient context in issue/PR
- **Fix**: Add more details, examples, requirements

**Issue**: Coding agent doesn't respond
- **Cause**: Agent not enabled or rate limited
- **Fix**: Check repository settings, wait and retry

**Issue**: Browser performance poor during demo
- **Cause**: Too many tabs/extensions
- **Fix**: Close all unnecessary tabs, disable extensions

### Emergency Contacts

Have these handy during presentation:

- IT support phone number
- GitHub status page: status.github.com
- Venue tech support
- Co-presenter backup contact

---

## Success Metrics

After each demo, quickly assess:

- ✅ Demo completed successfully
- ✅ Key points communicated clearly
- ✅ Audience engaged and understanding
- ✅ Within time budget
- ✅ Smooth transition to next section

If 4/5 are met, you're doing great! 🎉

---

Good luck with your presentation! 🚀
