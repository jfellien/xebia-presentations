# Part 3: Hands-On

Live Demos & Best Practices

---

# Demo 1: PR Summary Generation

## Scenario
We have a C# service with multiple changes across several files

### Setup
- Feature branch: `feature/auth-improvements`
- Changes:
  - Refactored authentication service
  - Added dependency injection
  - Updated configuration
  - Added unit tests
  - Fixed bug in token validation

### Live Demo Steps
1. Create PR on GitHub
2. Click "Copilot: Write PR Description"
3. Review generated summary
4. Customize if needed
5. Commit

<!--
DEMO SCRIPT:
1. Show the branch with changes
2. Click "Create Pull Request"
3. Show empty description
4. Click Copilot button
5. Wait for generation
6. Highlight key sections
7. Show how to edit
8. Finalize PR
-->

---

# Demo 1: Expected Result

````md
## Summary
Refactored authentication service to improve maintainability and 
testability by introducing dependency injection pattern.

## Changes

### Authentication Service
- ✅ Extracted `IAuthenticationService` interface
- ✅ Implemented constructor injection for `IConfiguration`
- ✅ Removed static dependencies
- ✅ Added async/await throughout

### Configuration
- ✅ Moved auth settings to `appsettings.json`
- ✅ Added configuration validation on startup
- ✅ Updated documentation

### Bug Fixes
- 🐛 Fixed token expiration validation edge case
- 🐛 Corrected timezone handling in token generation

### Tests
- ✅ Added 15 new unit tests
- ✅ Achieved 95% code coverage
- ✅ Added integration test for OAuth flow

## Breaking Changes
⚠️ Constructor signature changed - migration guide in docs/auth-migration.md

## Testing
- All tests passing
- Manual testing completed
- Performance benchmarks maintained
````

<!--
This is what Copilot typically generates - comprehensive and well-structured.
-->

---

# Demo 2: Code Review with Copilot

## Scenario
Reviewing a PR that adds a new API endpoint

### C# Code Under Review

```csharp
// UserController.cs - New endpoint
[HttpPost("users")]
public IActionResult CreateUser([FromBody] CreateUserRequest request)
{
    var user = new User
    {
        Email = request.Email,
        Name = request.Name,
        Password = request.Password
    };
    
    _context.Users.Add(user);
    _context.SaveChanges();
    
    return Ok(user);
}
```

### What Will Copilot Catch?
Let's see in the demo...

<!--
DEMO SCRIPT:
1. Open the PR
2. Show the code diff
3. Click "Review with Copilot"
4. Wait for AI review comments
5. Go through each suggestion
6. Show how to apply suggestions
7. Request changes or approve
-->

---

# Demo 2: Copilot Review Comments

<div class="text-sm">

### 🔴 Security Issue: Storing Plain Text Password

```csharp
// Current code stores password in plain text
Password = request.Password  // ❌ Security vulnerability

// Copilot suggests:
public IActionResult CreateUser([FromBody] CreateUserRequest request)
{
    var passwordHash = _passwordHasher.HashPassword(request.Password);
    var user = new User
    {
        Email = request.Email,
        Name = request.Name,
        PasswordHash = passwordHash  // ✅ Store hashed password
    };
    // ...
}
```

### 🟡 Best Practice: Missing Validation

```csharp
// Add input validation
if (string.IsNullOrWhiteSpace(request.Email) || 
    !IsValidEmail(request.Email))
{
    return BadRequest("Invalid email address");
}
```

### 🟡 Best Practice: Async Pattern

```csharp
// Change to async for better scalability
public async Task<IActionResult> CreateUserAsync(
    [FromBody] CreateUserRequest request,
    CancellationToken cancellationToken = default)
{
    // ... user creation ...
    await _context.SaveChangesAsync(cancellationToken);
    return Ok(user);
}
```

### 🟢 Suggestion: Error Handling

```csharp
try 
{
    // ... user creation ...
}
catch (DbUpdateException ex)
{
    _logger.LogError(ex, "Failed to create user");
    return StatusCode(500, "Error creating user");
}
```

</div>

<!--
These are typical issues Copilot catches automatically.
-->

---

# Demo 3: GitHub Copilot Coding Agent

## Scenario
Create a feature from an issue description

### Issue Template

**Title:** Add CSV export to UserReport

**Description:**
```markdown
As a user, I want to export user reports to CSV format.

Requirements:
- Add ExportToCsv method to UserReportService
- Include headers: Id, Name, Email, Created, LastLogin
- Format dates as ISO 8601
- Escape special characters in text fields
- Add unit tests

Acceptance Criteria:
- Method returns CSV string
- Handles empty lists
- Null values represented as empty strings
- Tests achieve >90% coverage
```

### Demo: Assign to @copilot

<!--
DEMO SCRIPT:
1. Show the issue
2. Comment: "@copilot implement this"
3. Wait for agent to respond (shows 👀)
4. Agent creates branch and PR
5. Review the implementation
6. Show tests
7. Request a change
8. Agent updates
9. Approve and merge
-->

---

# Demo 3: Expected Implementation

```csharp
// UserReportService.cs - Added by Copilot
public string ExportToCsv(List<UserReport> reports)
{
    if (reports == null || !reports.Any())
        return "Id,Name,Email,Created,LastLogin\n";
    
    var sb = new StringBuilder();
    sb.AppendLine("Id,Name,Email,Created,LastLogin");
    
    foreach (var report in reports)
    {
        sb.AppendLine(string.Join(",",
            report.Id,
            EscapeCsvField(report.Name ?? string.Empty),
            EscapeCsvField(report.Email ?? string.Empty),
            report.Created.ToString("o"),
            report.LastLogin?.ToString("o") ?? string.Empty
        ));
    }
    
    return sb.ToString();
}

private string EscapeCsvField(string field)
{
    if (field.Contains(',') || field.Contains('"') || field.Contains('\n'))
        return $"\"{field.Replace("\"", "\"\"")}\"";
    return field;
}
```

<!--
Copilot implements based on requirements, including edge cases and proper escaping.
-->

---

# Demo 3: Generated Tests

```csharp
// UserReportServiceTests.cs - Added by Copilot
[TestClass]
public class UserReportServiceTests
{
    private UserReportService _service;
    
    [TestInitialize]
    public void Setup()
    {
        _service = new UserReportService();
    }
    
    [TestMethod]
    public void ExportToCsv_WithValidData_ReturnsCorrectFormat()
    {
        // Arrange
        var reports = new List<UserReport>
        {
            new UserReport 
            { 
                Id = 1, 
                Name = "John Doe", 
                Email = "john@example.com",
                Created = new DateTime(2024, 1, 1),
                LastLogin = new DateTime(2024, 11, 21)
            }
        };
        
        // Act
        var result = _service.ExportToCsv(reports);
        
        // Assert
        Assert.IsTrue(result.Contains("Id,Name,Email,Created,LastLogin"));
        Assert.IsTrue(result.Contains("John Doe"));
    }
    
    [TestMethod]
    public void ExportToCsv_WithEmptyList_ReturnsHeaderOnly()
    {
        var result = _service.ExportToCsv(new List<UserReport>());
        Assert.AreEqual("Id,Name,Email,Created,LastLogin\n", result);
    }
    
    [TestMethod]
    public void ExportToCsv_WithSpecialCharacters_EscapesProperly()
    {
        var reports = new List<UserReport>
        {
            new UserReport 
            { 
                Id = 1, 
                Name = "John, \"Junior\" Doe", 
                Email = "john@example.com",
                Created = DateTime.Now,
                LastLogin = null
            }
        };
        
        var result = _service.ExportToCsv(reports);
        Assert.IsTrue(result.Contains("\"John, \"\"Junior\"\" Doe\""));
    }
}
```

<!--
Copilot also writes comprehensive tests, including edge cases.
-->

---

# Best Practices for Prompting

<div class="grid grid-cols-2 gap-8">

<div>

## PR Descriptions

**❌ Vague:**
> "Fix stuff"

**✅ Good:**
> "Refactor authentication to use DI"

**💎 Best:**
```markdown
## Context
Old auth service used static methods

## Changes
- Added IAuthService interface
- Constructor injection
- Async patterns
- Unit tests

## Why
Better testability and maintainability
```

</div>

<div>

## Issues for Coding Agent

**❌ Too Broad:**
> "Make the app better"

**✅ Good:**
> "Add CSV export to reports"

**💎 Best:**
```markdown
## Goal
Export user reports to CSV

## Requirements
- Method: ExportToCsv()
- Fields: Id, Name, Email, dates
- ISO 8601 date format
- Escape special characters

## Tests
Unit tests with >90% coverage

## Examples
Input: List<UserReport>
Output: CSV string
```

</div>

</div>

<!--
Clear, specific prompts produce better results. Think of Copilot as a junior developer - be explicit.
-->

---

# Best Practices: Code Review

<v-clicks>

## 1. **Trust but Verify**
- Review Copilot suggestions carefully
- Not all suggestions are perfect
- Use your expertise to judge
- Test suggested changes

## 2. **Context Matters**
- Ensure Copilot has full context
- Link related issues/PRs
- Add comments for clarity
- Update descriptions if needed

## 3. **Iterative Refinement**
- First suggestion may not be perfect
- Ask for alternatives
- Provide feedback in comments
- Iterate until satisfied

## 4. **Security Always First**
- Double-check security suggestions
- Validate authentication changes
- Review permission changes
- Test security scenarios

</v-clicks>

---

# Best Practices: Team Collaboration

<div class="grid grid-cols-2 gap-6">

<div>

## Team Guidelines

**Establish Standards:**
- When to use Copilot
- How to review AI suggestions
- Required human review steps
- Escalation process

**Documentation:**
- How Copilot was used
- What was AI-generated
- What was manually edited
- Rationale for changes

</div>

<div>

## Communication

**Be Transparent:**
```markdown
## Implementation
Initial code generated by GitHub 
Copilot coding agent, then refined 
based on review comments.

## Changes Made
- Added error handling (manual)
- Updated tests (Copilot + manual)
- Refactored for clarity (manual)
```

**In Code Comments:**
```csharp
// Implementation suggested by Copilot
// Modified to match our logging standards
_logger.LogInformation(
    "User {UserId} created", user.Id);
```

</div>

</div>

<!--
Transparency about AI usage builds trust and helps the team learn.
-->

---

# Best Practices: Configuration

<v-clicks>

## 1. **Start Conservative**
- Enable for pilot team first
- Gather feedback
- Adjust policies
- Gradually expand

## 2. **Monitor Usage**
- Track adoption metrics
- Identify pain points
- Celebrate wins
- Adjust training

## 3. **Regular Review**
- Monthly policy check
- Update exclusions
- Review security logs
- Update team guidelines

## 4. **Stay Updated**
- New features release regularly
- Read release notes
- Attend training sessions
- Share learnings

</v-clicks>

---

# Common Pitfalls to Avoid

<div class="grid grid-cols-2 gap-6">

<div>

## ❌ Don'ts

**Blind Acceptance:**
- Don't accept all suggestions
- Don't skip review
- Don't ignore warnings
- Don't bypass security checks

**Over-Reliance:**
- Don't stop learning
- Don't ignore fundamentals
- Don't skip testing
- Don't forget about performance

**Security Lapses:**
- Don't expose secrets
- Don't disable security features
- Don't skip compliance checks
- Don't ignore audit logs

</div>

<div>

## ✅ Do's

**Active Participation:**
- Do review all AI code
- Do run tests
- Do understand changes
- Do ask questions

**Continuous Learning:**
- Do learn from suggestions
- Do share knowledge
- Do experiment
- Do provide feedback

**Maintain Standards:**
- Do follow coding standards
- Do document decisions
- Do security reviews
- Do performance testing

</div>

</div>

<!--
Copilot is a powerful tool, but you're still the developer in charge.
-->

---

# Tips for Maximum Productivity

<v-clicks>

## 🚀 Quick Wins

1. **Always use PR summaries** - Saves 5-10 min per PR
2. **Enable AI code review** - Catches 60-80% of common issues
3. **Clear issue descriptions** - Better coding agent results
4. **Use inline chat** - Quick questions without context switch
5. **Leverage templates** - Consistent prompts = better results

## 📈 Advanced Techniques

1. **Chain interactions** - Build on previous responses
2. **Reference documentation** - Link to specs in prompts  
3. **Request alternatives** - "Show me 3 ways to do this"
4. **Ask for explanations** - "Why did you suggest this?"
5. **Iterate in comments** - Refine through conversation

## 🎯 Team Strategies

1. **Share prompts** - Build a prompt library
2. **Review patterns** - Learn from AI suggestions
3. **Feedback loops** - Report issues and improvements
4. **Training sessions** - Regular team workshops
5. **Measure impact** - Track time saved and quality improvements

</v-clicks>

---

# Real-World Impact: Metrics

<div class="grid grid-cols-2 gap-8">

<div>

## Time Savings

**PR Descriptions:**
- Manual: 10-15 minutes
- With Copilot: 2-3 minutes
- **Savings: 80%**

**Code Reviews:**
- Manual review: 30-45 minutes
- AI-assisted: 20-30 minutes
- **Savings: 30-40%**

**Feature Implementation:**
- Traditional: 2-4 hours
- With coding agent: 1-2 hours (+ review)
- **Savings: 40-50%**

</div>

<div>

## Quality Improvements

**Fewer Bugs:**
- Pre-Copilot: ~12 bugs/sprint
- Post-Copilot: ~7 bugs/sprint
- **Improvement: 40%**

**Better Documentation:**
- Docs updated: 65% → 92%
- **Improvement: 42%**

**Security Issues:**
- Common issues caught: 85%
- Before merge: 95%
- **Proactive prevention**

</div>

</div>

<div class="mt-6 p-4 bg-green-500 bg-opacity-10 rounded text-center">
💡 Average team productivity increase: <strong>25-35%</strong>
</div>

<!--
These are industry averages - actual results vary by team and use case.
-->

---

# Resources & Learning

<div class="grid grid-cols-2 gap-6">

<div>

## Official Documentation

📚 **GitHub Copilot Docs**
- [docs.github.com/copilot](https://docs.github.com/copilot)
- Getting started guides
- API reference
- Best practices

📺 **Video Tutorials**
- GitHub YouTube channel
- Microsoft Learn
- Community demos

📝 **Blogs & Articles**
- GitHub Blog
- Developer success stories
- Case studies

</div>

<div>

## Community & Support

💬 **Forums & Discussion**
- GitHub Community
- Stack Overflow
- Reddit r/github

🎓 **Training**
- Microsoft Learn paths
- GitHub Skills
- Partner certifications

🔧 **Tools & Extensions**
- VS Code marketplace
- GitHub Actions
- Integration guides

📧 **Stay Updated**
- GitHub Changelog
- Release notes
- Newsletter

</div>

</div>

<!--
Continuous learning is key to getting the most value from Copilot.
-->
