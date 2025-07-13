import 'package:flutter/material.dart';

class WorkExperienceSection extends StatelessWidget {
  final GlobalKey? key;

  const WorkExperienceSection({this.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      padding: const EdgeInsets.all(40),
      color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.9),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Work Experience',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.bodyMedium!.color,
            ),
          ),
          const SizedBox(height: 20),
          const ExperienceItem(
            company: 'Suvidha Software Solutions Pvt Ltd',
            location: 'Hyderabad, India',
            duration: 'Jul 2025 - Present',
            description:
                'Developed cross-platform mobile apps using Flutter for Android & iOS. Focused on UI/UX, API integration, state management (Provider), performance optimization, and scalable app architecture. Collaborated with backend teams, handled play store deployments, and followed clean MVVM design.',
          ),
          const SizedBox(height: 10),
          const ExperienceItem(
            company: 'Exceloid Soft Systems Pvt Ltd',
            location: 'Hyderabad, India',
            duration: 'Dec 2023 - May 2025',
            description:
                'Proficient Flutter Application Developer with 1.5 year of IT experience in designing and delivering high-quality, scalable mobile applications. Adept at creating seamless user experiences through intuitive UI design, API integration, and optimized performance. Skilled in managing complete software development lifecycles, ensuring maintainable codebases, and implementing best practices for mobile development.',
          ),
        ],
      ),
    );
  }
}

class ExperienceItem extends StatelessWidget {
  final String company;
  final String location;
  final String duration;
  final String description;

  const ExperienceItem({
    super.key,
    required this.company,
    required this.location,
    required this.duration,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            company,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.bodyMedium!.color,
            ),
          ),
          Text(
            '$location | $duration',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 5),
          Text(
            description,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
