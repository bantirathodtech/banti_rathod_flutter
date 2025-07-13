import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/theme_manager.dart';
import '../widgets/custom_button.dart';
import '../widgets/responsive_widget.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        elevation: 4,
      ),
      body: ResponsiveWidget(
        mobile: _buildContent(context),
        tablet: Center(
          child: Container(
            width: double.infinity,
            constraints: const BoxConstraints(maxWidth: 1200),
            child: _buildContent(context),
          ),
        ),
        desktop: Center(
          child: Container(
            width: double.infinity,
            constraints: const BoxConstraints(maxWidth: 1200),
            child: _buildContent(context),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Privacy Policy',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: ThemeManager.lightTheme.textTheme.bodyMedium!.color,
            ),
          ),
          const SizedBox(height: 20),
          _buildSectionTitle(context, 'Introduction'),
          const Text(
            'This Privacy Policy outlines how Banti Rathod collects, uses, and protects any information you provide when using this website. We are committed to ensuring that your privacy is protected.',
            style: TextStyle(fontSize: 16, height: 1.5),
          ),
          const SizedBox(height: 20),
          _buildSectionTitle(context, 'Information We Collect'),
          const Text(
            'We may collect the following information:\n'
            '• Name and contact details (e.g., email address) provided through the contact form.\n'
            '• Usage data, such as pages visited and interactions, if analytics are enabled.',
            style: TextStyle(fontSize: 16, height: 1.5),
          ),
          const SizedBox(height: 20),
          _buildSectionTitle(context, 'How We Use Your Information'),
          const Text(
            'Your information is used to:\n'
            '• Respond to inquiries submitted via the contact form.\n'
            '• Improve the website\'s functionality and user experience.',
            style: TextStyle(fontSize: 16, height: 1.5),
          ),
          const SizedBox(height: 20),
          _buildSectionTitle(context, 'Security'),
          const Text(
            'We are committed to ensuring that your information is secure. We use reasonable technical and organizational measures to protect your data from unauthorized access.',
            style: TextStyle(fontSize: 16, height: 1.5),
          ),
          const SizedBox(height: 20),
          _buildSectionTitle(context, 'Sharing Your Information'),
          const Text(
            'We do not share your personal information with third parties except as required by law or with your explicit consent.',
            style: TextStyle(fontSize: 16, height: 1.5),
          ),
          const SizedBox(height: 20),
          _buildSectionTitle(context, 'Contact Us'),
          const Text(
            'If you have any questions about this Privacy Policy, please contact us at bantirathodtech@gmail.com.',
            style: TextStyle(fontSize: 16, height: 1.5),
          ),
          const SizedBox(height: 40),

          Center(
            child: CustomButton(
              label: 'Download Privacy Policy PDF',
              icon: Icons.download_rounded,
              onPressed: () async {
                const pdfUrl = 'assets/documents/privacy_policy.pdf';
                final uri = Uri.parse(pdfUrl);
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Could not download PDF')),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.bold,
        color: ThemeManager.lightTheme.textTheme.bodyMedium!.color,
      ),
    );
  }
}
