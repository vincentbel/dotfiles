# Development Guidelines

## 1. Think Before Coding

**Don't assume. Don't hide confusion. Surface tradeoffs.**

Before implementing:
- State assumptions explicitly. If uncertain, ask.
- If multiple interpretations exist, present them - don't pick silently.
- If a simpler approach exists, say so. Push back when warranted.
- If something is unclear, stop. Name what's confusing. Ask.
- Study existing code and patterns before proposing new approaches.

## 2. Simplicity First

**Minimum code that solves the problem. Nothing speculative.**

Core principles:
- No features beyond what was asked.
- No abstractions for single-use code.
- No "flexibility" or "configurability" that wasn't requested.
- No error handling for impossible scenarios.
- If you write 200 lines and it could be 50, rewrite it.

What simplicity means in practice:
- Single responsibility per function/class.
- Choose the boring, obvious solution over clever tricks.
- If you need to explain it, it's too complex.
- Solve actual problems, not theoretical ones.

Ask yourself: "Would a senior engineer say this is overcomplicated?" If yes, simplify.

## 3. Surgical Changes

**Touch only what you must. Clean up only your own mess.**

When editing existing code:
- Don't "improve" adjacent code, comments, or formatting.
- Don't refactor things that aren't broken.
- Match existing style, even if you'd do it differently.
- If you notice unrelated issues, mention them - don't fix them silently.

When your changes create orphans:
- Remove imports/variables/functions that YOUR changes made unused.
- Don't remove pre-existing dead code unless asked.

The test: Every changed line should trace directly to the user's request.

## 4. Goal-Driven Execution

**Define success criteria. Loop until verified.**

Transform tasks into verifiable goals:
- "Add validation" → "Write tests for invalid inputs, then make them pass"
- "Fix the bug" → "Write a test that reproduces it, then make it pass"
- "Refactor X" → "Ensure tests pass before and after"

For multi-step tasks, state a brief plan:
```
1. [Step] → verify: [check]
2. [Step] → verify: [check]
3. [Step] → verify: [check]
```

Each step should compile and be independently testable.

## 5. Technical Standards

### Architecture

- **Composition over inheritance** - Use dependency injection.
- **Explicit over implicit** - Clear data flow and dependencies.

### State Management

- Design minimal state as single source of truth.
- Prefer derived/computed values over duplicated state.
- Place state as close as possible to where it's used.

### Error Handling

- Fail fast with descriptive messages.
- Include context for debugging.
- Handle errors at appropriate level.
- Never silently swallow exceptions.

### Code Quality

Every commit must:
- Compile successfully.
- Follow project formatting/linting.

Before committing:
- Run formatters/linters.
- Self-review changes.
- Ensure commit message explains "why".

## 6. Project Integration

- Use project's existing build system and tools.
- Follow project's formatter/linter settings.
- Don't introduce new tools without strong justification.
- Follow existing project patterns religiously.
