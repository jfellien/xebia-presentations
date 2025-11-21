---
# 6. Extensibility: Actions, Apps, and Integrations with AI
---

layout: section
class: 'bg-gradient-to-br from-purple-900 to-slate-900 text-white'

# 6. Extensibility: Actions, Apps, and Integrations with AI

<!-- [109:00–110:00] Transition into how to extend GitHub with AI-powered workflows using Actions, apps, and external services. Image prompt: "workflow diagram with GitHub Actions icons and AI nodes". -->

---

layout: two-cols

## GitHub Actions with AI in the loop

<v-clicks>
- Use AI to generate or review workflow YAML
- Trigger AI checks on PRs (e.g., summary, risk analysis)
- Post AI-generated comments with suggestions
- Combine with existing CI to keep trust and traceability
</v-clicks>

::right::

```yaml
name: ai-pr-helper

on:
  pull_request:
    types: [opened, synchronize]

jobs:
  summarize:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Generate AI summary
        uses: your-org/ai-pr-summary-action@v1
        with:
          github-token: ${{ secrets.GITHUB_TOKEN }}
```

<!-- [110:00–116:00] Show how AI can be invoked in CI via Actions, without hard-coding model details into your app. Image prompt: "YAML workflow diagram with an AI-branded step highlighted". -->

---

layout: default

## Apps and integrations

<v-clicks>
- GitHub Apps that react to webhooks and call AI services
- ChatOps bots integrated into issues and PRs
- Custom dashboards combining repo data and AI insights
- Governance: centralize AI access and auditing
</v-clicks>

<!-- [116:00–121:00] Keep this high level; give examples of internal tools orgs often build (e.g., an internal AI reviewer bot). Image prompt: "chat-style interface embedded in a PR with AI bot messages". -->
