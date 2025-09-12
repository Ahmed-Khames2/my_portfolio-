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

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
      width: double.infinity,
      decoration: const BoxDecoration(color: AppColors.lightTextSecondary),
      child: Center(
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 14,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(
              "© $year Ahmed Khames — ${"footer_text".tr(context)}",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(width: 4),
            IconButton(
              onPressed: () => openUrl("https://github.com/Ahmed-Khames2"),
              icon: const Icon(Icons.code),
            ),
            IconButton(
              onPressed:
                  () => openUrl(
                    "https://www.linkedin.com/in/ahmed-khames-738070289?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app",
                  ),
              icon: const Icon(Icons.business_center),
            ),
            IconButton(
              onPressed: () => openUrl("mailto:ahmedkham1234567@gmail.com"),
              icon: const Icon(Icons.mail_outline),
            ),
          ],
        ),
      ),
    );
  }
}
