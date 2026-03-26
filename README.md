# Fiberplane Homebrew Tap

Homebrew formulae for Fiberplane CLI tools.

## Install Drift

```bash
brew tap fiberplane/tap
brew install fiberplane/tap/drift
```

You can also install directly with the fully-qualified formula name:

```bash
brew install fiberplane/tap/drift
```

## Maintenance

`Formula/drift.rb` is generated from `fiberplane/drift` GitHub release metadata by `script/update_drift_formula.rb`.

The tap keeps itself up to date via `.github/workflows/update_drift_formula.yml`, which can run:

- on a schedule
- manually with `workflow_dispatch`
- via `repository_dispatch` from the drift release workflow
