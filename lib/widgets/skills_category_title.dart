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
    final isMobile = MediaQuery.of(context).size.width < 400;

    return ShaderMask(
      shaderCallback:
          (bounds) => gradient.createShader(
            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
          ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: isMobile ? 24 : 32, color: Colors.white),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: t.titleLarge?.copyWith(
                fontSize: isMobile ? 16 : 20,
                fontWeight: FontWeight.bold,
                color: Colors.white, // ShaderMask محتاج لون أبيض
              ),
            ),
          ),
        ],
      ),
    );
  }
}
