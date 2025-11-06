import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/custom_button.dart';
import '../widgets/skill_badge.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

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
          // Section Header
          Text(
            'About Me',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Passionate Flutter developer crafting beautiful mobile experiences',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          SizedBox(height: isMobile ? 32 : 48),

          // Main Content - Two Column Layout on Desktop
          isMobile
              ? _buildMobileLayout(context, colorScheme)
              : _buildDesktopLayout(context, colorScheme),
        ],
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context, ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDescription(context, colorScheme),
        const SizedBox(height: 32),
        _buildResumeButton(context),
        const SizedBox(height: 32),
        _buildSkillsSection(context, colorScheme),
      ],
    );
  }

  Widget _buildDesktopLayout(BuildContext context, ColorScheme colorScheme) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 2, child: _buildDescription(context, colorScheme)),
        const SizedBox(width: 48),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildResumeButton(context),
              const SizedBox(height: 32),
              _buildSkillsSection(context, colorScheme),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDescription(BuildContext context, ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "I'm a passionate and detail-oriented Mobile App Developer with 3.6 years of experience in building scalable and intuitive Flutter applications. I specialize in crafting clean, maintainable code using MVVM and Clean Architecture, with strong skills in REST API integration, Firebase services, Google Maps, and state management using Provider.",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            height: 1.7,
            color: colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Key Projects:',
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),
        _buildProjectBullet(
          context,
          'APTDC Tourism App',
          'Real-time passenger tracking using RFID for Andhra Pradesh tourism services',
        ),
        _buildProjectBullet(
          context,
          'Construction Dispatch App',
          'A 3-stage QR-based system for managing vehicle material dispatch and secure exits',
        ),
        _buildProjectBullet(
          context,
          'Qicken FoodCourt App',
          'Multi-stall food ordering with live menu updates and shared table delivery',
        ),
        _buildProjectBullet(
          context,
          'Amewkart',
          'Affiliate e-commerce app featuring curated Amazon/Flipkart products with influencer recommendations',
        ),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: colorScheme.primaryContainer.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: colorScheme.primary.withValues(alpha: 0.2),
            ),
          ),
          child: Text(
            "I bring a strong command of Git/GitHub, a commitment to continuous learning, and a drive to contribute to innovative, user-focused solutions.",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              height: 1.6,
              color: colorScheme.onSurface,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProjectBullet(
    BuildContext context,
    String title,
    String description,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 6, right: 12),
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: colorScheme.primary,
              shape: BoxShape.circle,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResumeButton(BuildContext context) {
    return CustomButton(
      label: 'Download Resume',
      icon: Icons.download_rounded,
      onPressed: () async {
        const resumeUrl = 'assets/resumes/resume.pdf';
        final uri = Uri.parse(resumeUrl);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        } else {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Could not download resume')),
            );
          }
        }
      },
    );
  }

  Widget _buildSkillsSection(BuildContext context, ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Skills & Technologies',
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: const [
            SkillBadge(label: 'Dart'),
            SkillBadge(label: 'Flutter'),
            SkillBadge(label: 'REST API'),
            SkillBadge(label: 'UI/UX Design'),
            SkillBadge(label: 'MVVM Architecture'),
            SkillBadge(label: 'Clean Architecture'),
            SkillBadge(label: 'Google Maps'),
            SkillBadge(label: 'Razorpay'),
            SkillBadge(label: 'Provider'),
            SkillBadge(label: 'GetIt'),
            SkillBadge(label: 'Unit Testing'),
            SkillBadge(label: 'Firebase'),
            SkillBadge(label: 'Git/GitHub'),
            SkillBadge(label: 'GraphQL'),
          ],
        ),
      ],
    );
  }
}
