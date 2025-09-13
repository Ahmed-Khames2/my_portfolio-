/* ========================= SMALL WIDGETS ========================= */

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SectionTitle extends StatelessWidget {
  final String text;

  const SectionTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // ===== النص =====
        Text(
              text,
              style: t.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.primary,
                letterSpacing: 1.5,
                shadows: [
                  Shadow(
                    color: colorScheme.primary.withOpacity(0.4), // ديناميكي
                    blurRadius: 10,
                    offset: const Offset(2, 2),
                  ),
                ],
              ),
            )
            .animate()
            .slideX(
              begin: -0.25,
              end: 0,
              duration: 500.ms,
              curve: Curves.easeOut,
            )
            .fadeIn(duration: 500.ms),

        const SizedBox(width: 12),

        // ===== الخط الديكوري =====
        Expanded(
          child: Container(
                height: 3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      colorScheme.primary.withOpacity(0.8),
                      colorScheme.surface.withOpacity(
                        0.3,
                      ), // 👈 يتغير حسب الثيم
                    ],
                  ),
                ),
              )
              .animate(delay: 200.ms)
              .scaleX(
                begin: 0,
                end: 1,
                duration: 600.ms,
                curve: Curves.easeOut,
              ),
        ),
      ],
    );
  }
}
