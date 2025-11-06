# Banti Rathod - Flutter Developer Portfolio

A modern, responsive Flutter web portfolio showcasing my work, experience, and skills as a Flutter developer with 3.6 years of experience.

🌐 **Live Site**: [https://banti-rathod-tech.web.app](https://banti-rathod-tech.web.app)

## 🚀 Features

- ✨ Modern Material 3 Design
- 📱 Fully Responsive (Mobile, Tablet, Desktop)
- 🌓 Dark/Light Theme Support
- 🎨 Smooth Animations & Transitions
- ♿ Accessibility-First (WCAG AA Compliant)
- 🌍 Internationalization Ready
- ⚡ Optimized Performance (60fps target)
- 🔄 CI/CD with GitHub Actions

## 🛠️ Tech Stack

- **Framework**: Flutter 3.24.0
- **Language**: Dart
- **Hosting**: Firebase Hosting
- **CI/CD**: GitHub Actions
- **State Management**: Provider (local state)
- **Architecture**: MVVM/Clean Architecture

## 📦 Project Structure

```
lib/
├── adaptive/          # Responsive widgets & utilities
├── constants/         # Theme, colors, breakpoints
├── l10n/             # Internationalization files
├── pages/            # Full-page views
├── sections/         # Portfolio sections
├── utils/            # Utilities & services
└── widgets/          # Reusable widgets
```

## 🚦 Getting Started

### Prerequisites

- Flutter SDK 3.24.0 or higher
- Dart SDK 3.0.0 or higher
- Firebase account (for hosting)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/bantirathodtech/banti_rathod_flutter.git
   cd banti_rathod_flutter
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate localization files**
   ```bash
   flutter gen-l10n
   ```

4. **Run locally**
   ```bash
   flutter run -d chrome
   ```

### Build for Web

```bash
flutter build web --release --base-href /
```

## 🔄 CI/CD Pipeline

This project uses **GitHub Actions** for automated CI/CD with a three-branch strategy:

### 🌳 Branch Strategy

- **`main`** → 🟢 Production (Live deployment)
- **`staging`** → 🧪 Testing/QA (Preview deployment)
- **`dev`** → 💻 Development (Tests only, no deployment)

### Branch-Based Deployment

| Branch | Tests | Build | Deploy | Channel |
|--------|-------|-------|--------|---------|
| `dev` | ✅ | ✅ | ❌ | - |
| `staging` | ✅ | ✅ | ✅ | Preview |
| `main` | ✅ | ✅ | ✅ | Live |

### PR Checks

- **Trigger**: Pull requests to any branch
- **Checks**:
  - Code formatting
  - Static analysis
  - Test execution

### Setup Instructions

See [SETUP_FIREBASE.md](./SETUP_FIREBASE.md) for detailed setup instructions.

**Quick Setup:**
1. Add GitHub Secrets:
   - `FIREBASE_SERVICE_ACCOUNT` (JSON from Firebase Console)
   - `FIREBASE_PROJECT_ID` (Your Firebase project ID)
2. Push to branches → Automatic deployment! 🚀

For detailed workflow, see [BRANCHING_STRATEGY.md](./BRANCHING_STRATEGY.md) and [DEPLOYMENT.md](./DEPLOYMENT.md).

## 🧪 Testing

```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/widget_test.dart

# Run with coverage
flutter test --coverage
```

## 📝 Code Quality

```bash
# Format code
dart format .

# Analyze code
flutter analyze

# Fix auto-fixable issues
dart fix --apply
```

## 🌐 Internationalization

The app supports internationalization via `flutter_localizations`.

- **Current Locale**: English (en)
- **Configuration**: `l10n.yaml`
- **Strings**: `lib/l10n/app_en.arb`

To add more languages:
1. Create new `.arb` files in `lib/l10n/`
2. Update `supportedLocales` in `main.dart`

## 🎨 Theming

The app uses Material 3 with custom theming:

- **Light Theme**: Modern, clean design
- **Dark Theme**: Easy on the eyes
- **System Theme**: Follows device preference

Theme configuration: `lib/constants/theme_manager.dart`

## 📱 Responsive Design

Breakpoints:
- **Mobile**: < 600px
- **Tablet**: 600px - 900px
- **Desktop**: > 900px

Responsive utilities:
- `ResponsiveWidget`: Platform-specific layouts
- `SizeConfig`: Adaptive scaling
- `LayoutBreakpoints`: Standard breakpoints

## ♿ Accessibility

- ✅ Semantic labels on all interactive elements
- ✅ Keyboard navigation support
- ✅ Screen reader compatible
- ✅ WCAG AA color contrast
- ✅ Minimum 48dp tap targets

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📧 Contact

- **Website**: [https://banti-rathod-tech.web.app](https://banti-rathod-tech.web.app)
- **GitHub**: [@bantirathodtech](https://github.com/bantirathodtech)
- **Email**: bantirathodtech@gmail.com

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Firebase for free hosting
- Material Design for UI guidelines
- All the open-source packages used in this project

---

**Built with ❤️ using Flutter**
