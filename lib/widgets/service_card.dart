import 'package:flutter/material.dart';

class ServiceCard extends StatefulWidget {
  final String title, desc;
  final IconData icon;
  final bool isCenter;
  final Color iconColor;

  const ServiceCard({
    super.key,
    required this.title,
    required this.desc,
    required this.icon,
    this.isCenter = false,
    required this.iconColor,
  });

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final isDark = theme.brightness == Brightness.dark;
    final isActive = widget.isCenter || _hovered;

    double cardWidth =
        size.width < 600
            ? size.width * 0.85
            : size.width < 1200
            ? size.width * 0.45
            : 380;

    final backgroundGradient =
        isActive
            ? [
              widget.iconColor.withValues(alpha: 0.3),
              widget.iconColor.withValues(alpha: 0.1),
            ]
            : isDark
            ? [colorScheme.surfaceContainerHighest, colorScheme.surface]
            : [
              colorScheme.surface,
              colorScheme.surfaceContainerHighest.withValues(alpha: 0.4),
            ];

    final textColor = colorScheme.onSurface;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        width: cardWidth,
        constraints: const BoxConstraints(minHeight: 260, maxHeight: 380),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: backgroundGradient,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: isActive ? 30 : 15,
              offset: Offset(0, isActive ? 15 : 8),
            ),
            BoxShadow(
              color: Colors.black12,
              blurRadius: isActive ? 20 : 8,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // أيقونة الكارد مع تأثير Glow
            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    widget.iconColor.withValues(alpha: 0.6),
                    widget.iconColor.withValues(alpha: 0.2),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: widget.iconColor.withValues(alpha: 0.4),
                    blurRadius: 12,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Icon(widget.icon, color: Colors.white, size: 52),
            ),
            const Spacer(),
            // العنوان
            Text(
              widget.title,
              textAlign: TextAlign.center,
              style: textTheme.titleMedium?.copyWith(
                fontSize:
                    isActive
                        ? (size.width < 600 ? 18 : 22)
                        : (size.width < 600 ? 16 : 20),
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            const SizedBox(height: 12),
            // الوصف Scrollable
            SizedBox(
              height: isActive ? 120 : 100,
              child: SingleChildScrollView(
                child: Text(
                  widget.desc,
                  textAlign: TextAlign.center,
                  style: textTheme.bodyMedium?.copyWith(
                    fontSize: isActive ? 15 : 13,
                    color: textColor.withValues(alpha: 0.9),
                    height: 1.4,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
