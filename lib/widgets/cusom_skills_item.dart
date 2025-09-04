/* ========================= SKILL CARD ========================= */
import 'package:flutter/material.dart';
import 'package:my_portfolio2/core/app_colors.dart';

class SkillCard extends StatelessWidget {
  final String name;
  final double level;
  final IconData icon;
  final Color bgColor;

  const SkillCard({
    super.key,
    required this.name,
    required this.level,
    required this.icon,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 600;

    return Container(
      width: isMobile ? double.infinity : 250,
      margin: EdgeInsets.symmetric(vertical: isMobile ? 8 : 12),
      padding: EdgeInsets.all(isMobile ? 12 : 16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: bgColor.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Stack(
        children: [
          // أيقونة كبيرة كخلفية شفافة
          Positioned(
            right: -10,
            bottom: -10,
            child: Icon(
              icon,
              size: isMobile ? 60 : 100,
              color: bgColor.withOpacity(0.1),
            ),
          ),

          // المحتوى الأساسي
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: bgColor, size: isMobile ? 24 : 32),
              const SizedBox(height: 12),
              Text(
                name,
                style: t.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: isMobile ? 14 : 16,
                ),
              ),
              const SizedBox(height: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: level,
                  minHeight: isMobile ? 8 : 10,
                  backgroundColor: AppColors.divider,
                  color: bgColor,
                ),
              ),
              const SizedBox(height: 26),
              // Text(
              //   "${(level * 100).toInt()}%",
              //   style: t.bodySmall?.copyWith(color: Colors.grey[600]),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
