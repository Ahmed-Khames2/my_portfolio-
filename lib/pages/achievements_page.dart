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
      "icon": Icons.school,
      "iconColor": Colors.blue,
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
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle("achievements".tr(context)),
          const SizedBox(height: 16),
          ...items.map((item) => _buildListItem(context, item)),
        ],
      ),
    );
  }

  Widget _buildListItem(BuildContext context, Map<String, dynamic> item) {
    bool hasImage = item.containsKey("image");
    bool hasDownloads = item.containsKey("downloads");
    final title = (item["titleKey"] as String).tr(context);
    final subtitle = (item["subtitleKey"] as String).tr(context);

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(item["icon"], color: item["iconColor"], size: 32),
        title: Text(title),
        subtitle: Text(subtitle),
        onTap:
            (hasImage || hasDownloads)
                ? () {
                  if (hasImage) {
                    showDialog(
                      context: context,
                      builder:
                          (_) => Dialog(
                            backgroundColor: Colors.transparent,
                            insetPadding: const EdgeInsets.all(16),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Container(
                                color: Colors.transparent,
                                // padding: const EdgeInsets.all(12),
                                constraints: const BoxConstraints(
                                  maxHeight: 550,
                                ),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const SizedBox(height: 12),
                                      InteractiveViewer(
                                        panEnabled: false,
                                        minScale: 1,
                                        maxScale: 3,
                                        child: LayoutBuilder(
                                          builder: (context, constraints) {
                                            final screenWidth =
                                                MediaQuery.of(
                                                  context,
                                                ).size.width;
                                            final screenHeight =
                                                MediaQuery.of(
                                                  context,
                                                ).size.height;

                                            return Image.asset(
                                              item["image"],
                                              fit: BoxFit.contain,
                                              width: screenWidth * 0.9,
                                              height: screenHeight * 0.6,
                                              // 🟢 هنا نضيف frameBuilder للـ loader
                                              frameBuilder: (
                                                BuildContext context,
                                                Widget child,
                                                int? frame,
                                                bool wasSynchronouslyLoaded,
                                              ) {
                                                if (wasSynchronouslyLoaded) {
                                                  return child;
                                                }
                                                return frame == null
                                                    ? SizedBox(
                                                      width: screenWidth * 0.9,
                                                      height:
                                                          screenHeight * 0.6,
                                                      child: const Center(
                                                        child:
                                                            CircularProgressIndicator(),
                                                      ),
                                                    )
                                                    : child;
                                              },
                                            );
                                          },
                                        ),
                                      ),

                                      const SizedBox(height: 12),
                                      ElevatedButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text("close".tr(context)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                    );
                  } else if (hasDownloads) {
                    _showDownloadsDialog(context, item);
                  }
                }
                : null,
      ),
    );
  }

  Future<dynamic> _showDownloadsDialog(
    BuildContext context,
    Map<String, dynamic> item,
  ) {
    final title = (item["titleKey"] as String).tr(context);
    return showDialog(
      context: context,
      builder:
          (_) => Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: const EdgeInsets.all(32),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                width: 300,
                color: Theme.of(context).colorScheme.surface,
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.download,
                          color: Colors.green,
                          size: 28,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "${"downloads".tr(context)}: ${item["downloads"]}",
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("close".tr(context)),
                    ),
                  ],
                ),
              ),
            ),
          ),
    );
  }
}
