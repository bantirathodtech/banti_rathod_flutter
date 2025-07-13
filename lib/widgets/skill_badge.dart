import 'package:flutter/material.dart';

class SkillBadge extends StatelessWidget {
  final String label;

  const SkillBadge({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        // color: Theme.of(context).primaryColor.withOpacity(0.1),
        color: Colors.black.withOpacity(0.1),
        // border: Border.all(color: Theme.of(context).primaryColor),
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 14,
          // color: Theme.of(context).primaryColor,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
