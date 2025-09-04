// experience_section.dart
import 'package:flutter/material.dart';
import 'package:my_portfolio2/core/app_colors.dart';
import 'package:my_portfolio2/core/app_locallizatin.dart';
import 'package:my_portfolio2/utils/helpers.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SectionTitle("experience_title".tr(context)),
        const SizedBox(height: 18),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 12 : 20,
            vertical: isMobile ? 12 : 20,
          ),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: AppColors.divider),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 14,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            children: [
              ExperienceRow(
                accentColor: Colors.blue,
                imagePath: 'assets/images/ot.jpeg',
                title: "outlier_title".tr(context),
                period: "outlier_period".tr(context),
                description: "outlier_desc".tr(context),
                techs: [
                  "outlier_tech1".tr(context),
                  "outlier_tech2".tr(context),
                  "outlier_tech3".tr(context),
                ],
                githubUrl: null,
                demoUrl: null,
              ),
              const SizedBox(height: 12),
              Divider(color: AppColors.divider),
              const SizedBox(height: 12),
              ExperienceRow(
                accentColor: Colors.white,
                imagePath: 'assets/images/DEPI.jpg',
                title: "depi_title".tr(context),
                period: "depi_period".tr(context),
                description: "depi_desc".tr(context),
                techs: [
                  "depi_tech1".tr(context),
                  "depi_tech2".tr(context),
                  "depi_tech3".tr(context),
                  "depi_tech4".tr(context),
                ],
                githubUrl: null,
                demoUrl: null,
              ),
              const SizedBox(height: 12),
              Divider(color: AppColors.divider),
              const SizedBox(height: 12),
              ExperienceRow(
                accentColor: AppColors.primary,
                imagePath: 'assets/images/cp.png',
                title: "os_title".tr(context),
                period: "os_period".tr(context),
                description: "os_desc".tr(context),
                techs: [
                  "os_tech1".tr(context),
                  "os_tech2".tr(context),
                  "os_tech3".tr(context),
                ],
                githubUrl: 'https://github.com/interesta22/OS-Project',
                demoUrl: null,
              ),
            ],
          ),
        ),
      ],
    );
  }
}


class ExperienceRow extends StatelessWidget {
  final Color accentColor;
  final String imagePath;
  final String title;
  final String period;
  final String description;
  final List<String> techs;
  final String? githubUrl;
  final String? demoUrl;

  const ExperienceRow({
    super.key,
    required this.accentColor,
    required this.imagePath,
    required this.title,
    required this.period,
    required this.description,
    required this.techs,
    this.githubUrl,
    this.demoUrl,
  });

  void _open(String? url) {
    if (url == null) return;
    openUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final isMobile = MediaQuery.of(context).size.width < 500;

    return isMobile
        ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(imagePath, height: 120, fit: BoxFit.cover),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
            Text(
              period,
              style: textTheme.bodySmall?.copyWith(
                color: AppColors.textSecondary,
                fontSize: 11,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              description,
              style: textTheme.bodyMedium?.copyWith(
                color: Colors.grey[700],
                fontSize: 12,
                height: 1.35,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children:
                  techs
                      .map(
                        (t) => Chip(
                          label: Text(
                            t,
                            style: textTheme.bodySmall?.copyWith(fontSize: 11),
                          ),
                          backgroundColor: AppColors.surface.withOpacity(0.9),
                          side: BorderSide(
                            color: AppColors.divider.withOpacity(0.6),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                        ),
                      )
                      .toList(),
            ),
            Row(
              children: [
                if (githubUrl != null)
                  TextButton.icon(
                    onPressed: () => _open(githubUrl),
                    icon: const Icon(Icons.code, size: 16),
                    label: const Text('GitHub'),
                  ),
                if (demoUrl != null)
                  TextButton.icon(
                    onPressed: () => _open(demoUrl),
                    icon: const Icon(Icons.open_in_new, size: 16),
                    label: const Text('Demo'),
                  ),
              ],
            ),
          ],
        )
        : IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: 6,
                margin: const EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  gradient: LinearGradient(
                    colors: [accentColor, accentColor.withOpacity(.7)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: SizedBox(
                  width: 88,
                  height: double.infinity,
                  child: Image.asset(imagePath, fit: BoxFit.cover),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              title,
                              style: textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Text(
                            period,
                            style: textTheme.bodySmall?.copyWith(
                              color: AppColors.textSecondary,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        description,
                        style: textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[700],
                          fontSize: 13,
                          height: 1.35,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children:
                            techs
                                .map(
                                  (t) => Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.surface.withOpacity(0.8),
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: AppColors.divider.withOpacity(
                                          0.6,
                                        ),
                                      ),
                                    ),
                                    child: Text(
                                      t,
                                      style: textTheme.bodySmall?.copyWith(
                                        fontSize: 12,
                                        color: AppColors.textPrimary,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                      ),
                      Row(
                        children: [
                          if (githubUrl != null)
                            TextButton.icon(
                              onPressed: () => _open(githubUrl),
                              icon: const Icon(Icons.code, size: 16),
                              label: const Text('GitHub'),
                            ),
                          if (demoUrl != null)
                            TextButton.icon(
                              onPressed: () => _open(demoUrl),
                              icon: const Icon(Icons.open_in_new, size: 16),
                              label: const Text('Demo'),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
  }
}
