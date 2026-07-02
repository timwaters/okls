# knowledge-os

A portable, self-contained learning system built on top of an agentic coding framework (opencode). Each topic is an independent agent with its own persistent memory, gap map, and tailored learning plan.

---

## Structure

```
knowledge-os/
├── _template/               source of truth; never edit directly
│   └── .opencode/skills/    skill definitions (interviewer / mapper / teacher)
│   └── .opencode/agent/     sub agent for secretary tasks (write and update to files)
├── topics/
│   ├── index.md             auto-updated list of all topics
│   └── <topic>/             one directory per topic
│       ├── AGENTS.md            orchestrator + state machine
│       ├── .opencode/skills/    skill definitions (loaded via `skill` tool)
│       ├── .opencode/agent/     sub agent for secretary tasks (write and update to files)
│       ├── TOOLS.md             tool usage guidance
│       ├── gaps.md              live knowledge map (written by agent)
│       ├── learning-plan.md     tailored curriculum (written by agent)
│       ├── context.md           working memory across sessions (written by agent)
│       └── sessions/            per-session transcripts (written by agent)
└── new-topic.sh             bootstrap script
```

---

## Start a new topic

```bash
./new-topic.sh "fermentation science"
cd topics/fermentation-science
opencode
```

That's it. The agent reads `AGENTS.md` on startup and begins the interview.

---

## Resume an existing topic

```bash
cd topics/quantum-computing
opencode
```

The agent reads `context.md` first and picks up exactly where you left off.

---

## How it works

The agent runs a three-phase loop:

**Phase 1 — Interview**
Asks one Socratic question at a time. Silently scores your answers and writes structured entries to `gaps.md`. Runs until 5+ concept areas are mapped.

**Phase 2 — Map & Plan**
Analyses `gaps.md`, identifies your critical path, writes `learning-plan.md`.

**Phase 3 — Teach & Augment**
Reads the plan and your gaps each session. Teaches one concept at a time using the intuition -> mechanism -> check structure. Updates memory after every turn.


---

Every gap update, plan revision, and context change is tracked. You can watch your understanding of each topic evolve over time.
