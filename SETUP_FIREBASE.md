# Quick Firebase Setup Guide

## Step-by-Step Setup

### 1. Get Firebase Service Account Key

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Select your project (or create one)
3. Click the gear icon ⚙️ → **Project Settings**
4. Go to **Service Accounts** tab
5. Click **Generate new private key**
6. Download the JSON file
7. Copy the entire JSON content

### 2. Add GitHub Secrets

1. Go to: `https://github.com/bantirathodtech/banti_rathod_flutter/settings/secrets/actions`
2. Click **New repository secret**

**Add Secret 1:**
- **Name**: `FIREBASE_SERVICE_ACCOUNT`
- **Value**: Paste the entire JSON content from step 1

**Add Secret 2:**
- **Name**: `FIREBASE_PROJECT_ID`
- **Value**: Your Firebase project ID (found in Firebase Console → Project Settings → General)

### 3. Verify Firebase Hosting

1. In Firebase Console, go to **Hosting**
2. If not enabled, click **Get started**
3. Note your site URL (e.g., `https://banti-rathod-tech.web.app`)

### 4. Test the Setup

**For Production Deployment:**
1. Push a commit to `main` branch:
   ```bash
   git add .
   git commit -m "Setup CI/CD"
   git push origin main
   ```

**For Testing/QA Deployment:**
1. Push a commit to `staging` branch:
   ```bash
   git checkout staging
   git push origin staging
   ```
   - This deploys to a preview channel for testing

**For Development:**
1. Push a commit to `dev` branch:
   ```bash
   git checkout dev
   git push origin dev
   ```
   - This runs tests and builds, but doesn't deploy

2. Check GitHub Actions:
   - Go to: `https://github.com/bantirathodtech/banti_rathod_flutter/actions`
   - Watch the workflow run

3. Once complete, check your site:
   - **Production**: `https://banti-rathod-tech.web.app`
   - **Preview**: Check Firebase Console for preview URL

See [BRANCHING_STRATEGY.md](./BRANCHING_STRATEGY.md) for detailed workflow.

## Troubleshooting

### "Firebase project not found"
- Check `FIREBASE_PROJECT_ID` secret matches your Firebase project ID
- Project ID is case-sensitive!

### "Authentication failed"
- Verify `FIREBASE_SERVICE_ACCOUNT` JSON is complete
- Make sure you copied the entire JSON, including `{` and `}`

### "Build failed"
- Check GitHub Actions logs for specific errors
- Run `flutter build web --release` locally to test

## What Happens on Push

1. ✅ Tests run automatically
2. ✅ Code is analyzed
3. ✅ Web app is built
4. ✅ Deployed to Firebase Hosting

**No manual steps needed!** 🚀

