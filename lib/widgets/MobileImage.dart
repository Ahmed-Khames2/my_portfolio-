import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class MobileImage extends StatelessWidget {
  const MobileImage({
    super.key,
    required this.isMobile,
    required this.isTablet,
  });

  final bool isMobile;
  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final double phoneWidth = isMobile ? 150 : (isTablet ? 200 : 240);
    final double phoneHeight = isMobile ? 280 : (isTablet ? 360 : 460);

    return Expanded(
      flex: isMobile ? 0 : 1,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: phoneHeight,
            child: Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    // ===== Phone Frame =====
                    Container(
                      width: phoneWidth,
                      height: phoneHeight,
                      decoration: BoxDecoration(
                        color: colorScheme.surface,
                        borderRadius: BorderRadius.circular(36),
                        border: Border.all(
                          color: colorScheme.primary,
                          width: 3,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            blurRadius: 30,
                            offset: const Offset(0, 12),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(28),
                        child: Container(
                          color: colorScheme.background,
                          child: Center(
                            child: Icon(
                              Icons.flutter_dash,
                              size: isMobile ? 70 : (isTablet ? 100 : 130),
                              color: colorScheme.primary,
                            ),
                          ),
                        ),
                      ),
                    ),

                    // ===== Notch (extra detail) =====
                    Positioned(
                      top: 8,
                      child: Container(
                        width: 60,
                        height: 8,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ],
                )
                // 👇 الأنيميشن على الـ Stack كله
                .animate(onPlay: (c) => c.repeat(period: 20.seconds))
                .shake(duration: 2.seconds, hz: 2, curve: Curves.easeInOut)
                .then(delay: 60.seconds),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
