# Git Workflow

This document describes the Git branching strategy used in the drone-lab project.

---

# Branches

## main

Purpose

- Stable releases
- Demonstrable milestones
- Paper-ready versions

Rules

- Never develop directly on `main`.
- Only merge tested code from `develop`.

---

## develop

Purpose

- Integration branch
- Collects completed features before merging to `main`

Rules

- Merge completed feature branches here.
- Test the integrated system before updating `main`.

---

## feature/*

Purpose

- Active development
- Research experiments
- New functionality

Examples

```
feature/aruco-detection
feature/pose-estimation
feature/landing-controller
feature/moving-ship
feature/fractal-marker
feature/documentation
```

---

# Development Workflow

Create a new feature

```bash
git checkout develop
git pull
git checkout -b feature/<feature-name>
```

Example

```bash
git checkout develop
git pull
git checkout -b feature/aruco-detection
```

---

# During Development

Commit frequently.

Example

```bash
git add .
git commit -m "Implement ArUco detection node"
```

---

# Merge into develop

```bash
git checkout develop
git merge feature/aruco-detection
git push origin develop
```

---

# Merge into main

After testing:

```bash
git checkout main
git merge develop
git push origin main
```

---

# Branch Strategy

```
main
│
└── develop
      │
      ├── feature/aruco-detection
      ├── feature/pose-estimation
      ├── feature/landing-controller
      ├── feature/moving-ship
      └── feature/fractal-marker
```

---

# Current Status

```
main
    Stable infrastructure

develop
    Ready for research development

Next feature

feature/aruco-detection
```

---

# Rules

- Do not commit experimental work directly to `main`.
- Use feature branches for all new development.
- Merge only tested features into `develop`.
- Merge only stable milestones into `main`.