import 'package:flutter/material.dart';
import 'package:my_portfolio2/pages/pdf_viewer_page.dart';
import 'package:my_portfolio2/utils/helpers.dart';
import 'package:my_portfolio2/core/app_localization.dart';
import 'package:my_portfolio2/widgets/section_title.dart';
import 'package:my_portfolio2/widgets/form_contact.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle("contact_cta".tr(context)),
          const SizedBox(height: 12),
          Text(
            "lets_build".tr(context),
            style: t.headlineMedium,
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              ElevatedButton.icon(
                onPressed: () => openUrl("mailto:ahmedkham1234567@gmail.com"),
                icon: const Icon(Icons.mail_outline),
                label: Text("email_me".tr(context)),
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
                icon: const Icon(Icons.download_rounded),
                label: Text("view_cv".tr(context)),
              ),
              OutlinedButton.icon(
                onPressed: () => openUrl("https://wa.me/201276898296"),
                icon: const Icon(Icons.chat_outlined),
                label: Text("whatsapp".tr(context)),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const FormContact(),
        ],
      ),
    );
  }
}

