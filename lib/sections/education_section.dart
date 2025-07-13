//filename: education_section.dart
import 'package:flutter/material.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Education',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          const EducationItem(
            degree: 'Bachelor of Engineering in Computer Science',
            institution: 'University of Nagpur',
            duration: '2019 - 2022',
            grade: '7.7/10',
          ),
          const EducationItem(
            degree: 'Diploma of Engineering in Computer Science',
            institution:
                'MSBTE (Maharashtra State Board of Technical Education)',
            duration: '2015 - 2019',
            grade: '67/100',
          ),
        ],
      ),
    );
  }
}

class EducationItem extends StatelessWidget {
  final String degree;
  final String institution;
  final String duration;
  final String grade;

  const EducationItem({
    super.key,
    required this.degree,
    required this.institution,
    required this.duration,
    required this.grade,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            degree,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            '$institution | $duration | CGPA/percentage: $grade',
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
