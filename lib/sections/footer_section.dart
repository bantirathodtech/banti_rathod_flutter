import 'package:flutter/material.dart';

import '../constants/theme_manager.dart';
import '../pages/privacy_policy_page.dart';
import '../pages/terms_of_use_page.dart';

class FooterSection extends StatelessWidget {
  final GlobalKey? key;

  const FooterSection({this.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      width: double.infinity, // Takes full width
      padding: const EdgeInsets.all(20),
      color: ThemeManager.darkTheme.primaryColor, // Use theme color
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '© 2025 Banti Rathod. Built with Flutter.',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: Colors.white, fontSize: 16),
            textAlign: TextAlign.center,
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PrivacyPolicyPage(),
                ),
              );
            },
            child: Text(
              'Privacy Policy',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TermsOfUsePage()),
              );
            },
            child: Text(
              'Terms of Use',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
