# GitHub Actions Workflows

This directory contains CI/CD workflows for automated testing and deployment.

## Workflows

### `ci_cd.yml`
Main CI/CD pipeline that runs on every push and PR:
- **Test Job**: Runs Flutter tests, code analysis, and formatting checks
- **Build Job**: Builds the Flutter web app for production
- **Deploy Job**: Automatically deploys to Firebase Hosting (main/master branch only)

### `pr-checks.yml`
PR-specific workflow that runs quality checks:
- Code formatting verification
- Static analysis
- Test execution
- Prevents merging of broken code

## Setup

1. Configure GitHub Secrets (see DEPLOYMENT.md)
2. Push to main branch to trigger deployment
3. Monitor in Actions tab

## Secrets Required

- `FIREBASE_SERVICE_ACCOUNT`: Firebase service account JSON
- `FIREBASE_PROJECT_ID`: Firebase project ID

