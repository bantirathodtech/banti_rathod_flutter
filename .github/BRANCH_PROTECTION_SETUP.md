# Branch Protection Setup Guide

This guide explains how to set up branch protection rules for the three-branch strategy.

## 🔒 Setting Up Branch Protection

### Step 1: Navigate to Branch Settings

1. Go to your repository: `https://github.com/bantirathodtech/banti_rathod_flutter`
2. Click **Settings** → **Branches**
3. Click **Add rule** or **Add branch protection rule**

### Step 2: Configure `main` Branch (Production)

**Branch name pattern**: `main`

**Protection Rules:**
- ✅ **Require a pull request before merging**
  - ✅ Require approvals: `1` (or more if you have reviewers)
  - ✅ Dismiss stale pull request approvals when new commits are pushed
  - ✅ Require review from Code Owners (if you have CODEOWNERS file)
  
- ✅ **Require status checks to pass before merging**
  - ✅ Require branches to be up to date before merging
  - ✅ Status checks to require:
    - `test / Run Tests`
    - `build / Build Web App`
    - `deploy / Deploy to Firebase`
  
- ✅ **Require conversation resolution before merging**
  
- ✅ **Do not allow bypassing the above settings**
  - ✅ Include administrators

**Additional Options:**
- ⚠️ Allow force pushes: **Unchecked** (recommended)
- ⚠️ Allow deletions: **Unchecked** (recommended)

### Step 3: Configure `staging` Branch (Testing/QA)

**Branch name pattern**: `staging`

**Protection Rules:**
- ✅ **Require a pull request before merging**
  - ✅ Require approvals: `1`
  - ✅ Dismiss stale pull request approvals when new commits are pushed
  
- ✅ **Require status checks to pass before merging**
  - ✅ Require branches to be up to date before merging
  - ✅ Status checks to require:
    - `test / Run Tests`
    - `build / Build Web App`
    - `deploy / Deploy to Firebase`
  
- ✅ **Require conversation resolution before merging**
  
- ⚠️ **Do not allow bypassing the above settings**
  - ⚠️ Include administrators (optional - you can allow admins to bypass for emergencies)

**Additional Options:**
- ⚠️ Allow force pushes: **Unchecked** (recommended)
- ⚠️ Allow deletions: **Unchecked** (recommended)

### Step 4: Configure `dev` Branch (Development)

**Branch name pattern**: `dev`

**Protection Rules:**
- ⚠️ **Require a pull request before merging** (optional - for solo projects)
- ✅ **Require status checks to pass before merging** (recommended)
  - ✅ Require branches to be up to date before merging
  - ✅ Status checks to require:
    - `test / Run Tests`
    - `build / Build Web App`

**Additional Options:**
- ✅ Allow force pushes: **Checked** (for fast iteration)
- ✅ Allow deletions: **Checked** (for cleanup)

## 📋 Summary Table

| Branch | PR Required | Status Checks | Force Push | Admins Can Bypass |
|--------|------------|---------------|------------|-------------------|
| `main` | ✅ Yes | ✅ Required | ❌ No | ❌ No |
| `staging` | ✅ Yes | ✅ Required | ❌ No | ⚠️ Optional |
| `dev` | ⚠️ Optional | ✅ Recommended | ✅ Yes | ✅ Yes |

## 🎯 Quick Setup Commands

After setting up branch protection, you can verify with:

```bash
# Check current branch
git branch

# Push branches to GitHub (if not already pushed)
git push origin main
git push origin staging
git push origin dev
```

## ⚠️ Important Notes

1. **Status checks must run first**: Before you can require status checks, you need to:
   - Push code to trigger workflows
   - Let workflows run at least once
   - Then add the status checks to branch protection

2. **Admin bypass**: For `main` branch, it's recommended to NOT allow admin bypass to ensure all code goes through proper review.

3. **Testing**: After setting up protection, test by:
   - Creating a PR from `dev` → `staging`
   - Creating a PR from `staging` → `main`
   - Verifying that direct pushes are blocked (if configured)

## 🔍 Verification

### Check if Protection is Working

1. Try to push directly to `main`:
   ```bash
   git checkout main
   git commit --allow-empty -m "test protection"
   git push origin main
   ```
   - Should be blocked if protection is working

2. Check PR requirements:
   - Create a PR to `main`
   - Verify that merge button is disabled until checks pass
   - Verify that approval is required

## 📚 Related Documentation

- [BRANCHING_STRATEGY.md](../BRANCHING_STRATEGY.md) - Complete branching workflow
- [DEPLOYMENT.md](../DEPLOYMENT.md) - Deployment guide
- [GitHub Branch Protection Docs](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-protected-branches/about-protected-branches)

---

**Last Updated**: 2025-01-XX

