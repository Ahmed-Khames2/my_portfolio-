/* ========================= CONTACT ========================= */
import 'package:flutter/material.dart';
import 'package:my_portfolio2/core/app_colors.dart';
import 'package:my_portfolio2/pages/PdfViewerPage.dart';
import 'package:my_portfolio2/utils/helpers.dart';
import 'package:my_portfolio2/widgets/custom_input.dart';
import 'package:my_portfolio2/core/app_locallizatin.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle("contact_cta".tr(context)),
        const SizedBox(height: 12),
        Text("lets_build".tr(context), style: t.headlineMedium),
        const SizedBox(height: 10),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            ElevatedButton.icon(
              onPressed: () => openUrl("mailto:your@email.com"),
              icon: const Icon(Icons.mail_outline),
              label: Text("email_me".tr(context)),
            ),
            OutlinedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        const PdfViewerPage(assetPath: 'assets/cv/my_cv.pdf'),
                  ),
                );
              },
              icon: const Icon(Icons.download),
              label: Text("view_cv".tr(context)),
            ),
            OutlinedButton.icon(
              onPressed: () => openUrl("https://wa.me/201234567890"),
              icon: const Icon(Icons.chat_outlined),
              label: Text("whatsapp".tr(context)),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Container(
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.divider),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Input(hint: "your_name".tr(context)),
              const SizedBox(height: 10),
              Input(hint: "your_email".tr(context)),
              const SizedBox(height: 10),
              Input(hint: "your_message".tr(context), maxLines: 5),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("send_message".tr(context)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
