# Branching Strategy

This document outlines the branching strategy and workflow for the Flutter portfolio project.

## 🌳 Branch Structure

### `main` → 🟢 Production
**Purpose**: Production-ready releases only
- **Status**: Protected branch
- **Deployment**: Live to Firebase Hosting (production site)
- **Merges**: Only via Pull Requests from `staging` branch
- **CI/CD**: Full test → Build → Deploy to live channel
- **Who can merge**: Requires approval (after review)

### `staging` → 🧪 Testing / QA
**Purpose**: Testing builds and CI/CD verification
- **Status**: Protected branch
- **Deployment**: Preview channel on Firebase Hosting
- **Merges**: Only via Pull Requests from `dev` branch
- **CI/CD**: Full test → Build → Deploy to preview channel
- **Who can merge**: Requires approval (after review)

### `dev` → 💻 Active Development
**Purpose**: Daily feature updates and development
- **Status**: Active development branch
- **Deployment**: No deployment (tests only)
- **Merges**: Direct pushes allowed for rapid development
- **CI/CD**: Full test → Build (no deployment)
- **Who can push**: All developers

## 🔄 Workflow

### Development Flow

```
dev → staging → main
 ↓        ↓         ↓
test    preview   live
```

### 1. Daily Development (dev branch)

```bash
# Create feature branch from dev
git checkout dev
git pull origin dev
git checkout -b feature/new-feature

# Make changes and commit
git add .
git commit -m "feat: add new feature"

# Push to dev
git push origin feature/new-feature

# Create PR to dev (or merge directly if working solo)
# After PR approved, merge to dev
```

**What happens:**
- ✅ Tests run automatically
- ✅ Code analysis
- ✅ Build verification
- ❌ No deployment

### 2. Testing/QA (staging branch)

```bash
# Create PR from dev to staging
# After all tests pass and PR approved

# Merge dev → staging
git checkout staging
git pull origin staging
git merge dev
git push origin staging
```

**What happens:**
- ✅ Tests run automatically
- ✅ Code analysis
- ✅ Build verification
- ✅ Deploys to Firebase Preview Channel
- 🔗 Preview URL available in PR comments

### 3. Production Release (main branch)

```bash
# Create PR from staging to main
# After QA approval and all checks pass

# Merge staging → main
git checkout main
git pull origin main
git merge staging
git push origin main
```

**What happens:**
- ✅ Tests run automatically
- ✅ Code analysis
- ✅ Build verification
- ✅ Deploys to Firebase Live Channel (production site)
- 🌐 Live at: https://banti-rathod-tech.web.app

## 📋 Branch Protection Rules

### Setup in GitHub

1. Go to: `Settings` → `Branches` → `Add rule`

#### For `main` branch:
- ✅ Require pull request reviews before merging
- ✅ Require status checks to pass before merging
- ✅ Require branches to be up to date before merging
- ✅ Include administrators
- ✅ Do not allow bypassing the above settings

#### For `staging` branch:
- ✅ Require pull request reviews before merging
- ✅ Require status checks to pass before merging
- ✅ Require branches to be up to date before merging
- ✅ Include administrators

#### For `dev` branch:
- ⚠️ Optional: Require status checks (recommended)
- ✅ Allow force pushes (for fast iteration)
- ✅ Allow deletions (for cleanup)

## 🚀 Quick Reference

### Working on a Feature

```bash
# 1. Start from dev
git checkout dev
git pull origin dev
git checkout -b feature/my-feature

# 2. Make changes, commit, push
git add .
git commit -m "feat: description"
git push origin feature/my-feature

# 3. Create PR to dev (or merge directly)
# 4. After merged to dev, create PR: dev → staging
# 5. After QA, create PR: staging → main
```

### Hotfix (Emergency Fix)

```bash
# 1. Create hotfix branch from main
git checkout main
git pull origin main
git checkout -b hotfix/critical-bug

# 2. Fix and test
git add .
git commit -m "fix: critical bug description"

# 3. Create PR to main (bypasses normal flow for emergencies)
# 4. After merged to main, merge back to staging and dev
git checkout staging
git merge main
git push origin staging

git checkout dev
git merge main
git push origin dev
```

## 📊 CI/CD Behavior by Branch

| Branch | Tests | Build | Deploy | Channel |
|--------|-------|-------|--------|---------|
| `dev` | ✅ | ✅ | ❌ | - |
| `staging` | ✅ | ✅ | ✅ | Preview |
| `main` | ✅ | ✅ | ✅ | Live |

## 🔍 Monitoring

### Check Deployment Status

- **GitHub Actions**: View workflow runs by branch
  - `https://github.com/bantirathodtech/banti_rathod_flutter/actions`
  
- **Firebase Console**: View deployments
  - Live: `https://console.firebase.google.com/project/YOUR_PROJECT/hosting`
  - Preview channels: Available in Firebase Console

### Preview URLs

When deploying to `staging` branch:
- Preview URL: `https://YOUR_PROJECT--preview-XXXXX.web.app`
- Available in GitHub Actions logs and PR comments

## 🎯 Best Practices

1. **Always start from the correct branch**
   - Features: Start from `dev`
   - Hotfixes: Start from `main`

2. **Keep branches up to date**
   ```bash
   git checkout dev
   git pull origin dev
   ```

3. **Test before merging**
   - Run tests locally: `flutter test`
   - Check formatting: `dart format .`
   - Verify build: `flutter build web --release`

4. **Write clear commit messages**
   - `feat: add new feature`
   - `fix: resolve bug`
   - `docs: update documentation`
   - `refactor: improve code structure`

5. **Use PRs for code review**
   - Even solo projects benefit from PR reviews
   - Helps catch issues before production

6. **Never merge broken code**
   - Wait for all CI checks to pass
   - Fix failing tests before merging

## 📝 Branch Naming Conventions

### Feature Branches
```
feature/add-new-section
feature/update-theme
```

### Bug Fixes
```
fix/resolve-navigation-issue
fix/accessibility-bug
```

### Hotfixes
```
hotfix/critical-security-patch
hotfix/urgent-bug-fix
```

### Documentation
```
docs/update-readme
docs/add-deployment-guide
```

## 🆘 Troubleshooting

### Branch is behind
```bash
git checkout your-branch
git pull origin main  # or staging/dev
git push origin your-branch
```

### Merge conflicts
```bash
git checkout your-branch
git merge main
# Resolve conflicts
git add .
git commit -m "merge: resolve conflicts"
git push origin your-branch
```

### Accidentally pushed to wrong branch
```bash
# Create new branch from current state
git checkout -b correct-branch

# Reset wrong branch
git checkout wrong-branch
git reset --hard origin/correct-branch
git push origin wrong-branch --force
```

---

**Last Updated**: 2025-01-XX
**Maintainer**: Banti Rathod

