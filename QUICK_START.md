# 🚀 Quick Start Guide

## Three-Branch Strategy Overview

```
dev → staging → main
 ↓        ↓         ↓
test    preview   live
```

## 📋 First Time Setup

### 1. Push All Branches to GitHub

```bash
# Make sure you're on a branch (e.g., staging)
git checkout staging

# Add all files
git add .

# Commit
git commit -m "Initial commit: Setup CI/CD with three-branch strategy"

# Push all branches
git push origin staging
git checkout dev
git push origin dev
git checkout main
git push origin main
```

### 2. Configure GitHub Secrets

Go to: `https://github.com/bantirathodtech/banti_rathod_flutter/settings/secrets/actions`

Add:
- `FIREBASE_SERVICE_ACCOUNT` (JSON from Firebase Console)
- `FIREBASE_PROJECT_ID` (Your Firebase project ID)

### 3. Set Up Branch Protection

See: `.github/BRANCH_PROTECTION_SETUP.md`

## 🎯 Daily Workflow

### Working on Features

```bash
# 1. Start from dev
git checkout dev
git pull origin dev

# 2. Create feature branch
git checkout -b feature/my-feature

# 3. Make changes, commit
git add .
git commit -m "feat: add new feature"
git push origin feature/my-feature

# 4. Merge to dev (or create PR)
git checkout dev
git merge feature/my-feature
git push origin dev
```

### Testing/QA

```bash
# 1. Create PR: dev → staging
# 2. After approval, merge
git checkout staging
git merge dev
git push origin staging
# → Deploys to preview channel
```

### Production Release

```bash
# 1. Create PR: staging → main
# 2. After approval, merge
git checkout main
git merge staging
git push origin main
# → Deploys to live site
```

## 📊 Branch Behavior

| Action | dev | staging | main |
|--------|-----|---------|------|
| Push | ✅ Tests + Build | ✅ Tests + Build + Deploy (Preview) | ✅ Tests + Build + Deploy (Live) |
| Direct Push | ✅ Allowed | ⚠️ Protected (PR required) | ❌ Protected (PR required) |
| PR Required | ⚠️ Optional | ✅ Yes | ✅ Yes |

## 🔗 Quick Links

- **Branching Strategy**: [BRANCHING_STRATEGY.md](./BRANCHING_STRATEGY.md)
- **Firebase Setup**: [SETUP_FIREBASE.md](./SETUP_FIREBASE.md)
- **Deployment Guide**: [DEPLOYMENT.md](./DEPLOYMENT.md)
- **Branch Protection**: [.github/BRANCH_PROTECTION_SETUP.md](./.github/BRANCH_PROTECTION_SETUP.md)

## ⚡ Common Commands

```bash
# Switch branches
git checkout dev
git checkout staging
git checkout main

# Create feature branch
git checkout -b feature/name

# Update branch
git pull origin dev

# Push changes
git push origin branch-name

# Check status
git status
git branch -a
```

---

**Remember**: Always start from `dev` for new features! 🎯

