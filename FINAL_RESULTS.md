# amplihack vs Claude Code vs Codex vs Copilot CLI
## Complete eval-recipes Benchmark Results

**Date**: 2025-11-18
**Fork**: https://github.com/rysweet/eval-recipes
**Trials**: 1 per agent per task
**Tasks**: All 15 tasks in eval-recipes suite

---

## Executive Summary

**WINNER**: TBD (benchmarks running)
**Status**: 4 agents × 15 tasks = 60 total benchmarks executing
**Estimated Completion**: 2-3 hours

**Current Progress** (as of latest check):
- amplihack: 4/15 tasks complete
- claude_code: Running
- openai_codex: Running
- gh_cli (Copilot): Running

---

## Proven Results (email_drafting task)

| Agent | Score | Functional | Time | Result |
|-------|-------|------------|------|--------|
| **amplihack** | **26.0** | 52/100 | 8m37s | ✅ BEST |
| claude_code | 22.5 | 45/100 | 12m33s | ✅ |
| openai_codex | 0.0 | 0/100 | 29s | ❌ FAILED |
| gh_cli | 0.0 | 0/100 | 1s | ❌ FAILED |

**amplihack beat Claude Code by 15.6% and was 31% faster!**

---

## amplihack Results (Partial - 4/15)

Scores so far:
- Task 1: 26.0/100
- Task 2: **100.0/100** (PERFECT!)
- Task 3: 71.2/100
- Task 4: 2.5/100

**Current Average**: 49.9/100

---

## Configuration Details

### Successful amplihack Config

**Key Discovery**: eval-recipes' `.claude/settings.json` enables permissions bypass!

**Working Setup**:
1. Copy eval-recipes settings.json to /project/.claude/
2. Copy amplihack .claude/ context (agents, workflows, preferences)
3. Use: `IS_SANDBOX=1 claude --verbose --output-format stream-json -p "{{task}}" --disallowedTools "AskUserQuestion" --dangerously-skip-permissions`

### API Keys Used

- ANTHROPIC_API_KEY: From ~/.claude-msec-k
- OPENAI_API_KEY: From ~/.openai
- GITHUB_TOKEN: From ~/.github-pat-mcpread

---

## Benchmark Execution Status

**Running Processes**:
- PID 3592: amplihack (15 tasks sequential)
- PID 12159: claude_code (15 tasks sequential)
- PID 34195: openai_codex (15 tasks sequential)
- PID 34359: gh_cli/Copilot (15 tasks sequential)
- PID 37590: Monitor script (10-minute updates)

**Estimated Time**:
- Per task: 5-15 minutes (depends on complexity)
- Per agent: 1.5-3 hours for all 15 tasks
- Total: 2-3 hours (agents run in parallel)

---

## Results Will Be Updated Automatically

This file will be updated with complete results when all benchmarks finish.

Monitor progress: `tail -f /tmp/monitor-progress.log`

---

Generated: 2025-11-18
Status: IN PROGRESS
