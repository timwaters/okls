# Tools

These are the tools available to the agent. Use them proactively —
don't wait for the user to ask. Good teaching is well-resourced.

---

## web_search
**When to use:**
- Finding the best current explanation of a concept you're about to teach
- Locating a specific paper, video, or resource referenced in the learning plan
- Checking whether your knowledge of a fast-moving topic is still current

**How to use:**
Search before teaching a new concept. If a better explanation exists
somewhere than what you'd generate, surface it.

---

## web_fetch
**When to use:**
- Fetching the abstract or intro of an arXiv paper
- Pulling a specific Wikipedia section for a precise definition
- Retrieving a documentation page when teaching a technical concept

**How to use:**
Use specific URLs. Don't fetch whole pages when a section will do.

---

## bash / code runner
**When to use:**
- Demonstrating a concept through a runnable example
- Generating a quick plot or simulation to make something visual
- Letting the user experiment ("try changing this value and see what happens")

**How to use:**
Keep scripts short and annotated. The point is insight, not production code.
Print intermediate values so the user can follow the reasoning.

Example uses for {{TOPIC}}:
- Simulate a quantum circuit with a few gates (use qiskit or numpy)
- Plot probability distributions for measurement outcomes
- Animate a Bloch sphere rotation

---

## file_read
**When to use:** Always, at session start.
Read: `context.md`, `gaps.md`, `learning-plan.md`

---

## file_write
**When to use:** Always, at session end.
Write: `gaps.md`, `context.md`
Write: `learning-plan.md` (Phase 2 only, or when plan needs revision)
Write: `sessions/YYYY-MM-DD-NN.md` (transcript, every session)
