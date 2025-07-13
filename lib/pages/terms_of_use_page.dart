import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/theme_manager.dart';
import '../widgets/custom_button.dart';
import '../widgets/responsive_widget.dart';

class TermsOfUsePage extends StatelessWidget {
  const TermsOfUsePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms of Use'),
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
            'Terms of Use',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: ThemeManager.lightTheme.textTheme.bodyMedium!.color,
            ),
          ),
          const SizedBox(height: 20),
          _buildSectionTitle(context, 'Introduction'),
          const Text(
            'By accessing this website, you agree to be bound by these Terms of Use. If you do not agree, please do not use the website.',
            style: TextStyle(fontSize: 16, height: 1.5),
          ),
          const SizedBox(height: 20),
          _buildSectionTitle(context, 'Use of the Website'),
          const Text(
            'You agree to use the website only for lawful purposes and in a way that does not infringe the rights of others.',
            style: TextStyle(fontSize: 16, height: 1.5),
          ),
          const SizedBox(height: 20),
          _buildSectionTitle(context, 'Content'),
          const Text(
            'All content on this website, including text, images, and code, is the property of Banti Rathod unless otherwise stated. You may not reproduce or distribute content without permission.',
            style: TextStyle(fontSize: 16, height: 1.5),
          ),
          const SizedBox(height: 20),
          _buildSectionTitle(context, 'Limitation of Liability'),
          const Text(
            'The website is provided "as is" without any warranties. Banti Rathod is not liable for any damages arising from the use of this website.',
            style: TextStyle(fontSize: 16, height: 1.5),
          ),
          const SizedBox(height: 20),
          _buildSectionTitle(context, 'Contact Us'),
          const Text(
            'If you have any questions about these Terms of Use, please contact us at bantirathodtech@gmail.com.',
            style: TextStyle(fontSize: 16, height: 1.5),
          ),
          const SizedBox(height: 40),
          Center(
            child: CustomButton(
              label: 'Download Terms of Use PDF',
              icon: Icons.download_rounded,
              onPressed: () async {
                const pdfUrl = 'assets/documents/terms_of_use.pdf';
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
