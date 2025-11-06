import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

  /// Application title
  ///
  /// In en, this message translates to:
  /// **'Banti Rathod - Portfolio'**
  String get appTitle;

  /// About section title
  ///
  /// In en, this message translates to:
  /// **'About Me'**
  String get aboutMe;

  /// About section subtitle
  ///
  /// In en, this message translates to:
  /// **'Passionate Flutter developer crafting beautiful mobile experiences'**
  String get aboutMeSubtitle;

  /// Work experience section title
  ///
  /// In en, this message translates to:
  /// **'Work Experience'**
  String get workExperience;

  /// Work experience section subtitle
  ///
  /// In en, this message translates to:
  /// **'My professional journey in Flutter development'**
  String get workExperienceSubtitle;

  /// Projects section title
  ///
  /// In en, this message translates to:
  /// **'Projects'**
  String get projects;

  /// Projects section subtitle
  ///
  /// In en, this message translates to:
  /// **'Showcasing my Flutter development expertise'**
  String get projectsSubtitle;

  /// Skills section title
  ///
  /// In en, this message translates to:
  /// **'Skills & Technologies'**
  String get skillsTechnologies;

  /// Download resume button label
  ///
  /// In en, this message translates to:
  /// **'Download Resume'**
  String get downloadResume;

  /// Current job indicator
  ///
  /// In en, this message translates to:
  /// **'Current'**
  String get current;

  /// Scroll indicator text
  ///
  /// In en, this message translates to:
  /// **'Scroll to explore'**
  String get scrollToExplore;

  /// Menu button label
  ///
  /// In en, this message translates to:
  /// **'Menu'**
  String get menu;

  /// Theme toggle tooltip for light mode
  ///
  /// In en, this message translates to:
  /// **'Switch to light mode'**
  String get switchToLightMode;

  /// Theme toggle tooltip for dark mode
  ///
  /// In en, this message translates to:
  /// **'Switch to dark mode'**
  String get switchToDarkMode;

  /// Back to top button label
  ///
  /// In en, this message translates to:
  /// **'Back to top'**
  String get backToTop;

  /// Contact section navigation label
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get contact;

  /// About section navigation label
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// Experience section navigation label
  ///
  /// In en, this message translates to:
  /// **'Experience'**
  String get experience;

  /// Education section navigation label
  ///
  /// In en, this message translates to:
  /// **'Education'**
  String get education;

  /// Media section navigation label
  ///
  /// In en, this message translates to:
  /// **'Media'**
  String get media;

  /// Testimonials section navigation label
  ///
  /// In en, this message translates to:
  /// **'Testimonials'**
  String get testimonials;

  /// Error message when resume download fails
  ///
  /// In en, this message translates to:
  /// **'Could not download resume'**
  String get couldNotDownloadResume;

  /// Error message when PDF download fails
  ///
  /// In en, this message translates to:
  /// **'Could not download PDF'**
  String get couldNotDownloadPdf;

  /// Developer role/title
  ///
  /// In en, this message translates to:
  /// **'Flutter Developer'**
  String get flutterDeveloper;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
