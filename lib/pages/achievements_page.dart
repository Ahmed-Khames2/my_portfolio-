import 'package:flutter/material.dart';
import 'package:my_portfolio2/core/app_localization.dart';
import 'package:my_portfolio2/widgets/section_title.dart';

class AchievementsSection extends StatelessWidget {
  const AchievementsSection({super.key});

  static const List<Map<String, dynamic>> items = [
    {
      "titleKey": "udemy_dart",
      "subtitleKey": "udemy_dart_desc",
      "image": "assets/images/c1jpg.jpg",
      "icon": Icons.school,
      "iconColor": Colors.blue,
    },
    {
      "titleKey": "udemy_flutter",
      "subtitleKey": "udemy_flutter_desc",
      "image": "assets/images/c1jpg.jpg",
      "icon": Icons.school,
      "iconColor": Colors.orange,
    },
    {
      "titleKey": "education_depi_titlea",
      "subtitleKey": "education_depi_subtitlea",
      "image": "assets/images/DEPI_CERTIFICATE.jpeg",
      "icon": Icons.workspace_premium,
      "iconColor": Colors.amber,
    },
    {
      "titleKey": "first_app",
      "subtitleKey": "first_app_desc",
      "downloads": "500+",
      "icon": Icons.phone_android,
      "iconColor": Colors.green,
    },
    {
      "titleKey": "volunteer_proj",
      "subtitleKey": "volunteer_proj_desc",
      "icon": Icons.groups,
      "iconColor": Colors.purple,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 800;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle("achievements".tr(context)),
          const SizedBox(height: 20),
          if (isDesktop)
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 130,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return _AchievementCard(item: items[index]);
              },
            )
          else
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: items.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                return _AchievementCard(item: items[index]);
              },
            ),
        ],
      ),
    );
  }
}

class _AchievementCard extends StatefulWidget {
  final Map<String, dynamic> item;

  const _AchievementCard({required this.item});

  @override
  State<_AchievementCard> createState() => _AchievementCardState();
}

class _AchievementCardState extends State<_AchievementCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final item = widget.item;
    final bool hasImage = item.containsKey("image");
    final bool hasDownloads = item.containsKey("downloads");
    final bool isClickable = hasImage || hasDownloads;

    final title = (item["titleKey"] as String).tr(context);
    final subtitle = (item["subtitleKey"] as String).tr(context);
    final Color accentColor = item["iconColor"] ?? Theme.of(context).primaryColor;

    return MouseRegion(
      cursor: isClickable ? SystemMouseCursors.click : SystemMouseCursors.basic,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: isClickable ? () => _handleTap(context, item, hasImage, hasDownloads) : null,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOutCubic,
          transform: Matrix4.diagonal3Values(_isHovered && isClickable ? 1.02 : 1.0, _isHovered && isClickable ? 1.02 : 1.0, 1.0),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: _isHovered && isClickable ? accentColor.withValues(alpha: 0.6) : Colors.transparent,
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: _isHovered && isClickable
                    ? accentColor.withValues(alpha: 0.2)
                    : Colors.black.withValues(alpha: 0.06),
                blurRadius: _isHovered && isClickable ? 16 : 8,
                offset: Offset(0, _isHovered && isClickable ? 6 : 3),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Stack(
              children: [
                // Ribbon Accent on the side
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  width: 5,
                  child: Container(color: accentColor),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Icon Avatar
                      Container(
                        width: 46,
                        height: 46,
                        decoration: BoxDecoration(
                          color: accentColor.withValues(alpha: 0.12),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(item["icon"], color: accentColor, size: 24),
                      ),
                      const SizedBox(width: 14),

                      // Text Content + Badge under text
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              title,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 3),
                            Text(
                              subtitle,
                              style: TextStyle(
                                fontSize: 13,
                                color: Theme.of(context).textTheme.bodySmall?.color?.withValues(alpha: 0.8),
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            if (isClickable) ...[
                              const SizedBox(height: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(
                                  color: (hasImage ? accentColor : Colors.green).withValues(alpha: 0.12),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      hasImage ? Icons.visibility : Icons.download,
                                      size: 13,
                                      color: hasImage ? accentColor : Colors.green,
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      hasImage ? "view_certificate".tr(context) : "view_details".tr(context),
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        color: hasImage ? accentColor : Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),

                      if (isClickable) ...[
                        const SizedBox(width: 8),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 14,
                          color: accentColor.withValues(alpha: 0.6),
                        ),
                      ],
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

  void _handleTap(BuildContext context, Map<String, dynamic> item, bool hasImage, bool hasDownloads) {
    if (hasImage) {
      final title = (item["titleKey"] as String).tr(context);
      showDialog(
        context: context,
        builder: (_) => Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(20),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 700, maxHeight: 600),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header Bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.pop(context),
                        tooltip: "close".tr(context),
                      ),
                    ],
                  ),
                ),
                const Divider(height: 1),

                // Image Viewer with Zoom
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    child: InteractiveViewer(
                      minScale: 1.0,
                      maxScale: 4.0,
                      child: Image.asset(
                        item["image"],
                        fit: BoxFit.contain,
                        width: double.infinity,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else if (hasDownloads) {
      final title = (item["titleKey"] as String).tr(context);
      showDialog(
        context: context,
        builder: (_) => Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(24),
          child: Container(
            width: 320,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.green.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.download, color: Colors.green, size: 24),
                      const SizedBox(width: 8),
                      Text(
                        "${"downloads".tr(context)}: ${item["downloads"]}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text("close".tr(context)),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
