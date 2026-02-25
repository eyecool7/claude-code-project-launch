# claude-code-project-setup

Automated Claude Code project setup skill. Generate CLAUDE.md + skills + agents + hooks from a single project plan.

## Overview

| Step | What | Where | Reference |
|------|------|-------|-----------|
| **Step 1** | Write project plan | claude.ai chat | `references/project-plan.md` |
| **Step 2** | Refine project plan | Claude Code (Plan mode) | `references/plan-mode-prompt.md` |
| **Step 3** | Install skill | Local machine | (Installation below) |
| **Step 4** | Run project setup | Claude Code | `references/setup-prompt.md` |
| **Step 5** | Start development | Claude Code | — |

---

## Step 1: Write Project Plan — claude.ai Chat

Copy the contents of `references/project-plan.md`. Fill in the **Project Overview** section at the top and send.

Claude conducts an interview to complete a detailed project plan.
Save the file as **project-plan.md** and place it in your project root.

### What the Plan Covers

| Section | Contents | Required |
|---------|----------|----------|
| 1. Product Context | One-liner, background, core features + priorities, success criteria, out of scope | ✅ Required |
| 2. Workflow | User flows, LLM vs script separation, validation + failure handling | ✅ Required |
| 3. Implementation Design | Tech stack, agent structure, skill list, error strategy, dependencies | ✅ Required |
| 4. Technical Decisions | UI tools, data flow, URL structure, external services | ⚪ Optional |
| 5. Implementation Order | Phase-by-phase dependency roadmap | ✅ Required |

---

## Step 2: Refine Project Plan — Claude Code (Plan mode)

Open your project folder in Claude Code and enter the prompt from `references/plan-mode-prompt.md`.

Claude Code reads the plan from Step 1 and conducts a deep technical interview — reviewing implementation approaches, trade-offs, and concerns to strengthen the plan.

---

## Step 3: Install Skill — Local Machine

### Quick Install (git clone)

```bash
cd my-project  # Navigate to your project folder

# Clone this repo temporarily
git clone https://github.com/YOUR_USERNAME/claude-code-project-setup.git /tmp/setup-skill

# Copy only the needed files
cp /tmp/setup-skill/SKILL.md .
cp -r /tmp/setup-skill/.claude .
cp -r /tmp/setup-skill/references .
cp -r /tmp/setup-skill/scripts .

# Remove temp clone
rm -rf /tmp/setup-skill
```

### Manual Install (zip download)

Download the zip from GitHub and copy these files to your project folder:

```
Repo contents                          →    Place in my-project/
───────────────────────────────         ──────────────────
SKILL.md                          →    my-project/SKILL.md
.claude/                          →    my-project/.claude/
references/                       →    my-project/references/
scripts/                          →    my-project/scripts/
```

### Folder State After Step 3

```
my-project/
│
│  ── Setup skill (deleted after setup) ─────────────────
├── SKILL.md                     ← Setup instructions for Claude Code
├── references/
│   ├── claude-md-template.md    ← Template for CLAUDE.md generation
│   ├── project-plan.md          ← Planning prompt
│   ├── plan-mode-prompt.md      ← Plan mode interview prompt
│   └── setup-prompt.md          ← Setup prompt
├── scripts/
│   ├── analyze-project.sh       ← Project analysis automation
│   ├── validate-env.sh          ← Environment variable hygiene check
│   └── validate-setup.sh        ← Setup result validation
│
│  ── .claude/ (template state) ─────────────────────────
├── .claude/
│   ├── commands/
│   │   ├── check.md             ← /check command
│   │   ├── commit-push-pr.md    ← /commit-push-pr command
│   │   └── review.md            ← /review command
│   ├── hooks/
│   │   ├── session-start.sh     ← Auto-run on session start
│   │   ├── edit-monitor.sh      ← Repeated edit detection (hint)
│   │   └── pre-commit-check.sh  ← ⚠️ Still has {{variables}}
│   ├── skills/                  ← ⚠️ Still TODO/{{variable}} templates
│   │   ├── conventions/SKILL.md
│   │   ├── dependencies/SKILL.md
│   │   ├── design-rules/SKILL.md
│   │   ├── easy-refactoring/SKILL.md
│   │   ├── error-handling/SKILL.md
│   │   ├── project-directory/SKILL.md
│   │   ├── security/SKILL.md
│   │   ├── skill-discovery/SKILL.md
│   │   └── testing/SKILL.md
│   ├── agents/
│   │   ├── test-runner.md       ← ⚠️ {{TEST_CMD}} etc. still templated
│   │   ├── code-reviewer.md
│   │   └── debugger.md
│   ├── lessons.md               ← Empty template (populated during dev)
│   └── settings.json
│
│  ── Planning output (from Steps 1-2) ──────────────────
└── project-plan.md
│
│  ── Not yet created ───────────────────────────────────
│  (CLAUDE.md — created in Step 4)
│  (.git — initialized in Step 4)
```

---

## Step 4: Run Project Setup — Claude Code

Open your project folder in Claude Code and enter the prompt from `references/setup-prompt.md`.

### What Happens in Step 4

| File | Change |
|------|--------|
| **CLAUDE.md** | ⭐ **Created** — Based on plan, ~55 lines |
| .claude/skills/error-handling | 📝 **TODOs filled** — Based on plan's error strategy |
| .claude/skills/security | 📝 **TODOs filled** — Based on plan's auth/security model |
| .claude/skills/testing | 📝 **TODOs filled** — Project test tools & mock targets |
| .claude/skills/project-directory | 📝 **TODOs filled** — Actual directory structure |
| .claude/skills/conventions | 📝 As-is (additions if project has extra conventions) |
| .claude/skills/easy-refactoring | 📝 As-is |
| .claude/skills/skill-discovery | 📝 As-is |
| .claude/skills/design-rules | 📝 **TODOs filled** — Frontend projects only |
| .claude/skills/dependencies | 📝 **TODOs filled** — Only when dependency gotchas exist |
| .claude/agents/test-runner | 📝 **Modified** — {{TEST_CMD}} substituted |
| .claude/hooks/pre-commit-check.sh | 📝 **Modified** — Project validation commands |
| .claude/commands/check.md | 📝 **Modified** — Package manager commands |
| .claude/settings.json | 📝 **Modified** — Permissions/hooks config |
| .git/ | ⭐ **Created** — git init + first commit |
| SKILL.md | 🗑️ **Deleted** |
| references/ | 🗑️ **Deleted** |
| scripts/ | 🗑️ **Deleted** |
| README.md | 🗑️ **Deleted** |

---

## Step 5: Start Development — Claude Code

Reset the conversation to prevent setup context from contaminating development:

```
/clear
```

Then:

```
Start project development
```

### Folder State After Step 5

```
my-project/
├── CLAUDE.md                    ← ⭐ ~55 lines. Auto-loaded every session.
├── .claude/
│   ├── commands/ (3)            ← /review, /check, /commit-push-pr
│   ├── hooks/ (3)               ← session-start, edit-monitor, pre-commit-check
│   ├── skills/ (7-9)            ← ⭐ Auto-discovered by Claude. Loaded when relevant.
│   │   ├── conventions/         ← Always: naming, import order, type rules
│   │   ├── error-handling/      ← Always: when writing error handling code
│   │   ├── security/            ← Always: when writing auth/security code
│   │   ├── testing/             ← Always: when writing tests
│   │   ├── project-directory/   ← Always: when deciding file/folder placement
│   │   ├── easy-refactoring/    ← Always: when performing refactoring
│   │   ├── skill-discovery/     ← Always: auto-search when external skills needed
│   │   ├── design-rules/        ← (Frontend) when doing UI/styling work
│   │   └── dependencies/        ← (Gotcha) when installing/configuring packages
│   ├── agents/ (3)              ← ⭐ Auto-delegated when needed. Independent context.
│   │   ├── test-runner.md
│   │   ├── code-reviewer.md
│   │   └── debugger.md
│   ├── lessons.md               ← Accumulated mistakes/solutions during dev
│   └── settings.json
├── project-plan.md              ← Kept for reference
└── .git/
```

**Useful commands:**
- `/check` — Typecheck + lint + test, one-line summary
- `/review` — Code review of changes
- `/commit-push-pr` — Commit → push → create PR

**Auto-activated:**
- **Skills (7-9)** — Related rules auto-load when writing error/security/test/design code
- **Agents (3)** — Complex testing/review/debugging delegated to dedicated agents in independent context
- **Lessons** — Session alerts when mistake records accumulate, preventing repeated errors
- **Skill Discovery** — Auto-search and suggest external skills when needed (user confirmation before install)

---

## License

MIT
