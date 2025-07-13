import 'package:banti_rathod_flutter/utils/navigation_service.dart';
import 'package:banti_rathod_flutter/utils/text_size_manager.dart';
import 'package:banti_rathod_flutter/widgets/responsive_widget.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final NavigationService navigationService;

  const NavBar({super.key, required this.navigationService});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      mobile: const SizedBox(), // Hide navbar on mobile, rely on drawer
      tablet: _buildNavRow(context),
      desktop: _buildNavRow(context),
    );
  }

  Widget _buildNavRow(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final spacing = screenWidth < 900 ? 10.0 : 20.0; // Adaptive spacing

    final navItems = [
      {'title': 'About Me', 'key': 'about'},
      {'title': 'Work Experience', 'key': 'work'},
      {'title': 'Education', 'key': 'education'},
      {'title': 'Projects', 'key': 'projects'},
      {'title': 'Contacts', 'key': 'contacts'},
      {'title': 'Published', 'key': 'published'},
      {'title': 'Testimonials', 'key': 'testimonials'},
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: navItems.asMap().entries.map((entry) {
        final item = entry.value;
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: spacing / 2),
          child: SizedBox(
            width: screenWidth < 900 ? 80 : 120, // Adaptive width
            child: _buildNavItem(context, item['title']!, item['key']!),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildNavItem(BuildContext context, String title, String sectionKey) {
    return GestureDetector(
      onTap: () => navigationService.scrollToSection(sectionKey, context),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontSize: TextSizeManager.getDynamicTextSize(
            context,
            baseSize: MediaQuery.of(context).size.width < 600 ? 14.0 : 18.0,
          ),
          fontWeight: FontWeight.bold,
          color: Theme.of(context).textTheme.bodyMedium!.color,
        ),
      ),
    );
  }
}
