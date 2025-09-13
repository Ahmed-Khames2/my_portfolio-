import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:my_portfolio2/utils/helpers.dart';

class CTA_Buttons extends StatelessWidget {
  const CTA_Buttons({
    super.key,
    required this.isMobile,
    required this.contactKey,
    required this.locale,
    required this.fontFamily,
    required this.colorScheme,
  });

  final bool isMobile;
  final GlobalKey<State<StatefulWidget>> contactKey;
  final String locale;
  final String fontFamily;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isMobile ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        ElevatedButton.icon(
              onPressed: () => goTo(contactKey),
              icon: const Icon(Icons.mail, color: Colors.white, size: 18),
              label: Text(
                locale == "ar" ? "تواصل معي" : "Contact Me",
                style: TextStyle(
                  fontFamily: fontFamily,
                  fontSize: isMobile ? 14 : 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 20 : 28,
                  vertical: isMobile ? 12 : 16,
                ),
                backgroundColor: colorScheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 8,
                shadowColor: colorScheme.primary.withOpacity(.5),
              ),
            )
            .animate()
            .fadeIn(duration: 700.ms)
            .scale(begin: const Offset(.9, .9))
            .shakeX(duration: 1200.ms, hz: 3, amount: 3),
        const SizedBox(width: 12),
        OutlinedButton.icon(
          onPressed: () => goTo(contactKey),

          icon: const Icon(
            Icons.download,
            size: 18,
            // color: Colors.white,
          ),
          label: Text(
            locale == "ar" ? "حمّل CV" : "Download CV",
            style: TextStyle(
              fontFamily: fontFamily,
              fontSize: isMobile ? 14 : 16,
              fontWeight: FontWeight.w600,
              // color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
