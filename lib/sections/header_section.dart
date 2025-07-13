import 'package:flutter/material.dart';

class HeaderSection extends StatefulWidget {
  const HeaderSection({super.key});

  @override
  State<HeaderSection> createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _opacity = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColor.withOpacity(0.1),
            Theme.of(context).scaffoldBackgroundColor,
          ],
        ),
      ),
      child: Center(
        child: FadeTransition(
          opacity: _opacity,
          child: Column(
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: const AssetImage('assets/profile.png'),
                backgroundColor: Theme.of(context).cardColor,
              ),
              const SizedBox(height: 20),
              Text(
                'Banti Rathod',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.bodyMedium!.color,
                ),
              ),
              Text(
                'Flutter Developer | UI/UX Dev | Frontend | Mobile Apps | API Integration',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
