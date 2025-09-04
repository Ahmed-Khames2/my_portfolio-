import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio2/core/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> goTo(GlobalKey key) async {
  final ctx = key.currentContext;
  if (ctx == null) return;
  await Scrollable.ensureVisible(
    ctx,
    duration: 600.ms,
    curve: Curves.easeInOut,
  );
}

/* ========================= HELPERS ========================= */
Future<void> openUrl(String url) async {
  final uri = Uri.parse(url);
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {}
}

/* ========================= SMALL WIDGETS ========================= */

class SectionTitle extends StatelessWidget {
  final String text;
  const SectionTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;

    return Row(
      children: [
        // النص
        Text(
              text,
              style: t.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
                letterSpacing: 1.2,
                shadows: [
                  Shadow(
                    color: AppColors.primary.withOpacity(0.4),
                    blurRadius: 8,
                    offset: const Offset(2, 2),
                  ),
                ],
              ),
            )
            .animate()
            .slideX(
              begin: -0.2,
              end: 0,
              duration: 500.ms,
              curve: Curves.easeOut,
            )
            .fadeIn(duration: 500.ms),

        const SizedBox(width: 12),

        // الخط الديكوري
        Expanded(
          child: Container(
                height: 3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    colors: [
                      AppColors.textPrimary.withOpacity(0.9),
                      AppColors.textPrimary.withOpacity(0.1),
                    ],
                  ),
                ),
              )
              .animate(delay: 250.ms) // staggered delay
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

class FancyIconButton extends StatefulWidget {
  final IconData? iconData;
  final IconData? icon;
  final String url;
  final Color baseColor;
  final String tooltip;

  const FancyIconButton({
    super.key,
    this.iconData,
    this.icon,
    required this.url,
    required this.baseColor,
    required this.tooltip,
  });

  @override
  State<FancyIconButton> createState() => _FancyIconButtonState();
}

class _FancyIconButtonState extends State<FancyIconButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        transform: Matrix4.identity()..scale(isHovered ? 1.1 : 1.0),
        decoration: BoxDecoration(
          color:
              isHovered
                  ? widget.baseColor.withOpacity(0.9)
                  : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          boxShadow:
              isHovered
                  ? [
                    BoxShadow(
                      color: widget.baseColor.withOpacity(0.4),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ]
                  : [],
          border: Border.all(color: widget.baseColor, width: 2),
        ),
        child: IconButton(
          onPressed: () => openUrl(widget.url),
          tooltip: widget.tooltip,
          iconSize: 28,
          icon:
              widget.iconData != null
                  ? FaIcon(
                    widget.iconData,
                    color: isHovered ? Colors.white : widget.baseColor,
                  )
                  : Icon(
                    widget.icon,
                    color: isHovered ? Colors.white : widget.baseColor,
                  ),
        ),
      ),
    );
  }
}
