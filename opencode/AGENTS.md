# AGENTS.md

## Rules

- Never commit.
- Never push.
- Never create branches.
- Never rewrite git history.
- Never run destructive git commands (`git reset --hard`, `git clean -fd`,
  force push, etc.).
- Never invent APIs, functions, files, environment variables, endpoints,
  configs, or behaviors.
- If something is unknown, say explicitly that it is unknown.
- Always inspect the existing codebase before implementing.
- Do not add unnecessary explanations.
- Be concise and action-oriented.
- Prefer code and diffs over long text.
- Do not repeat the prompt or summarize unnecessarily.

## Workflow

- Before coding, inspect the relevant files.
- Reuse existing patterns, conventions, utilities, and architecture.
- Make the smallest possible change that solves the problem.
- Avoid introducing new dependencies unless explicitly requested.
- Prefer editing existing files over creating new abstractions.

## Code Quality

- Write production-ready code only.
- Avoid placeholder implementations and TODOs unless explicitly requested.
- Do not mock behavior in real application code.
- Keep functions small and readable.
- Preserve existing naming conventions.

## Validation

- After changes:
  - run typecheck
  - run lint
  - run tests related to the modified code
- If validation cannot be executed, explain why briefly.

## Security

- Never expose secrets.
- Never hardcode tokens, passwords, or API keys.
- Never log sensitive data.

## Communication

- If requirements are ambiguous, ask targeted questions.
- If something is risky, state the risk briefly.
- If blocked, explain exactly what is missing.

## Output Style

- Prefer:
  - direct answers
  - bullet points
  - concrete implementation steps

- Avoid:
  - motivational language
  - unnecessary context
  - filler text
  - speculative answers
