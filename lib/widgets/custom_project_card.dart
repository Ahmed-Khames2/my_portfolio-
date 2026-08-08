import 'package:flutter/material.dart';
import 'package:my_portfolio2/models/project_data.dart';
import 'package:my_portfolio2/utils/helpers.dart';
import 'package:my_portfolio2/pages/project_details_page.dart';

class ProjectCard extends StatefulWidget {
  final ProjectModel project;
  final VoidCallback onSelect;
  final Color headerColor;

  const ProjectCard({
    super.key,
    required this.project,
    required this.onSelect,
    required this.headerColor,
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

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: theme.cardColor, // 🌙 يدعم الداكن والفاتح
          boxShadow: [
            BoxShadow(
              color:
                  _isHovered
                      ? widget.headerColor.withValues(alpha: 0.5)
                      : theme.shadowColor.withValues(alpha: 0.1),
              blurRadius: _isHovered ? 20 : 8,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Transform.translate(
          offset: Offset(0, _isHovered ? -6.0 : 0),
          child: Transform.scale(
            scale: _isHovered ? 1.04 : 1.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🎨 هيدر متدرج
                Container(
                  height: 10,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        widget.headerColor,
                        widget.headerColor.withValues(alpha: 0.7),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
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
                      // 🖼️ صورة مع ظل
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: widget.headerColor.withValues(alpha: 0.4),
                              blurRadius: 12,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            widget.project.imagesBackGround,
                            height: 180,
                            width: double.infinity,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),

                      const SizedBox(height: 14),

                      // 📂 أيقونة + عنوان
                      Row(
                        children: [
                          Icon(
                            Icons.folder_open,
                            color: widget.headerColor,
                            size: 26,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              widget.project.title,
                              style: t.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: theme.textTheme.bodyLarge?.color,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 10),

                      // 📝 الوصف مع مساحة ثابتة
                      SizedBox(
                        height: 40,
                        child: Text(
                          widget.project.description,
                          style: t.bodyMedium?.copyWith(
                            color: theme.textTheme.bodyMedium?.color
                                ?.withValues(alpha: 0.8),
                            height: 1.4,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),

                      const SizedBox(height: 14),

                      // 🌈 Divider متدرج
                      Container(
                        height: 3,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              widget.headerColor,
                              widget.headerColor.withValues(alpha: 0.4),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),

                      const SizedBox(height: 12),

                      // 🔘 أزرار GitHub + Demo
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildButton(
                            icon: Icons.code,
                            label: "GitHub",
                            color: widget.headerColor, // 👈 نفس لون الـ Demo
                            onTap: () {
                              if (widget.project.downloadUrl.isNotEmpty) {
                                openUrl(widget.project.downloadUrl);
                              }
                            },
                            outlined: true, // 👈 Outlined
                          ),
                          _buildButton(
                            icon: Icons.open_in_browser,
                            label: "Demo",
                            color: widget.headerColor,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (_) => ProjectDetailsPage(
                                        project: widget.project,
                                      ),
                                ),
                              );
                            },
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
      ),
    );
  }

  Widget _buildButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
    bool outlined = false, // 👈 اختيار جديد
  }) {
    if (outlined) {
      return OutlinedButton.icon(
        onPressed: onTap,
        icon: Icon(icon, size: 18, color: color),
        label: Text(
          label,
          style: TextStyle(color: color, fontWeight: FontWeight.bold),
        ),
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: color, width: 1.5),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
    }

    return ElevatedButton.icon(
      onPressed: onTap,
      icon: const Icon(Icons.open_in_browser, size: 18, color: Colors.white),
      label: Text(label, style: const TextStyle(color: Colors.white)),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
      ),
    );
  }
}
