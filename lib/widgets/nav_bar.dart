import 'package:banti_rathod_flutter/adaptive/spacing_manager.dart';
import 'package:banti_rathod_flutter/adaptive/text_size_manager.dart';
import 'package:banti_rathod_flutter/utils/navigation_service.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  final NavigationService navigationService;

  const NavBar({super.key, required this.navigationService});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  String? _activeSection;

  @override
  void initState() {
    super.initState();
    _activeSection = 'about'; // Default active section
  }

  void _setActiveSection(String section) {
    setState(() {
      _activeSection = section;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    if (isMobile) {
      return _buildMobileNav(context, colorScheme);
    }

    return _buildDesktopNav(context, colorScheme);
  }

  Widget _buildMobileNav(BuildContext context, ColorScheme colorScheme) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _buildNavItems(context, colorScheme, isCompact: true),
      ),
    );
  }

  Widget _buildDesktopNav(BuildContext context, ColorScheme colorScheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: _buildNavItems(context, colorScheme, isCompact: false),
    );
  }

  List<Widget> _buildNavItems(
    BuildContext context,
    ColorScheme colorScheme, {
    required bool isCompact,
  }) {
    final navItems = [
      {'title': 'About', 'key': 'about'},
      {'title': 'Experience', 'key': 'work'},
      {'title': 'Education', 'key': 'education'},
      {'title': 'Projects', 'key': 'projects'},
      {'title': 'Contact', 'key': 'contacts'},
      {'title': 'Media', 'key': 'published'},
      {'title': 'Testimonials', 'key': 'testimonials'},
    ];

    return navItems.map((item) {
      final isActive = _activeSection == item['key'];

      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isCompact ? SpacingManager.xs : SpacingManager.sm,
        ),
        child: _NavItem(
          title: item['title']!,
          isActive: isActive,
          onTap: () {
            _setActiveSection(item['key']!);
            widget.navigationService.scrollToSection(item['key']!, context);
          },
          colorScheme: colorScheme,
        ),
      );
    }).toList();
  }
}

class _NavItem extends StatefulWidget {
  final String title;
  final bool isActive;
  final VoidCallback onTap;
  final ColorScheme colorScheme;

  const _NavItem({
    required this.title,
    required this.isActive,
    required this.onTap,
    required this.colorScheme,
  });

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _hoverController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _hoverController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(parent: _hoverController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _hoverController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _hoverController.forward(),
      onExit: (_) => _hoverController.reverse(),
      child: Semantics(
        button: true,
        label: 'Navigate to ${widget.title} section',
        child: RepaintBoundary(
          child: GestureDetector(
            onTap: widget.onTap,
            child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: widget.isActive
                  ? widget.colorScheme.primaryContainer.withValues(alpha: 0.3)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
              border: widget.isActive
                  ? Border.all(color: widget.colorScheme.primary, width: 1.5)
                  : null,
            ),
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: Text(
                widget.title,
                style: TextSizeManager.responsiveTextStyle(
                  context,
                  baseSize: TextSizeManager.sm,
                  fontWeight: widget.isActive
                      ? FontWeight.w600
                      : FontWeight.w500,
                  color: widget.isActive
                      ? widget.colorScheme.primary
                      : widget.colorScheme.onSurface,
                ),
            ),
          ),
        ),
          ),
        ),
      ),
    );
  }
}
