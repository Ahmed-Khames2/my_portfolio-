import 'package:flutter/material.dart';
import 'package:my_portfolio2/pages/pdf_viewer_page.dart';
import 'package:my_portfolio2/utils/helpers.dart';
import 'package:my_portfolio2/core/app_localization.dart';
import 'package:my_portfolio2/widgets/section_title.dart';
import 'package:my_portfolio2/widgets/form_contact.dart';
import 'package:my_portfolio2/core/app_colors.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle("contact_cta".tr(context)),
          const SizedBox(height: 12),
          Text(
            "lets_build".tr(context),
            style: t.headlineMedium?.copyWith(
              color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              ElevatedButton.icon(
                onPressed: () => openUrl("mailto:ahmedkham1234567@gmail.com"),
                icon: const Icon(Icons.mail_outline),
                label: Text("email_me".tr(context)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: isDark ? AppColors.darkPrimary : AppColors.lightPrimary,
                  foregroundColor: Colors.white,
                ),
              ),
              OutlinedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const PdfViewerPage(
                        assetPath: 'assets/CV_Ahmed_Khames.pdf',
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.download),
                label: Text("view_cv".tr(context)),
                style: OutlinedButton.styleFrom(
                  foregroundColor: isDark ? Colors.white70 : Colors.black87,
                  side: BorderSide(
                    color: isDark ? Colors.white24 : Colors.black26,
                  ),
                ),
              ),
              OutlinedButton.icon(
                onPressed: () => openUrl("https://wa.me/201276898296"),
                icon: const Icon(Icons.chat_outlined),
                label: Text("whatsapp".tr(context)),
                style: OutlinedButton.styleFrom(
                  foregroundColor: isDark ? Colors.white70 : Colors.black87,
                  side: BorderSide(
                    color: isDark ? Colors.white24 : Colors.black26,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          // FormContact نفسه يدعم Dark/Light عن طريق AppColors اللي عدّلناهم
          FormContact(),
        ],
      ),
    );
  }
}
