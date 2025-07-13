import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/layout_breakpoints.dart';
import '../utils/text_size_manager.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  final Map<int, bool> _expandedStates = {};
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeStates();
  }

  void _initializeStates() {
    for (int i = 0; i < projects.length; i++) {
      _expandedStates[i] = false;
    }
    _isInitialized = true;
  }

  void _onCardExpanded(int index, bool isExpanded) {
    if (!_isInitialized) return;

    setState(() {
      _expandedStates[index] = isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return Container(
        padding: const EdgeInsets.all(20),
        color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.9),
        child: const Center(child: CircularProgressIndicator()),
      );
    }

    return Container(
      padding: const EdgeInsets.all(20),
      color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.9),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Projects',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.bodyMedium!.color,
            ),
          ),
          const SizedBox(height: 20),
          _buildResponsiveProjectGrid(context),
        ],
      ),
    );
  }

  Widget _buildResponsiveProjectGrid(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = _getCrossAxisCount(screenWidth);
    final cardWidth = _getCardWidth(screenWidth, crossAxisCount);

    return Wrap(
      spacing: LayoutBreakpoints.cardHorizontalSpacing,
      runSpacing: LayoutBreakpoints.cardVerticalSpacing,
      children: projects.asMap().entries.map((entry) {
        final index = entry.key;
        final project = entry.value;

        return SizedBox(
          width: cardWidth,
          child: ProjectCard(
            key: ValueKey('project_card_$index'),
            title: project['title']!,
            description: project['description']!,
            status: project['status']!,
            playStoreUrl: project['playStoreUrl'],
            appStoreUrl: project['appStoreUrl'],
            imageUrl: project['imageUrl']!,
            isExpanded: _expandedStates[index] ?? false,
            onExpansionChanged: (isExpanded) =>
                _onCardExpanded(index, isExpanded),
            cardWidth: cardWidth,
          ),
        );
      }).toList(),
    );
  }

  int _getCrossAxisCount(double screenWidth) {
    if (screenWidth > 1200) return 4; // Up to 4 cards on large screens
    if (screenWidth > 900) return 3;
    return 2; // Minimum 2 cards on smaller screens
  }

  double _getCardWidth(double screenWidth, int crossAxisCount) {
    double cardWidth =
        (screenWidth -
            (LayoutBreakpoints.cardHorizontalSpacing * (crossAxisCount + 1))) /
        crossAxisCount;
    return cardWidth.clamp(
      150.0,
      LayoutBreakpoints.maxCardWidth,
    ); // Minimum 150px
  }

  final List<Map<String, dynamic>> projects = [
    {
      'title': 'APTDC Tourism App (Andhra Pradesh Tourism)',
      'description':
          'Developed the official mobile app for APTDC to manage tourism bookings and track passengers in real time using RFID, enabling seamless travel experiences and efficient resource management for the tourism board. This comprehensive system includes booking, real-time tracking, and administrative features.',
      'status': 'Live',
      'playStoreUrl':
          'https://play.google.com/store/apps/details?id=com.aptcd.tourism',
      'appStoreUrl': 'https://apps.apple.com/us/app/aptcd-tourism/id123456789',
      'imageUrl': 'assets/aptcd_tourism.png',
    },
    {
      'title': 'Construction Material Dispatch & Tracking App',
      'description':
          'A 3-stage system to manage vehicle-based dispatch of materials like sand, gravel, and cement from suppliers to construction sites. This includes order placement, dispatch management, real-time vehicle tracking, and delivery confirmation, significantly improving logistics efficiency and transparency.',
      'status': 'In Development',
      'playStoreUrl': null,
      'appStoreUrl': null,
      'imageUrl': 'assets/construction_app.png',
    },
    {
      'title': 'Quicken - FoodCourt Ordering App',
      'description':
          'Built a multi-stall food ordering app where users select their location, choose a food court, and browse all stalls inside. Features include menu Browse, order customization, secure payment gateway integration, and real-time order status updates, providing a convenient and efficient food ordering experience.',
      'status': 'Live',
      'playStoreUrl':
          'https://play.google.com/store/apps/details?id=com.cwsuite.food.ordering&pcampaignid=web_share',
      'appStoreUrl': null,
      'imageUrl': 'assets/qicken_app.png',
    },
    {
      'title': 'Amewkart – Affiliate E-commerce App',
      'description':
          'Built an affiliate-based shopping app that lists the best-rated products from Amazon and Flipkart, allowing users to compare prices and make informed purchasing decisions. The app integrates with affiliate APIs to track referrals and commissions, offering a curated shopping experience.',
      'status': 'Live',
      'playStoreUrl':
          'https://play.google.com/store/apps/details?id=com.amewkart.ecommerce',
      'appStoreUrl': 'https://apps.apple.com/us/app/amewkart/id987654321',
      'imageUrl': 'assets/amewkart_app.png',
    },
    {
      'title': 'Fitness Tracker App',
      'description':
          'A mobile application designed to help users track their fitness activities, set goals, and monitor progress. Includes features for logging workouts, tracking calories, monitoring sleep, and generating performance reports. Integrates with wearable devices for seamless data synchronization.',
      'status': 'Live',
      'playStoreUrl': null,
      'appStoreUrl': null,
      'imageUrl': 'assets/fitness_app.png',
    },
    {
      'title': 'Personal Portfolio Website',
      'description':
          'A responsive web portfolio showcasing various projects, skills, and contact information. Built with modern web technologies, featuring smooth animations and a clean UI/UX design. Optimized for fast loading and cross-browser compatibility.',
      'status': 'Live',
      'playStoreUrl': null,
      'appStoreUrl': null,
      'imageUrl': 'assets/portfolio_web.png',
    },
  ];
}

class ProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final String status;
  final String? playStoreUrl;
  final String? appStoreUrl;
  final String imageUrl;
  final bool isExpanded;
  final ValueChanged<bool> onExpansionChanged;
  final double cardWidth;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.status,
    this.playStoreUrl,
    this.appStoreUrl,
    required this.imageUrl,
    required this.isExpanded,
    required this.onExpansionChanged,
    required this.cardWidth,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    if (widget.isExpanded) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(ProjectCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isExpanded != oldWidget.isExpanded) {
      if (widget.isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleExpand() {
    widget.onExpansionChanged(!widget.isExpanded);
  }

  String _getTruncatedDescription(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
      fontSize: TextSizeManager.getDynamicTextSize(context, baseSize: 13.0),
      height: 1.4,
      fontFamily: 'Open Sans',
      color: Colors.grey[700],
    );

    final textPainter = TextPainter(
      text: TextSpan(text: widget.description, style: textStyle),
      maxLines: 2,
      textDirection: TextDirection.ltr,
    );

    final availableWidth = widget.cardWidth - 30; // 30 for padding
    textPainter.layout(maxWidth: availableWidth);

    if (!textPainter.didExceedMaxLines) {
      return widget.description;
    }

    final words = widget.description.split(' ');
    String truncated = '';

    for (int i = 0; i < words.length; i++) {
      final testText = truncated.isEmpty ? words[i] : '$truncated ${words[i]}';
      final testPainter = TextPainter(
        text: TextSpan(text: testText, style: textStyle),
        maxLines: 2,
        textDirection: TextDirection.ltr,
      );
      testPainter.layout(maxWidth: availableWidth);

      if (testPainter.didExceedMaxLines) {
        break;
      }
      truncated = testText;
    }

    return truncated;
  }

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge?.copyWith(
      fontSize: TextSizeManager.getDynamicTextSize(context, baseSize: 16.0),
      fontWeight: FontWeight.bold,
      color: Theme.of(context).textTheme.bodyMedium!.color,
    );

    final truncatedDescription = _getTruncatedDescription(context);
    final needsTruncation = truncatedDescription != widget.description;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          clipBehavior: Clip.antiAlias,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).primaryColor.withOpacity(0.1),
                  Theme.of(context).cardColor,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(color: Theme.of(context).cardColor),
                  child: Image.asset(
                    widget.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Theme.of(context).cardColor,
                        child: Icon(
                          Icons.image_not_supported,
                          size: 60,
                          color: Colors.grey[600],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height:
                            TextSizeManager.getDynamicTextSize(
                              context,
                              baseSize: 16.0,
                            ) *
                            2.8,
                        child: Text(
                          widget.title,
                          style: titleStyle,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 8),
                      AnimatedSize(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            widget.isExpanded
                                ? Text(
                                    widget.description,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          fontSize:
                                              TextSizeManager.getDynamicTextSize(
                                                context,
                                                baseSize: 13.0,
                                              ),
                                          height: 1.4,
                                          fontFamily: 'Open Sans',
                                          color: Colors.grey[700],
                                        ),
                                  )
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        truncatedDescription,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              fontSize:
                                                  TextSizeManager.getDynamicTextSize(
                                                    context,
                                                    baseSize: 13.0,
                                                  ),
                                              height: 1.4,
                                              fontFamily: 'Open Sans',
                                              color: Colors.grey[700],
                                            ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      if (needsTruncation) ...[
                                        const SizedBox(height: 4),
                                        Text(
                                          '... (tap "Read More" to know more)',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                fontSize:
                                                    TextSizeManager.getDynamicTextSize(
                                                      context,
                                                      baseSize: 11.0,
                                                    ),
                                                fontStyle: FontStyle.italic,
                                                color: Theme.of(
                                                  context,
                                                ).primaryColor,
                                              ),
                                        ),
                                      ],
                                    ],
                                  ),
                            const SizedBox(height: 12),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: widget.status == 'Live'
                                  ? Colors.green.shade600
                                  : Colors.orange.shade600,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              widget.status,
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(
                                    fontSize:
                                        TextSizeManager.getDynamicTextSize(
                                          context,
                                          baseSize: 11.0,
                                        ),
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (widget.playStoreUrl != null)
                                IconButton(
                                  icon: const FaIcon(
                                    FontAwesomeIcons.googlePlay,
                                    color: Color(0xFF3DDC84),
                                    size: 20,
                                  ),
                                  onPressed: () =>
                                      _launchUrl(widget.playStoreUrl!),
                                  constraints: const BoxConstraints(
                                    minWidth: 32,
                                    minHeight: 32,
                                  ),
                                  padding: const EdgeInsets.all(4),
                                ),
                              if (widget.appStoreUrl != null)
                                IconButton(
                                  icon: const FaIcon(
                                    FontAwesomeIcons.appStore,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                  onPressed: () =>
                                      _launchUrl(widget.appStoreUrl!),
                                  constraints: const BoxConstraints(
                                    minWidth: 32,
                                    minHeight: 32,
                                  ),
                                  padding: const EdgeInsets.all(4),
                                ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _toggleExpand,
                          style: Theme.of(context).elevatedButtonTheme.style,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                widget.isExpanded ? 'Show Less' : 'Read More',
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(
                                      fontSize:
                                          TextSizeManager.getDynamicTextSize(
                                            context,
                                            baseSize: 12.0,
                                          ),
                                      color: Colors.white,
                                    ),
                              ),
                              const SizedBox(width: 4),
                              AnimatedRotation(
                                turns: widget.isExpanded ? 0.5 : 0.0,
                                duration: const Duration(milliseconds: 400),
                                child: const Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Could not launch $url')));
      }
    }
  }
}
