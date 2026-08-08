
import 'package:flutter/material.dart';
import 'package:my_portfolio2/core/app_localization.dart';

class LocationAndStatus extends StatelessWidget {
  const LocationAndStatus({
    super.key,
    required this.isMobile,
    required this.t,
    required this.fontFamily,
    required this.colorScheme,
  });

  final bool isMobile;
  final TextTheme t;
  final String fontFamily;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isMobile
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.location_on,
              size: 18,
              color: Colors.greenAccent,
            ),
            const SizedBox(width: 6),
            Flexible(
              child: Text(
                "location".tr(context),
                style: t.bodyMedium?.copyWith(
                  fontFamily: fontFamily,
                  fontSize: isMobile ? 13 : 15,
                  color: colorScheme.onPrimary,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                color: Colors.greenAccent,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 4),
            Flexible(
              child: Text(
                "availability".tr(context),
                style: t.bodyMedium?.copyWith(
                  fontFamily: fontFamily,
                  fontSize: isMobile ? 13 : 15,
                  color: colorScheme.onPrimary,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
