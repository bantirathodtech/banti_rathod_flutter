import 'package:flutter/material.dart';

class WorkExperienceSection extends StatelessWidget {
  const WorkExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 40,
        vertical: isMobile ? 40 : 60,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Work Experience',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'My professional journey in Flutter development',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 40),
          _TimelineView(
            experiences: [
              _ExperienceData(
                company: 'Suvidha Software Solutions Pvt Ltd',
                location: 'Hyderabad, India',
                role: 'Flutter Developer',
                duration: 'Jul 2025 - Present',
                description:
                    'Developed cross-platform mobile apps using Flutter for Android & iOS. Focused on UI/UX, API integration, state management (Provider), performance optimization, and scalable app architecture. Collaborated with backend teams, handled play store deployments, and followed clean MVVM design.',
                isCurrent: true,
              ),
              _ExperienceData(
                company: 'Exceloid Soft Systems Pvt Ltd',
                location: 'Hyderabad, India',
                role: 'Flutter Developer',
                duration: 'Dec 2023 - May 2025',
                description:
                    'Proficient Flutter Application Developer with 1.5 year of IT experience in designing and delivering high-quality, scalable mobile applications. Adept at creating seamless user experiences through intuitive UI design, API integration, and optimized performance. Skilled in managing complete software development lifecycles, ensuring maintainable codebases, and implementing best practices for mobile development.',
                isCurrent: false,
              ),
              _ExperienceData(
                company: 'Infinext Technologies Pvt Ltd',
                location: 'Hyderabad, India',
                role: 'Flutter Developer',
                duration: 'Dec 2023 - Nov 2023',
                description:
                    'Proficient Flutter Application Developer with 1.5 year of IT experience in designing and delivering high-quality, scalable mobile applications. Adept at creating seamless user experiences through intuitive UI design, API integration, and optimized performance. Skilled in managing complete software development lifecycles, ensuring maintainable codebases, and implementing best practices for mobile development.',
                isCurrent: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ExperienceData {
  final String company;
  final String location;
  final String role;
  final String duration;
  final String description;
  final bool isCurrent;

  _ExperienceData({
    required this.company,
    required this.location,
    required this.role,
    required this.duration,
    required this.description,
    required this.isCurrent,
  });
}

class _TimelineView extends StatelessWidget {
  final List<_ExperienceData> experiences;

  const _TimelineView({required this.experiences});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    if (isMobile) {
      return Column(
        children: experiences.asMap().entries.map((entry) {
          return _TimelineItem(
            experience: entry.value,
            isLast: entry.key == experiences.length - 1,
            isMobile: true,
          );
        }).toList(),
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Timeline line
        SizedBox(
          width: 4,
          child: Column(
            children: List.generate(experiences.length * 2 - 1, (index) {
              if (index.isEven) {
                return _TimelineDot(experience: experiences[index ~/ 2]);
              } else {
                return Expanded(
                  child: Container(
                    width: 2,
                    color: Theme.of(
                      context,
                    ).colorScheme.outline.withValues(alpha: 0.3),
                  ),
                );
              }
            }),
          ),
        ),
        const SizedBox(width: 24),
        // Experience items
        Expanded(
          child: Column(
            children: experiences.map((exp) {
              return _TimelineItem(
                experience: exp,
                isLast: exp == experiences.last,
                isMobile: false,
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class _TimelineDot extends StatelessWidget {
  final _ExperienceData experience;

  const _TimelineDot({required this.experience});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: 16,
      height: 16,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: experience.isCurrent ? colorScheme.primary : colorScheme.outline,
        border: Border.all(color: colorScheme.surface, width: 3),
      ),
    );
  }
}

class _TimelineItem extends StatefulWidget {
  final _ExperienceData experience;
  final bool isLast;
  final bool isMobile;

  const _TimelineItem({
    required this.experience,
    required this.isLast,
    required this.isMobile,
  });

  @override
  State<_TimelineItem> createState() => _TimelineItemState();
}

class _TimelineItemState extends State<_TimelineItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.2, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return RepaintBoundary(
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: Container(
          margin: EdgeInsets.only(bottom: widget.isLast ? 0 : 40),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: widget.experience.isCurrent
                  ? colorScheme.primary.withValues(alpha: 0.3)
                  : colorScheme.outline.withValues(alpha: 0.1),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: colorScheme.shadow.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header row
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.experience.company,
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                letterSpacing: -0.3,
                              ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 16,
                              color: colorScheme.onSurfaceVariant,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              widget.experience.location,
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  if (widget.experience.isCurrent)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'Current',
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: colorScheme.onPrimaryContainer,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 16),
              // Role and Duration
              Row(
                children: [
                  Icon(
                    Icons.work_outline,
                    size: 18,
                    color: colorScheme.primary,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      widget.experience.role,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Text(
                    widget.experience.duration,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Description
              Text(
                widget.experience.description,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  height: 1.6,
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }
}
