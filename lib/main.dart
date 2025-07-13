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
import 'package:banti_rathod_flutter/widgets/responsive_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyPortfolioApp());
}

class MyPortfolioApp extends StatelessWidget {
  const MyPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Banti Rathod - Portfolio',
      theme: ThemeManager.lightTheme,
      darkTheme: ThemeManager.darkTheme,
      themeMode: ThemeMode.system,
      home: const PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final ScrollController _scrollController = ScrollController();
  final NavigationService _navigationService = NavigationService();
  bool _isDarkTheme = false;
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

  void _toggleTheme() {
    setState(() {
      _isDarkTheme = !_isDarkTheme;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _isDarkTheme ? ThemeManager.darkTheme : ThemeManager.lightTheme,
      child: Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (context) => IconButton(
              icon: Padding(
                padding: const EdgeInsets.only(left: 32.0),
                child: Icon(
                  Icons.menu,
                  size: MediaQuery.of(context).size.width < 600 ? 24 : 30,
                  color: Theme.of(context).textTheme.bodyMedium!.color,
                ),
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          actions: [
            IconButton(
              icon: Padding(
                padding: const EdgeInsets.only(right: 32.0),
                child: Icon(
                  _isDarkTheme ? Icons.light_mode : Icons.dark_mode,
                  size: MediaQuery.of(context).size.width < 600 ? 24 : 30,
                  // color: Theme.of(context).textTheme.bodyMedium!.color,
                  color: _isDarkTheme ? Colors.white : Colors.black,
                ),
              ),
              onPressed: _toggleTheme,
            ),
          ],
          // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          backgroundColor: _isDarkTheme ? Colors.black : Colors.white,
          elevation: 4,
          title: NavBar(navigationService: _navigationService),
          centerTitle: true,
        ),
        drawer: const FlutterIndexDrawer(),
        body: Stack(
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
                    ResponsiveWidget(
                      mobile: HeaderSection(
                        key: _navigationService.getKey('header'),
                      ),
                      tablet: Center(
                        child: Container(
                          width: double.infinity,
                          constraints: const BoxConstraints(maxWidth: 1200),
                          child: HeaderSection(
                            key: _navigationService.getKey('header'),
                          ),
                        ),
                      ),
                      desktop: Center(
                        child: Container(
                          width: double.infinity,
                          constraints: const BoxConstraints(maxWidth: 1200),
                          child: HeaderSection(
                            key: _navigationService.getKey('header'),
                          ),
                        ),
                      ),
                    ),
                    ResponsiveWidget(
                      mobile: AboutSection(
                        key: _navigationService.getKey('about'),
                      ),
                      tablet: Center(
                        child: Container(
                          width: double.infinity,
                          constraints: const BoxConstraints(maxWidth: 1200),
                          child: AboutSection(
                            key: _navigationService.getKey('about'),
                          ),
                        ),
                      ),
                      desktop: Center(
                        child: Container(
                          width: double.infinity,
                          constraints: const BoxConstraints(maxWidth: 1200),
                          child: AboutSection(
                            key: _navigationService.getKey('about'),
                          ),
                        ),
                      ),
                    ),
                    ResponsiveWidget(
                      mobile: WorkExperienceSection(
                        key: _navigationService.getKey('work'),
                      ),
                      tablet: Center(
                        child: Container(
                          width: double.infinity,
                          constraints: const BoxConstraints(maxWidth: 1200),
                          child: WorkExperienceSection(
                            key: _navigationService.getKey('work'),
                          ),
                        ),
                      ),
                      desktop: Center(
                        child: Container(
                          width: double.infinity,
                          constraints: const BoxConstraints(maxWidth: 1200),
                          child: WorkExperienceSection(
                            key: _navigationService.getKey('work'),
                          ),
                        ),
                      ),
                    ),
                    ResponsiveWidget(
                      mobile: EducationSection(
                        key: _navigationService.getKey('education'),
                      ),
                      tablet: Center(
                        child: Container(
                          width: double.infinity,
                          constraints: const BoxConstraints(maxWidth: 1200),
                          child: EducationSection(
                            key: _navigationService.getKey('education'),
                          ),
                        ),
                      ),
                      desktop: Center(
                        child: Container(
                          width: double.infinity,
                          constraints: const BoxConstraints(maxWidth: 1200),
                          child: EducationSection(
                            key: _navigationService.getKey('education'),
                          ),
                        ),
                      ),
                    ),
                    ResponsiveWidget(
                      mobile: ProjectsSection(
                        key: _navigationService.getKey('projects'),
                      ),
                      tablet: Center(
                        child: Container(
                          width: double.infinity,
                          constraints: const BoxConstraints(maxWidth: 1200),
                          child: ProjectsSection(
                            key: _navigationService.getKey('projects'),
                          ),
                        ),
                      ),
                      desktop: Center(
                        child: Container(
                          width: double.infinity,
                          constraints: const BoxConstraints(maxWidth: 1200),
                          child: ProjectsSection(
                            key: _navigationService.getKey('projects'),
                          ),
                        ),
                      ),
                    ),
                    ResponsiveWidget(
                      mobile: ContactSection(
                        key: _navigationService.getKey('contacts'),
                      ),
                      tablet: Center(
                        child: Container(
                          width: double.infinity,
                          constraints: const BoxConstraints(maxWidth: 1200),
                          child: ContactSection(
                            key: _navigationService.getKey('contacts'),
                          ),
                        ),
                      ),
                      desktop: Center(
                        child: Container(
                          width: double.infinity,
                          constraints: const BoxConstraints(maxWidth: 1200),
                          child: ContactSection(
                            key: _navigationService.getKey('contacts'),
                          ),
                        ),
                      ),
                    ),
                    ResponsiveWidget(
                      mobile: PublishedMediaSection(
                        key: _navigationService.getKey('published'),
                      ),
                      tablet: Center(
                        child: Container(
                          width: double.infinity,
                          constraints: const BoxConstraints(maxWidth: 1200),
                          child: PublishedMediaSection(
                            key: _navigationService.getKey('published'),
                          ),
                        ),
                      ),
                      desktop: Center(
                        child: Container(
                          width: double.infinity,
                          constraints: const BoxConstraints(maxWidth: 1200),
                          child: PublishedMediaSection(
                            key: _navigationService.getKey('published'),
                          ),
                        ),
                      ),
                    ),
                    ResponsiveWidget(
                      mobile: TestimonialsSection(
                        key: _navigationService.getKey('testimonials'),
                      ),
                      tablet: Center(
                        child: Container(
                          width: double.infinity,
                          constraints: const BoxConstraints(maxWidth: 1200),
                          child: TestimonialsSection(
                            key: _navigationService.getKey('testimonials'),
                          ),
                        ),
                      ),
                      desktop: Center(
                        child: Container(
                          width: double.infinity,
                          constraints: const BoxConstraints(maxWidth: 1200),
                          child: TestimonialsSection(
                            key: _navigationService.getKey('testimonials'),
                          ),
                        ),
                      ),
                    ),
                    ResponsiveWidget(
                      mobile: FooterSection(
                        key: _navigationService.getKey('footer'),
                      ),
                      tablet: Center(
                        child: Container(
                          width: double.infinity,
                          constraints: const BoxConstraints(maxWidth: 1200),
                          child: FooterSection(
                            key: _navigationService.getKey('footer'),
                          ),
                        ),
                      ),
                      desktop: Center(
                        child: Container(
                          width: double.infinity,
                          constraints: const BoxConstraints(maxWidth: 1200),
                          child: FooterSection(
                            key: _navigationService.getKey('footer'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (_showBackToTop)
              Positioned(
                right: MediaQuery.of(context).size.width < 600 ? 20 : 40,
                bottom: 20,
                child: FloatingActionButton(
                  onPressed: () => _scrollController.animateTo(
                    0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  ),
                  backgroundColor: Theme.of(context).primaryColor,
                  child: Icon(
                    Icons.arrow_upward,
                    size: MediaQuery.of(context).size.width < 600 ? 20 : 24,
                    color: Theme.of(context).textTheme.bodyMedium!.color,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
