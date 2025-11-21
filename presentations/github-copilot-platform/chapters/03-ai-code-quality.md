---
# 3. AI in Code Quality
layout: section
class: 'bg-gradient-to-br from-purple-900 to-slate-900 text-white'
---

# 3. AI in Code Quality

<!-- [55:00–56:00] Transition from individual productivity to team-level code quality: refactoring, consistency, and learning. Image prompt: "AI refactoring old messy code into clean, well-structured C# code, before/after panels". -->

---
layout: two-cols
---

## Refactoring and consistency

<v-clicks>
- Suggest refactorings for long methods or complex branches
- Enforce naming and design patterns via AI-guided reviews
- Help migrate patterns (e.g., sync → async, old APIs → new)
- Use AI explanations to onboard newcomers faster
</v-clicks>

::right::

```csharp
// Before
public async Task<IActionResult> GetOrder(int id)
{
  var order = await _db.Orders.FindAsync(id);
  if (order == null)
  {
    return NotFound();
  }
  if (!order.IsActive || order.IsDeleted)
  {
    return BadRequest("Order inactive");
  }
  // more conditions...
}

// Ask AI: "Refactor this method to be more readable
// and follow early-return patterns."
```

<!-- [56:00–61:00] Explain how you’d use AI to propose refactorings and then review them like you would a junior colleague’s PR. Image prompt: "split C# code view showing cluttered method on the left and cleaner refactored version on the right, with AI sparkles bridging them". -->

---
layout: default
---

## Demo 3 – AI-driven refactoring

<v-clicks>
- Open a messy C# service or controller method
- Ask AI to propose refactorings and explanations
- Compare multiple suggestions and pick the best ideas
- Run tests (or compile) to validate the change
</v-clicks>

<!-- [61:00–73:00] Demo idea: show how AI can both suggest and explain refactorings, which helps with learning and code reviews. Emphasize that tests and your judgment still decide the final shape. Image prompt: "terminal and editor side by side, tests passing after refactor with a subtle AI glow". -->
