/* ========================= FOOTER ========================= */
import 'package:flutter/material.dart';
import 'package:my_portfolio2/core/app_colors.dart';
import 'package:my_portfolio2/utils/helpers.dart';
import 'package:my_portfolio2/core/app_locallizatin.dart';
class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final year = DateTime.now().year;
    final bgColor = Theme.of(context).colorScheme.surface; // 👈 يتغير حسب الثيم
    final iconColor = Theme.of(context).colorScheme.onSurface; // للأيقونات
    final textColor = Theme.of(context).textTheme.bodyMedium?.color;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
      width: double.infinity,
      decoration: BoxDecoration(color: bgColor),
      child: Center(
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 14,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(
              "© $year Ahmed Khames — ${"footer_text".tr(context)}",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: textColor,
                  ),
            ),
            const SizedBox(width: 4),
            IconButton(
              onPressed: () => openUrl("https://github.com/Ahmed-Khames2"),
              icon: Icon(Icons.code, color: iconColor),
            ),
            IconButton(
              onPressed: () => openUrl(
                "https://www.linkedin.com/in/ahmed-khames-738070289?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app",
              ),
              icon: Icon(Icons.business_center, color: iconColor),
            ),
            IconButton(
              onPressed: () => openUrl("mailto:ahmedkham1234567@gmail.com"),
              icon: Icon(Icons.mail_outline, color: iconColor),
            ),
          ],
        ),
      ),
    );
  }
}
