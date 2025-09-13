import 'package:flutter/material.dart';
import 'package:my_portfolio2/core/app_colors.dart';

/* ========================= BADGE WIDGET ========================= */
class Badge extends StatelessWidget {
  final String text;
  const Badge({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: colorScheme.surface, // بدل AppColors.lightTextSecondary
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: colorScheme.onSurface.withOpacity(0.2)),
      ),
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: colorScheme.onSurface),
      ),
    );
  }
}
