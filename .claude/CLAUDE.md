# Development Guidelines

## Philosophy

### Core Beliefs

- **Incremental progress over big bangs** - Small changes that compile/running without lint error
- **Learning from existing code** - Study and plan before implementing
- **Pragmatic over dogmatic** - Adapt to project reality
- **Clear intent over clever code** - Be boring and obvious

### Simplicity Means

- Single responsibility per function/class
- Avoid premature abstractions
- No clever tricks - choose the boring solution
- If you need to explain it, it's too complex

### Technical Design Principles

- **Pragmatism over perfection** - Solve actual problems, not theoretical ones
- **Simplicity obsession** - Choose the boring, obvious solution
- **Incremental progress** - Each task should compile and be testable
- **Consistency** - Follow existing project patterns religiously
- **Clarity** - Every decision should be easily understood by other developers

### Critical Guidelines

- Never over-engineer solutions
- Always consider the existing codebase patterns before proposing new approaches
- Ensure each implementation task is independently testable
- Focus on delivering working software incrementally
- Maintain the project's established conventions and style

### Data Structure & State Management

- **Data Structure First**: Design minimal state structure as single source of truth
- **Derived State Over Duplicated State**: Prefer computed values over storing redundant data
- **Single Source of Truth**: Identify where each piece of data lives, avoid duplication
- **React State Minimal**: Keep React state minimal - only store what cannot be derived
- **State Colocation**: Place state as close as possible to where it's used

## Technical Standards

### Architecture Principles

- **Composition over inheritance** - Use dependency injection
- **Explicit over implicit** - Clear data flow and dependencies

### Code Quality

- **Every commit must**:
  - Compile successfully
  - Follow project formatting/linting

- **Before committing**:
  - Run formatters/linters
  - Self-review changes
  - Ensure commit message explains "why"

### Error Handling

- Fail fast with descriptive messages
- Include context for debugging
- Handle errors at appropriate level
- Never silently swallow exceptions

## Decision Framework

When multiple valid approaches exist, choose based on:

2. **Readability** - Will someone understand this in 6 months?
3. **Consistency** - Does this match project patterns?
4. **Simplicity** - Is this the simplest solution that works?
5. **Reversibility** - How hard to change later?

## Project Integration

### Learning the Codebase

- Find 3 similar features/components
- Identify common patterns and conventions
- Use same libraries/utilities when possible

### Tooling

- Use project's existing build system
- Use project's formatter/linter settings
- Don't introduce new tools without strong justification

## Quality Gates

### Definition of Done

- [ ] Code follows project conventions
- [ ] No linter/formatter warnings
- [ ] Commit messages are clear
- [ ] Implementation matches plan

## Important Reminders

**NEVER**:
- Use `--no-verify` to bypass commit hooks
- Commit code that doesn't compile
- Make assumptions - verify with existing code

**ALWAYS**:
- Commit working code incrementally
- Update plan documentation as you go
- Learn from existing implementations
