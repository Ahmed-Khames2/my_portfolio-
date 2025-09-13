import 'package:flutter/material.dart';
import 'package:my_portfolio2/core/app_colors.dart';
class EducationCardAnimated extends StatefulWidget {
  final String title, subtitle, details;
  final String iconImage;

  const EducationCardAnimated({
    super.key,
    required this.title,
    required this.subtitle,
    required this.details,
    required this.iconImage,
  });

  @override
  State<EducationCardAnimated> createState() => _EducationCardAnimatedState();
}

class _EducationCardAnimatedState extends State<EducationCardAnimated> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 360,
        height: 300,
        margin: const EdgeInsets.all(12),
        transform: _hovering
            ? (Matrix4.identity()..translate(0, -8)..scale(1.03))
            : Matrix4.identity(),
        decoration: BoxDecoration(
          color: colorScheme.surface, // بدل AppColors.lightTextSecondary
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
              color: colorScheme.onSurface.withOpacity(0.1), width: 1.5),
          boxShadow: [
            BoxShadow(
              color: _hovering
                  ? colorScheme.primary.withOpacity(0.4)
                  : Colors.black12,
              blurRadius: _hovering ? 20 : 10,
              spreadRadius: _hovering ? 2 : 0,
              offset: Offset(0, _hovering ? 12 : 6),
            ),
          ],
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(24),
              ),
              child: Image.asset(
                widget.iconImage,
                height: 180,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: t.titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold, color: colorScheme.onSurface),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.subtitle,
                    style: t.bodyMedium
                        ?.copyWith(color: colorScheme.onSurface.withOpacity(0.7)),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    widget.details,
                    style: t.bodySmall
                        ?.copyWith(color: colorScheme.onSurface.withOpacity(0.7)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
