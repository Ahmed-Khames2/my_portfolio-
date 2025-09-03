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
      decoration: const BoxDecoration(color: AppColors.surface),
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
              onPressed: () => openUrl("https://github.com/your"),
              icon: const Icon(Icons.code),
            ),
            IconButton(
              onPressed: () => openUrl("https://linkedin.com/in/your"),
              icon: const Icon(Icons.business_center),
            ),
            IconButton(
              onPressed: () => openUrl("mailto:your@email.com"),
              icon: const Icon(Icons.mail_outline),
            ),
          ],
        ),
      ),
    );
  }
}
