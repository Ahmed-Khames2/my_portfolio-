import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> goTo(GlobalKey key) async {
  final ctx = key.currentContext;
  if (ctx == null) return;
  await Scrollable.ensureVisible(
    ctx,
    duration: 600.ms,
    curve: Curves.easeInOut,
  );
}

/* ========================= HELPERS ========================= */
Future<void> openUrl(String url) async {
  final uri = Uri.parse(url);
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    throw Exception("Could not launch $url");
  }
}