// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:ui_web' as ui;
import 'package:flutter/material.dart';

/// Registers and renders an iframe for web platform
class AppetizeEmbed extends StatefulWidget {
  final String url;
  const AppetizeEmbed({super.key, required this.url});

  @override
  State<AppetizeEmbed> createState() => _AppetizeEmbedState();
}

class _AppetizeEmbedState extends State<AppetizeEmbed> {
  late final String _viewId;

  @override
  void initState() {
    super.initState();
    _viewId = 'demo-iframe-${widget.url.hashCode}';

    // Register the iframe element with the given URL
    ui.platformViewRegistry.registerViewFactory(_viewId, (int viewId) {
      final iframe = html.IFrameElement()
        ..src = widget.url
        ..style.border = 'none'
        ..style.width = '100%'
        ..style.height = '100%'
        ..allow = 'fullscreen; camera; microphone'
        ..setAttribute('allowfullscreen', 'true')
        ..setAttribute('frameborder', '0');
      return iframe;
    });
  }

  @override
  Widget build(BuildContext context) {
    return HtmlElementView(viewType: _viewId);
  }
}
