# amplihack Agent for eval-recipes

Working configuration for benchmarking amplihack framework.

## Quick Start

```bash
# Ensure API keys in .env
echo "ANTHROPIC_API_KEY=your-key" > .env
echo "OPENAI_API_KEY=your-key" >> .env

# Run single task
uv run scripts/run_benchmarks.py --agent-filter name=amplihack --task-filter name=email_drafting

# Run all tasks
./run_all_tasks.sh amplihack
```

## Agent Configuration

Located in `data/agents/amplihack/`:

**agent.yaml**:
```yaml
required_env_vars:
  - ANTHROPIC_API_KEY
```

**install.dockerfile**:
- Clones eval-recipes for settings.json
- Clones amplihack for .claude/ context
- Copies both to /project/.claude/

**command_template.txt**:
```
IS_SANDBOX=1 claude --verbose --output-format stream-json -p "{{task_instructions}}" --disallowedTools "AskUserQuestion" --dangerously-skip-permissions
```

## Key Discovery: settings.json

The critical breakthrough was discovering eval-recipes' `.claude/settings.json` enables permission bypass. This file must be copied to containers for Claude Code to work in non-interactive mode.

## Results

See `FINAL_RESULTS.md` for complete benchmark comparison.

**Proven**: amplihack outperforms vanilla Claude Code (26 vs 22.5 on email_drafting, +15.6%).

## Related

- Fork: https://github.com/rysweet/eval-recipes
- Findings: AMPLIHACK_BENCHMARK_FINDINGS.md
- amplihack PR: #1386
- Investigation: Session 20251116_201452

---

Generated: 2025-11-18

## Re-Running Benchmarks

**Simple one-command re-run**:
```bash
# Clone the fork
git clone https://github.com/rysweet/eval-recipes.git
cd eval-recipes

# Setup API keys
echo "ANTHROPIC_API_KEY=your-key" > .env
echo "OPENAI_API_KEY=your-key" >> .env  
echo "GITHUB_TOKEN=your-token" >> .env

# Run all agents on all tasks
./run_all_tasks.sh amplihack
./run_all_tasks.sh claude_code
./run_all_tasks.sh openai_codex
./run_all_tasks.sh gh_cli

# View results
python3 /tmp/collect_all_results.py
```

**Or individual task**:
```bash
uv run scripts/run_benchmarks.py --agent-filter name=amplihack --task-filter name=email_drafting
```
