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
    final isActive = widget.isCenter || _hovered;

    double cardWidth =
        size.width < 600
            ? size.width * 0.85
            : size.width < 1200
            ? size.width * 0.45
            : 380;

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
            colors:
                isActive
                    ? [
                      widget.iconColor.withOpacity(0.3),
                      widget.iconColor.withOpacity(0.1),
                    ]
                    : [Colors.grey.shade50, Colors.grey.shade100],
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
                    widget.iconColor.withOpacity(0.6),
                    widget.iconColor.withOpacity(0.2),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: widget.iconColor.withOpacity(0.4),
                    blurRadius: 12,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Icon(widget.icon, color: Colors.white, size: 52),
            ),
            // const SizedBox(height: 18),
            Spacer(),
            // العنوان
            Text(
              widget.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize:
                    isActive
                        ? (size.width < 600 ? 18 : 22)
                        : (size.width < 600 ? 16 : 20),
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
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
                  style: TextStyle(
                    fontSize: isActive ? 15 : 13,
                    color: AppColors.textPrimary.withOpacity(0.9),
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
