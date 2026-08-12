import 'package:flutter/material.dart';
import 'package:my_portfolio2/models/project_data.dart';
import 'package:my_portfolio2/utils/helpers.dart';
import 'package:my_portfolio2/pages/project_details_page.dart';

class ProjectCard extends StatefulWidget {
  final ProjectModel project;
  final VoidCallback onSelect;
  final Color? headerColor;

  const ProjectCard({
    super.key,
    required this.project,
    required this.onSelect,
    this.headerColor,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final accentColor = widget.headerColor ?? colorScheme.primary;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: theme.cardColor,
          border: Border.all(
            color: _isHovered
                ? accentColor.withValues(alpha: 0.4)
                : colorScheme.onSurface.withValues(alpha: 0.08),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: _isHovered
                  ? accentColor.withValues(alpha: 0.25)
                  : Colors.black.withValues(alpha: 0.05),
              blurRadius: _isHovered ? 20 : 8,
              offset: Offset(0, _isHovered ? 8 : 4),
            ),
          ],
        ),
        child: Transform.translate(
          offset: Offset(0, _isHovered ? -4.0 : 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Accent Strip
              Container(
                height: 6,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      accentColor,
                      colorScheme.secondary,
                    ],
                  ),
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image Banner
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      height: 170,
                      decoration: BoxDecoration(
                        color: theme.brightness == Brightness.dark
                            ? Colors.black26
                            : Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: accentColor.withValues(alpha: 0.2),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: Image.asset(
                          widget.project.imagesBackGround,
                          height: 170,
                          width: double.infinity,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    const SizedBox(height: 14),

                    // Title
                    Row(
                      children: [
                        Icon(
                          Icons.folder_special_rounded,
                          color: accentColor,
                          size: 24,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            widget.project.title,
                            style: t.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: colorScheme.onSurface,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    // Description
                    SizedBox(
                      height: 42,
                      child: Text(
                        widget.project.description,
                        style: t.bodyMedium?.copyWith(
                          color: colorScheme.onSurface.withValues(alpha: 0.75),
                          height: 1.4,
                          fontSize: 13,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Tech Badges
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: const [
                        _TechChip(label: "Flutter"),
                        _TechChip(label: "Dart"),
                        _TechChip(label: "Clean UI"),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Action Buttons
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {
                              if (widget.project.downloadUrl.isNotEmpty) {
                                openUrl(widget.project.downloadUrl);
                              }
                            },
                            icon: const Icon(Icons.code, size: 16),
                            label: const Text("GitHub"),
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => ProjectDetailsPage(
                                    project: widget.project,
                                  ),
                                ),
                              );
                            },
                            icon: const Icon(Icons.arrow_forward_rounded, size: 16),
                            label: const Text("Details"),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TechChip extends StatelessWidget {
  final String label;
  const _TechChip({required this.label});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: theme.colorScheme.primary,
        ),
      ),
    );
  }
}

