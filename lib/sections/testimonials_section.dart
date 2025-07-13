import 'package:flutter/material.dart';

import '../utils/text_size_manager.dart';

class TestimonialsSection extends StatelessWidget {
  TestimonialsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.9),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Testimonials',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.bodyMedium!.color,
            ),
          ),
          const SizedBox(height: 20),
          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = _getCrossAxisCount(constraints.maxWidth);
              double cardWidth = _getCardWidth(
                constraints.maxWidth,
                crossAxisCount,
              );
              return Wrap(
                spacing: 20,
                runSpacing: 20,
                alignment: WrapAlignment.center,
                children: testimonials.asMap().entries.map((entry) {
                  return SizedBox(
                    width: cardWidth,
                    child: TestimonialCard(
                      name: entry.value['name']!,
                      role: entry.value['role']!,
                      quote: entry.value['quote']!,
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }

  int _getCrossAxisCount(double screenWidth) {
    if (screenWidth > 1200) return 4; // Up to 4 cards
    if (screenWidth > 900) return 3;
    return 2; // Minimum 2 cards
  }

  double _getCardWidth(double screenWidth, int crossAxisCount) {
    double cardWidth =
        (screenWidth - (20 * (crossAxisCount + 1))) / crossAxisCount;
    return cardWidth.clamp(150.0, 300.0); // Min 150px, max 300px
  }

  final List<Map<String, String>> testimonials = [
    {
      'name': 'Krishna Vamshi',
      'role': 'Project Manager',
      'quote':
          'Banti’s work on the APTDC app was outstanding, delivering on time with great quality.',
    },
    {
      'name': 'Shubham Gulhane',
      'role': 'Client',
      'quote':
          'The Quicken app transformed our food court operations—highly recommend Banti!',
    },
    {
      'name': 'Navara Joseph',
      'role': 'Client',
      'quote':
          'The Quicken app transformed our food court operations—highly recommend Banti!',
    },
    {
      'name': 'Ravi Reddy',
      'role': 'Client',
      'quote':
          'The Quicken app transformed our food court operations—highly recommend Banti!',
    },
  ];
}

class TestimonialCard extends StatefulWidget {
  final String name;
  final String role;
  final String quote;

  const TestimonialCard({
    super.key,
    required this.name,
    required this.role,
    required this.quote,
  });

  @override
  State<TestimonialCard> createState() => _TestimonialCardState();
}

class _TestimonialCardState extends State<TestimonialCard>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _controller;
  late Animation<double> _heightAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _heightAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
    if (_isExpanded) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).primaryColor.withOpacity(0.1),
              Theme.of(context).cardColor,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (_isExpanded)
                AnimatedBuilder(
                  animation: _heightAnimation,
                  builder: (context, child) {
                    return SizedBox(
                      height: _heightAnimation.value * 150,
                      child: SingleChildScrollView(
                        child: Text(
                          '"${widget.quote}"',
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                fontStyle: FontStyle.italic,
                                fontSize: TextSizeManager.getDynamicTextSize(
                                  context,
                                  baseSize: 16.0,
                                ),
                                fontFamily: 'Open Sans',
                                height: 1.5,
                              ),
                        ),
                      ),
                    );
                  },
                ),
              if (!_isExpanded)
                Text(
                  '"${widget.quote}"',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontStyle: FontStyle.italic,
                    fontSize: TextSizeManager.getDynamicTextSize(
                      context,
                      baseSize: 16.0,
                    ),
                    fontFamily: 'Open Sans',
                    height: 1.5,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              const SizedBox(height: 10),
              Text(
                '- ${widget.name}, ${widget.role}',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: TextSizeManager.getDynamicTextSize(
                    context,
                    baseSize: 16.0,
                  ),
                  fontFamily: 'Roboto',
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: _toggleExpand,
                  style: Theme.of(context).elevatedButtonTheme.style,
                  child: Text(
                    _isExpanded ? 'Show Less' : 'Read More',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: TextSizeManager.getDynamicTextSize(
                        context,
                        baseSize: 12.0,
                      ),
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
