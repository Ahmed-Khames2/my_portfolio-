// experience_section.dart
import 'package:flutter/material.dart';
import 'package:my_portfolio2/core/app_colors.dart';
import 'package:my_portfolio2/utils/helpers.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SectionTitle('Experience'),
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
              // Outlier AI
              ExperienceRow(
                accentColor: Colors.blue,
                imagePath: 'assets/images/ot.jpeg',
                title: 'Freelance Contributor — Outlier AI',
                period: '2024',
                description:
                    'Worked on AI training projects improving model accuracy and performance. Delivered tasks remotely as a freelancer.',
                techs: ['AI', 'Prompet Engineering', 'Remote Work'],
                githubUrl: null,
                demoUrl: null,
                isMobile: isMobile,
              ),
              const SizedBox(height: 12),
              Divider(color: AppColors.divider),
              const SizedBox(height: 12),

              // DEPI
              ExperienceRow(
                accentColor: Colors.white,
                imagePath: 'assets/images/DEPI.jpg',
                title: 'Digital Egypt Pioneers Initiative (DEPI)',
                period: '2024 — Present',
                description:
                    'National initiative training on Flutter development, clean architecture, and real-world projects.',
                techs: ['Flutter', 'Bloc', 'UI/UX', 'Dart'],
                githubUrl: null,
                demoUrl: null,
                isMobile: isMobile,
              ),
              const SizedBox(height: 12),
              Divider(color: AppColors.divider),
              const SizedBox(height: 12),

              // OS Project
              ExperienceRow(
                accentColor: AppColors.primary,
                imagePath: 'assets/images/cp.png',
                title: 'Operating System Scheduler (College Project)',
                period: '2024',
                description:
                    'Implemented CPU scheduling algorithms (FCFS, SJF, Round Robin, Priority) as part of Operating Systems coursework.',
                techs: ['Visualization ', 'Algorithms', 'OS Concepts'],
                githubUrl: 'https://github.com/interesta22/OS-Project',
                demoUrl: null,
                isMobile: isMobile,
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
  final bool isMobile;

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
    required this.isMobile,
  });

  void _open(String? url) {
    if (url == null) return;
    openUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // accent line
          Container(
            width: isMobile ? 4 : 6,
            margin: EdgeInsets.only(right: isMobile ? 12 : 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              gradient: LinearGradient(
                colors: [accentColor, accentColor.withOpacity(.7)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              width: isMobile ? 64 : 88,
              height: double.infinity,
              child: Image.asset(imagePath, fit: BoxFit.cover),
            ),
          ),

          const SizedBox(width: 14),

          // text & meta
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: isMobile ? 8 : 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // title + period
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: isMobile ? 14 : 16,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        period,
                        style: textTheme.bodySmall?.copyWith(
                          color: AppColors.textSecondary,
                          fontSize: isMobile ? 11 : 12,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 6),

                  Text(
                    description,
                    style: textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[700],
                      fontSize: isMobile ? 12 : 13,
                      height: 1.35,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // tech tags
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
                                    color: AppColors.divider.withOpacity(0.6),
                                  ),
                                ),
                                child: Text(
                                  t,
                                  style: textTheme.bodySmall?.copyWith(
                                    fontSize: isMobile ? 11 : 12,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                  ),

                  const SizedBox(height: 10),

                  // action buttons
                  Row(
                    children: [
                      if (githubUrl != null)
                        TextButton.icon(
                          onPressed: () => _open(githubUrl),
                          icon: const Icon(Icons.code, size: 16),
                          label: Text(
                            'GitHub',
                            style: textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      if (demoUrl != null)
                        TextButton.icon(
                          onPressed: () => _open(demoUrl),
                          icon: const Icon(Icons.open_in_new, size: 16),
                          label: Text(
                            'Demo',
                            style: textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
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
