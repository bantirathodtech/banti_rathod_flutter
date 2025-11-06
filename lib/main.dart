import 'package:banti_rathod_flutter/adaptive/responsive_widget.dart';
import 'package:banti_rathod_flutter/constants/theme_manager.dart';
import 'package:banti_rathod_flutter/sections/about_section.dart';
import 'package:banti_rathod_flutter/sections/contact_section.dart';
import 'package:banti_rathod_flutter/sections/education_section.dart';
import 'package:banti_rathod_flutter/sections/footer_section.dart';
import 'package:banti_rathod_flutter/sections/header_section.dart';
import 'package:banti_rathod_flutter/sections/projects_section.dart';
import 'package:banti_rathod_flutter/sections/published_media_section.dart';
import 'package:banti_rathod_flutter/sections/testimonials_section.dart';
import 'package:banti_rathod_flutter/sections/work_experience_section.dart';
import 'package:banti_rathod_flutter/utils/navigation_service.dart';
import 'package:banti_rathod_flutter/widgets/flutter_index_drawer.dart';
import 'package:banti_rathod_flutter/widgets/nav_bar.dart';
import 'package:flutter/material.dart';

import 'adaptive/size_config.dart';
import 'utils/error_handler.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  // Initialize error handling
  ErrorHandler.initializeErrorHandling();

  runApp(const MyPortfolioApp());
}

class MyPortfolioApp extends StatefulWidget {
  const MyPortfolioApp({super.key});

  @override
  State<MyPortfolioApp> createState() => _MyPortfolioAppState();
}

class _MyPortfolioAppState extends State<MyPortfolioApp> {
  ThemeMode _themeMode = ThemeMode.system;

  @override
  void initState() {
    super.initState();
    _loadThemeMode();
  }

  Future<void> _loadThemeMode() async {
    final themeMode = await ThemeManager.loadThemeMode();
    if (mounted) {
      setState(() {
        _themeMode = themeMode;
      });
    }
  }

  void _toggleTheme() {
    setState(() {
      switch (_themeMode) {
        case ThemeMode.system:
          _themeMode = ThemeMode.light;
          break;
        case ThemeMode.light:
          _themeMode = ThemeMode.dark;
          break;
        case ThemeMode.dark:
          _themeMode = ThemeMode.light;
          break;
      }
      ThemeManager.saveThemeMode(_themeMode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Banti Rathod - Portfolio',
      theme: ThemeManager.lightTheme,
      darkTheme: ThemeManager.darkTheme,
      themeMode: _themeMode,
      // Internationalization - will be enabled after generating localization files
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English
      ],
      home: PortfolioPage(
        onThemeToggle: _toggleTheme,
        currentThemeMode: _themeMode,
      ),
    );
  }
}

class PortfolioPage extends StatefulWidget {
  final VoidCallback onThemeToggle;
  final ThemeMode currentThemeMode;

  const PortfolioPage({
    super.key,
    required this.onThemeToggle,
    required this.currentThemeMode,
  });

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final ScrollController _scrollController = ScrollController();
  final NavigationService _navigationService = NavigationService();
  bool _showBackToTop = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _showBackToTop = _scrollController.offset > 300;
      });
    });
    _navigationService.initializeKeys({
      'header': GlobalKey(),
      'about': GlobalKey(),
      'work': GlobalKey(),
      'education': GlobalKey(),
      'projects': GlobalKey(),
      'contacts': GlobalKey(),
      'published': GlobalKey(),
      'testimonials': GlobalKey(),
      'footer': GlobalKey(),
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  /// Helper method to wrap sections in ResponsiveWidget
  Widget _buildSection(String keyName, Widget section) {
    final key = _navigationService.getKey(keyName);

    Widget wrappedSection = section;

    // Assign key to section
    if (key != null) {
      wrappedSection = KeyedSubtree(key: key, child: section);
    }

    return ResponsiveWidget(
      mobile: wrappedSection,
      tablet: _buildCenteredContainer(wrappedSection),
      desktop: _buildCenteredContainer(wrappedSection),
    );
  }

  /// Helper for tablet/desktop max width
  Widget _buildCenteredContainer(Widget child) {
    return Center(
      child: Container(
        width: double.infinity,
        constraints: const BoxConstraints(maxWidth: 1200),
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(
            color: colorScheme.surface.withValues(alpha: 0.8),
            boxShadow: _showBackToTop
                ? [
                    BoxShadow(
                      color: colorScheme.shadow.withValues(alpha: 0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : null,
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Builder(
              builder: (context) => IconButton(
                icon: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Icon(
                    Icons.menu,
                    size: MediaQuery.of(context).size.width < 600 ? 24 : 28,
                    color: colorScheme.onSurface,
                  ),
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
            actions: [
              Semantics(
                button: true,
                label: isDark ? 'Switch to light mode' : 'Switch to dark mode',
                child: IconButton(
                  icon: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Icon(
                      isDark ? Icons.light_mode : Icons.dark_mode,
                      size: MediaQuery.of(context).size.width < 600 ? 24 : 28,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  onPressed: widget.onThemeToggle,
                  tooltip: isDark
                      ? 'Switch to light mode'
                      : 'Switch to dark mode',
                ),
              ),
            ],
            title: NavBar(navigationService: _navigationService),
          ),
        ),
      ),
      drawer: const FlutterIndexDrawer(),
      body: SizeConfigBuilder(
        builder: (context) => Stack(
          children: [
            Scrollbar(
              controller: _scrollController,
              thumbVisibility: true,
              trackVisibility: true,
              child: SingleChildScrollView(
                controller: _scrollController,
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSection('header', const HeaderSection()),
                    _buildSection('about', const AboutSection()),
                    _buildSection('work', const WorkExperienceSection()),
                    _buildSection('education', const EducationSection()),
                    _buildSection('projects', const ProjectsSection()),
                    _buildSection('contacts', const ContactSection()),
                    _buildSection('published', const PublishedMediaSection()),
                    _buildSection('testimonials', const TestimonialsSection()),
                    _buildSection('footer', const FooterSection()),
                  ],
                ),
              ),
            ),
            if (_showBackToTop)
              Positioned(
                right: MediaQuery.of(context).size.width < 600 ? 20 : 40,
                bottom: 20,
                child: Semantics(
                  button: true,
                  label: 'Back to top',
                  child: FloatingActionButton(
                    onPressed: () => _scrollController.animateTo(
                      0,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    ),
                    backgroundColor: colorScheme.primary,
                    foregroundColor: colorScheme.onPrimary,
                    child: Icon(
                      Icons.arrow_upward,
                      size: MediaQuery.of(context).size.width < 600 ? 20 : 24,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
