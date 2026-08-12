import 'package:flutter/material.dart';

/// Stub for non-web platforms — shows a launch button instead
class AppetizeEmbed extends StatelessWidget {
  final String url;
  const AppetizeEmbed({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Live demo is only available on web.'),
    );
  }
}
