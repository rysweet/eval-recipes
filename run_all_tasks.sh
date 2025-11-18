#!/bin/bash
AGENT=$1
TASKS=(
  arxiv_conclusion_extraction
  arxiv_paper_summarizer
  cpsc_recall_monitor
  cross_repo_improvement_tool
  email_drafting
  gdpval_extraction
  github_docs_extractor
  image_tagging
  linkedin_drafting
  markdown_deck_converter
  news_research_tool
  product_review_finder
  repo_embedding_server
  sec_10q_extractor
  style_blender
)

for task in "${TASKS[@]}"; do
  echo "Running $AGENT on $task..."
  uv run scripts/run_benchmarks.py --agent-filter name=$AGENT --task-filter name=$task --max-parallel-tasks 1 --num-trials 1 2>&1 | tee "/tmp/benchmark-${AGENT}-${task}.log"
  echo "Completed $task"
  echo "---"
done
