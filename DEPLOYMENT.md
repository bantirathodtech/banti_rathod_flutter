# Deployment Guide - CI/CD with Firebase Hosting

This guide explains how to set up and use the CI/CD pipeline for deploying the Flutter portfolio to Firebase Hosting.

## Prerequisites

1. **Firebase Account**: Sign up at [Firebase Console](https://console.firebase.google.com/)
2. **Firebase Project**: Create a new project or use existing one
3. **Firebase CLI**: Install locally (optional, for testing):
   ```bash
   npm install -g firebase-tools
   firebase login
   ```

## Setup Instructions

### Step 1: Create Firebase Project

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Click "Add project" or select existing project
3. Enable Firebase Hosting in the project
4. Note your **Project ID** (you'll need it later)

### Step 2: Get Firebase Service Account

1. Go to Firebase Console → Project Settings → Service Accounts
2. Click "Generate new private key"
3. Download the JSON file (keep it secure!)
4. Copy the entire JSON content

### Step 3: Configure GitHub Secrets

1. Go to your GitHub repository: `https://github.com/bantirathodtech/banti_rathod_flutter`
2. Navigate to **Settings** → **Secrets and variables** → **Actions**
3. Click **New repository secret**
4. Add these secrets:

   **Secret 1: `FIREBASE_SERVICE_ACCOUNT`**
   - Name: `FIREBASE_SERVICE_ACCOUNT`
   - Value: Paste the entire JSON content from Step 2

   **Secret 2: `FIREBASE_PROJECT_ID`**
   - Name: `FIREBASE_PROJECT_ID`
   - Value: Your Firebase project ID (e.g., `banti-rathod-tech`)

### Step 4: Initialize Firebase (First Time Only)

If you haven't initialized Firebase locally:

```bash
# In your project root
firebase login
firebase init hosting

# Select:
# - Use an existing project
# - Public directory: build/web
# - Configure as single-page app: Yes
# - Set up automatic builds: No (we use GitHub Actions)
```

## How It Works

### Branch-Based Deployment

The CI/CD pipeline behaves differently based on the branch:

#### 🟢 `main` Branch (Production)
When you push to `main`:
1. **Test Stage**: Runs all tests
2. **Build Stage**: Builds Flutter web app
3. **Deploy Stage**: Deploys to Firebase Hosting **Live Channel** (production site)

#### 🧪 `staging` Branch (Testing/QA)
When you push to `staging`:
1. **Test Stage**: Runs all tests
2. **Build Stage**: Builds Flutter web app
3. **Deploy Stage**: Deploys to Firebase Hosting **Preview Channel** (for QA)

#### 💻 `dev` Branch (Development)
When you push to `dev`:
1. **Test Stage**: Runs all tests
2. **Build Stage**: Builds Flutter web app (verification only)
3. **Deploy Stage**: ❌ No deployment

See [BRANCHING_STRATEGY.md](./BRANCHING_STRATEGY.md) for detailed workflow.

### Pull Request Checks

When you create a PR:

1. Runs code quality checks
2. Runs tests
3. Verifies formatting
4. Analyzes code

## Manual Deployment (Optional)

If you want to deploy manually:

```bash
# Build the app
flutter build web --release --base-href /

# Deploy to Firebase
firebase deploy --only hosting
```

## Workflow Files

### `.github/workflows/ci_cd.yml`
Main CI/CD pipeline that:
- Runs tests on every push/PR
- Builds web app on main branch
- Deploys to Firebase Hosting automatically

### `.github/workflows/pr-checks.yml`
PR-specific checks for code quality

## Firebase Configuration

### `firebase.json`
```json
{
  "hosting": {
    "public": "build/web",
    "ignore": [
      "firebase.json",
      "**/.*",
      "**/node_modules/**"
    ],
    "rewrites": [
      {
        "source": "**",
        "destination": "/index.html"
      }
    ]
  }
}
```

## Troubleshooting

### Deployment Fails

1. **Check GitHub Secrets**: Ensure `FIREBASE_SERVICE_ACCOUNT` and `FIREBASE_PROJECT_ID` are set correctly
2. **Check Firebase Project**: Verify project ID matches
3. **Check Build Logs**: View GitHub Actions logs for detailed errors

### Tests Fail

1. Run tests locally: `flutter test`
2. Check for formatting issues: `dart format .`
3. Check analyzer: `flutter analyze`

### Build Fails

1. Test build locally: `flutter build web --release`
2. Check for missing assets
3. Verify all dependencies are in `pubspec.yaml`

## Monitoring

- **GitHub Actions**: View deployment status in the "Actions" tab
- **Firebase Console**: Monitor hosting in Firebase Console → Hosting
- **Website**: Check your live site at `https://banti-rathod-tech.web.app/`

## Best Practices

1. **Always test locally** before pushing
2. **Use feature branches** for new features
3. **Review PRs** before merging to main
4. **Monitor deployments** in GitHub Actions
5. **Check Firebase Console** for hosting status

## Cost

- **Firebase Hosting Free Tier**: 
  - 10 GB storage
  - 360 MB/day data transfer
  - Perfect for portfolio sites!
- **GitHub Actions**: 
  - 2,000 minutes/month free for private repos
  - Unlimited for public repos

## Support

For issues:
1. Check GitHub Actions logs
2. Check Firebase Console
3. Review this guide
4. Check Firebase documentation

---

**Last Updated**: 2025-01-XX
**Firebase Project**: banti-rathod-tech
**Live Site**: https://banti-rathod-tech.web.app/

