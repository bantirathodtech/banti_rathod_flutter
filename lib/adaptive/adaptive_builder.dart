import 'package:flutter/material.dart';

import 'size_config.dart';

class AdaptiveBuilder extends StatelessWidget {
  final Widget Function(BuildContext context) builder;

  const AdaptiveBuilder({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return builder(context);
  }
}
