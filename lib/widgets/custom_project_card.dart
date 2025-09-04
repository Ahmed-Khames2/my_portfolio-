// import 'package:flutter/material.dart';
// import 'package:my_portfolio2/core/app_colors.dart';
// import 'package:my_portfolio2/models/project_data.dart';
// import 'package:my_portfolio2/utils/helpers.dart';
// import 'package:my_portfolio2/pages/ProjectDetailsPage.dart';
// // ⬇️ add this:
// import 'package:my_portfolio2/core/app_locallizatin.dart';

// class ProjectCard extends StatefulWidget {
//   final ProjectModel project;
//   final VoidCallback onSelect;
//   final Color headerColor;

//   const ProjectCard({
//     super.key,
//     required this.project,
//     required this.onSelect,
//     required this.headerColor,
//   });

//   @override
//   State<ProjectCard> createState() => _ProjectCardState();
// }

// class _ProjectCardState extends State<ProjectCard> {
//   bool _isHovered = false;

//   @override
//   Widget build(BuildContext context) {
//     final t = Theme.of(context).textTheme;

//     return MouseRegion(
//       onEnter: (_) => setState(() => _isHovered = true),
//       onExit: (_) => setState(() => _isHovered = false),
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 300),
//         curve: Curves.easeOut,
//         transform: Matrix4.identity()
//           ..scale(_isHovered ? 1.04 : 1.0)
//           ..translate(0, _isHovered ? -6.0 : 0),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           color: AppColors.surface,
//           boxShadow: [
//             BoxShadow(
//               color: _isHovered
//                   ? widget.headerColor.withOpacity(0.5)
//                   : Colors.black.withOpacity(0.1),
//               blurRadius: _isHovered ? 20 : 8,
//               offset: const Offset(0, 8),
//             ),
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // header
//             Container(
//               height: 10,
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [widget.headerColor, widget.headerColor.withOpacity(0.7)],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//                 borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
//               ),
//             ),

//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // image
//                   AnimatedContainer(
//                     duration: const Duration(milliseconds: 300),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(16),
//                       boxShadow: [
//                         BoxShadow(
//                           color: widget.headerColor.withOpacity(0.4),
//                           blurRadius: 12,
//                           offset: const Offset(0, 6),
//                         ),
//                       ],
//                     ),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(16),
//                       child: Image.asset(
//                         widget.project.imagesBackGround,
//                         height: 180,
//                         width: double.infinity,
//                         fit: BoxFit.scaleDown,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 14),

//                   // icon + title
//                   Row(
//                     children: [
//                       Icon(Icons.folder_open, color: widget.headerColor, size: 26),
//                       const SizedBox(width: 10),
//                       Expanded(
//                         child: Text(
//                           // ⬇️ translate at render time
//                           widget.project.title.tr(context),
//                           style: t.titleMedium?.copyWith(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 18,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),

//                   const SizedBox(height: 10),

//                   // description with fixed height + ellipsis
//                   SizedBox(
//                     height: 40,
//                     child: Text(
//                       // ⬇️ translate at render time
//                       widget.project.description.tr(context),
//                       style: t.bodyMedium?.copyWith(
//                         color: Colors.grey[700],
//                         height: 1.4,
//                       ),
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ),

//                   const SizedBox(height: 14),

//                   // gradient divider
//                   Container(
//                     height: 3,
//                     decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                         colors: [widget.headerColor, widget.headerColor.withOpacity(0.4)],
//                       ),
//                       borderRadius: BorderRadius.circular(2),
//                     ),
//                   ),

//                   const SizedBox(height: 12),

//                   // actions
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       _buildButton(
//                         icon: Icons.code,
//                         label: "GitHub", // localize if you have keys e.g. "github".tr(context)
//                         color: Colors.black87,
//                         onTap: () {
//                           if (widget.project.downloadUrl.isNotEmpty) {
//                             openUrl(widget.project.downloadUrl);
//                           }
//                         },
//                       ),
//                       _buildButton(
//                         icon: Icons.open_in_browser,
//                         label: "Demo", // localize if you have keys e.g. "demo".tr(context)
//                         color: widget.headerColor,
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (_) => ProjectDetailsPage(project: widget.project),
//                             ),
//                           );
//                         },
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildButton({
//     required IconData icon,
//     required String label,
//     required Color color,
//     required VoidCallback onTap,
//   }) {
//     return ElevatedButton.icon(
//       onPressed: onTap,
//       icon: Icon(icon, size: 18, color: Colors.white),
//       label: Text(label, style: const TextStyle(color: Colors.white)),
//       style: ElevatedButton.styleFrom(
//         backgroundColor: color,
//         padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//         elevation: 4,
//       ),
//     );
//   }
// }
//  add changes here 
 import 'package:flutter/material.dart';
import 'package:my_portfolio2/core/app_colors.dart';
import 'package:my_portfolio2/models/project_data.dart';
import 'package:my_portfolio2/utils/helpers.dart';
import 'package:my_portfolio2/pages/ProjectDetailsPage.dart'; // تم إضافة هذا

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

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        transform:
            Matrix4.identity()
              ..scale(_isHovered ? 1.04 : 1.0)
              ..translate(0, _isHovered ? -6.0 : 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.surface,
          boxShadow: [
            BoxShadow(
              color:
                  _isHovered
                      ? widget.headerColor.withOpacity(0.5)
                      : Colors.black.withOpacity(0.1),
              blurRadius: _isHovered ? 20 : 8,
              offset: const Offset(0, 8),
            ),
          ],
        ),
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
                    widget.headerColor.withOpacity(0.7),
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
                          color: widget.headerColor.withOpacity(0.4),
                          blurRadius: 12,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        widget.project.imagesBackGround,
                        height: 180, // زيادة الارتفاع
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
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // 📝 الوصف مع مساحة ثابتة
                  SizedBox(
                    height: 40, // ثابت
                    child: Text(
                      widget.project.description,
                      style: t.bodyMedium?.copyWith(
                        color: Colors.grey[700],
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
                          widget.headerColor.withOpacity(0.4),
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
                        color: Colors.black87,
                        onTap: () {
                          if (widget.project.downloadUrl.isNotEmpty) {
                            openUrl(widget.project.downloadUrl);
                          }
                        },
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
    );
  }

  Widget _buildButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 18, color: Colors.white),
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
