# Knowledge Learning System

A portable, self-contained learning system built on top of an agentic coding framework (I'm using opencode). Each topic is an independent agent with its own persistent memory, gap map, and tailored learning plan.

## Why I did this

Mainly to get familiar with opencode, agents and subagents. It's probably all in the wrong places but it seems to work.
Also to explore how a LLM might be used for tailored learning about a topic. 

The `secretary` subagent is actually necessary if you were to do this using another agentic framework but I included it so opencode doesn't show all the details of what it wants to write, for example all the blurb in gaps and context. 

## Things to determine

It might use too much context as it goes on - for example the directive to read `learning-plan.md` and `gaps.md` before every response. This might be a kind of "token spending fear" on my part.

## TODO

* Create a main agent so you can use /learn to start the process. At the moment the main default /build agent will read AGENTS and get started correctly.
* Make it more explicit to the user how to end the session. 
* I think just quitting via /exit wouldnt do the session close tasks

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

The agent reads `AGENTS.md` on startup and begins the interview.

---

## Resume an existing topic

```bash
cd topics/quantum-computing
opencode
```

The agent reads `context.md` first and picks up where you left off.

---

## How it works

The agent follows a three-phase loop:

**Phase 1 — Interview**
The agent asks one Socratic question at a time. It silently scores your answers, records structured entries in `gaps.md`, and continues until it maps at least five concept areas.

**Phase 2 — Map & Plan**
The agent reviews `gaps.md`, identifies your learning path, and writes `learning-plan.md`.

**Phase 3 — Teach & Augment**
During each session, the agent reads your learning plan and recorded knowledge gaps. It teaches one concept at a time using an intuition → mechanism → check sequence, then updates its memory after every turn.

---

The agent tracks every gap update, plan revision, and context change. You can watch your understanding of each topic develop over time.
