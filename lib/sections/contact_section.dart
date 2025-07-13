import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/custom_button.dart';

class ContactSection extends StatelessWidget {
  final GlobalKey? key;

  const ContactSection({this.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Connect With Me',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          const Text(
            'Professional Networks',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: [
              SocialIcon(
                icon: FontAwesomeIcons.envelope,
                label: 'Email',
                url: 'mailto:bantirathodtech@gmail.com',
                color: Colors.grey,
              ),
              SocialIcon(
                icon: FontAwesomeIcons.github,
                label: 'GitHub',
                url: 'https://github.com/bantirathodtech',
                color: const Color(0xFF333333),
              ),
              SocialIcon(
                icon: FontAwesomeIcons.appStore,
                label: 'App Store',
                url: 'https://youtube.com/@bantirathodtech',
                color: const Color(0xFF000000),
              ),
              SocialIcon(
                icon: FontAwesomeIcons.googlePlay,
                label: 'Google Play',
                url: 'https://youtube.com/@bantirathodtech',
                color: const Color(0xFF3DDC84),
              ),
              SocialIcon(
                icon: FontAwesomeIcons.linkedin,
                label: 'LinkedIn',
                url: 'https://www.linkedin.com/in/bantirathodtech/',
                color: Colors.blue,
              ),
              SocialIcon(
                icon: FontAwesomeIcons.flutter,
                label: 'Pub.dev',
                url: 'https://www.linkedin.com/in/bantirathodtech/',
                color: Colors.blue,
              ),
              SocialIcon(
                icon: FontAwesomeIcons.whatsapp,
                label: 'WhatsApp Channel',
                url: 'https://whatsapp.com/channel/0029Vb5X6xxDp2Q00PC8mY0Q',
                color: const Color(0xFF25D366),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            'Personal Connections',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: [
              SocialIcon(
                icon: FontAwesomeIcons.youtube,
                label: 'YouTube',
                url: 'https://youtube.com/@bantirathodtech',
                color: const Color(0xFFED302F),
              ),
              SocialIcon(
                icon: FontAwesomeIcons.whatsapp,
                label: 'WhatsApp',
                url: 'https://wa.me/7997911432',
                color: const Color(0xFF25D366),
              ),
              SocialIcon(
                icon: FontAwesomeIcons.instagram,
                label: 'Instagram',
                url: 'https://instagram.com/bantirathodtech',
                color: const Color(0xFFAC2BAC),
              ),
              SocialIcon(
                icon: FontAwesomeIcons.telegram,
                label: 'Telegram',
                url: 'https://youtube.com/@bantirathodtech',
                color: const Color(0xFF0088cc),
              ),
              SocialIcon(
                icon: FontAwesomeIcons.xTwitter,
                label: 'X',
                url: 'https://x.com/bantirathodtech',
                color: const Color(0xFF000000),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const ContactForm(),
          const SizedBox(height: 20),
          CustomButton(
            label: 'Hire Me',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Hire Me button clicked!')),
              );
            },
          ),
        ],
      ),
    );
  }
}

class SocialIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final String url;
  final Color color;

  const SocialIcon({
    super.key,
    required this.icon,
    required this.label,
    required this.url,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (await canLaunchUrl(Uri.parse(url))) {
          await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
        }
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FaIcon(icon, color: color, size: 24),
            const SizedBox(width: 8),
            Text(label, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  bool _isSubmitting = false;
  String? _errorMessage;

  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _submitForm() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isSubmitting = true;
        _errorMessage = null;
      });

      // Save form data to shared preferences (simulating backend storage)
      final prefs = await SharedPreferences.getInstance();
      final submissions = prefs.getStringList('contact_submissions') ?? [];
      submissions.add(
        'Name: ${_nameController.text}, Email: ${_emailController.text}, Message: ${_messageController.text}, Time: ${DateTime.now().toIso8601String()}',
      );
      await prefs.setStringList('contact_submissions', submissions);

      await Future.delayed(const Duration(seconds: 1));
      setState(() {
        _isSubmitting = false;
        _errorMessage = null;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Message sent successfully! Check shared preferences for data.',
            ),
          ),
        );
        _nameController.clear();
        _emailController.clear();
        _messageController.clear();
      });
    } else {
      setState(() {
        _errorMessage = 'Please fix the errors above.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        hintText: 'Enter your name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.blue,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      validator: (value) => value?.isEmpty ?? true
                          ? 'Please enter your name'
                          : null,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter your email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.blue,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      validator: (value) =>
                          !RegExp(
                            r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$',
                          ).hasMatch(value ?? '')
                          ? 'Please enter a valid email'
                          : null,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _messageController,
                decoration: InputDecoration(
                  labelText: 'Message',
                  hintText: 'Enter your message',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                maxLines: 4,
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Please enter a message' : null,
              ),
              if (_errorMessage != null) ...[
                const SizedBox(height: 10),
                Text(
                  _errorMessage!,
                  style: const TextStyle(color: Colors.red, fontSize: 14),
                ),
              ],
              const SizedBox(height: 15),
              CustomButton(
                label: _isSubmitting ? 'Submitting...' : 'Submit',
                onPressed: _isSubmitting ? null : _submitForm,
                isLoading: _isSubmitting,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
