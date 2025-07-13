import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/custom_button.dart';
import '../widgets/skill_badge.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About Me',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "I’m a passionate and detail-oriented Mobile App Developer with 3 years of experience in building scalable and intuitive Flutter applications. I specialize in crafting clean, maintainable code using MVVM and Clean Architecture, with strong skills in REST API integration, Firebase services, Google Maps, and state management using Provider.\n\n"
            "My portfolio includes impactful projects such as:\n\n"
            "• APTDC Tourism App – Real-time passenger tracking using RFID for Andhra Pradesh tourism services.\n"
            "• Construction Dispatch App – A 3-stage QR-based system for managing vehicle material dispatch and secure exits.\n"
            "• Qicken FoodCourt App – Multi-stall food ordering with live menu updates and shared table delivery.\n"
            "• Amewkart – Affiliate e-commerce app featuring curated Amazon/Flipkart products with influencer recommendations.\n\n"
            "I bring a strong command of Git/GitHub, a commitment to continuous learning, and a drive to contribute to innovative, user-focused solutions.\n\n"
            "Let’s connect and build something impactful together!",
            style: TextStyle(fontSize: 16, height: 1.5),
          ),
          const SizedBox(height: 20),
          Center(
            child: CustomButton(
              label: 'Download Resume',
              icon: Icons.download_rounded,
              onPressed: () async {
                const resumeUrl = 'assets/resumes/resume.pdf';
                final uri = Uri.parse(resumeUrl);
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Could not download resume')),
                  );
                }
              },
            ),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: const [
              SkillBadge(label: 'Dart'),
              SkillBadge(label: 'REST API Integration'),
              SkillBadge(label: 'UI/UX Design'),
              SkillBadge(label: 'MVVM Architecture'),
              SkillBadge(label: 'Clean Architecture'),
              SkillBadge(label: 'Google Maps Integration'),
              SkillBadge(label: 'Razorpay Payment Integration'),
              SkillBadge(label: 'Provider State Management'),
              SkillBadge(label: 'GetIt Dependency Injection'),
              SkillBadge(label: 'Unit Testing'),
              SkillBadge(label: 'Pub.dev Package Management'),
              SkillBadge(label: 'Adaptive & Responsive Design'),
              SkillBadge(label: 'MVVM with Clean Architecture'),
              SkillBadge(label: 'Firebase Integration'),
              SkillBadge(label: 'Git Version Control'),
              SkillBadge(label: 'GraphQL Integration'),
            ],
          ),
        ],
      ),
    );
  }
}
