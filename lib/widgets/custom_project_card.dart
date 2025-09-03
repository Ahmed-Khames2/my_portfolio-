import 'package:flutter/material.dart';
import 'package:my_portfolio2/core/app_colors.dart';
import 'package:my_portfolio2/models/project_data.dart';
import 'package:my_portfolio2/pages/ProjectDetailsPage.dart';

class ProjectCard extends StatefulWidget {
  final ProjectModel project;
  final VoidCallback onSelect;

  const ProjectCard({super.key, required this.project, required this.onSelect});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onSelect,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
          transform:
              Matrix4.identity()..scale(_isHovered ? 1.03 : 1.0), // تكبير بسيط
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors:
                  _isHovered
                      ? [AppColors.primary.withOpacity(0.9), AppColors.surface]
                      : [AppColors.surface, AppColors.surface],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              if (_isHovered)
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
            ],
            border: Border.all(color: AppColors.divider),
          ),

          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: widget.project.title, // Hero Animation
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    height: 150,
                    color: const Color(0xFF232427),
                    child: Center(
                      child: Image.asset(
                        widget.project.imagesBackGround,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                widget.project.title,
                style: t.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: _isHovered ? Colors.white : t.titleMedium?.color,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                widget.project.description,
                style: t.bodyLarge?.copyWith(
                  color: _isHovered ? Colors.white70 : t.bodyLarge?.color,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton.icon(
                  style: TextButton.styleFrom(
                    foregroundColor:
                        _isHovered ? Colors.white : Colors.blueAccent,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (_) => ProjectDetailsPage(project: widget.project),
                      ),
                    );
                  },
                  icon: const Icon(Icons.open_in_new),
                  label: const Text("View"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
