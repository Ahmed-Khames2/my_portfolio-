import 'package:flutter/material.dart';

class SkillCategoryTitle extends StatelessWidget {
  final String title;
  final IconData icon;
  final Gradient gradient;

  const SkillCategoryTitle({
    super.key,
    required this.title,
    required this.icon,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;

    return Row(
      children: [
        ShaderMask(
          shaderCallback:
              (bounds) => gradient.createShader(
                Rect.fromLTWH(0, 0, bounds.width, bounds.height),
              ),
          child: Icon(icon, size: 36, color: Colors.white),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              // Container(
              //   height: 2,
              //   margin: const EdgeInsets.only(left: 8),
              //   decoration: BoxDecoration(
              //     gradient: gradient,
              //     borderRadius: BorderRadius.circular(2),
              //   ),
              // ),
              Text(
                title,
                style: t.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  foreground:
                      Paint()
                        ..shader = gradient.createShader(
                          const Rect.fromLTWH(0, 0, 200, 70),
                        ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
