import 'package:flutter/material.dart';
import 'package:my_portfolio2/core/app_colors.dart';

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
    this.iconColor = AppColors.primary,
  });

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;

    // ✅ لو الكارد في النص أو عليه Hover → يتلون بلون الأيقونة
    final bool isActive = widget.isCenter || _hovered;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color:
              isActive
                  ? widget.iconColor.withOpacity(0.15) // ✨ لون الأيقونة
                  : Colors.white,
          boxShadow: [
            BoxShadow(
              color:
                  isActive ? widget.iconColor.withOpacity(0.3) : Colors.black12,
              blurRadius: isActive ? 25 : 10,
              offset: const Offset(0, 8),
            ),
          ],
          gradient:
              !isActive
                  ? LinearGradient(
                    colors: [
                      AppColors.primary.withOpacity(0.05),
                      AppColors.primary.withOpacity(0.1),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                  : null, // وقت الاختيار نخليه لون واحد أوضح
        ),
        child: IntrinsicHeight(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: widget.iconColor.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(widget.icon, color: widget.iconColor, size: 48),
              ),
              const SizedBox(height: 32),
              Text(
                widget.title,
                textAlign: TextAlign.center,
                style: t.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: Text(
                  widget.desc,
                  textAlign: TextAlign.center,
                  style: t.bodyMedium?.copyWith(
                    height: 1.5,
                    color: AppColors.textPrimary.withOpacity(0.9),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
