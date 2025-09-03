// import 'package:flutter/material.dart';

// class AchievementsSection extends StatelessWidget {
//   const AchievementsSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final t = Theme.of(context).textTheme;

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text("Achievements", style: t.headlineSmall),
//         const SizedBox(height: 16),

//         Card(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12),
//           ),
//           elevation: 4,
//           margin: const EdgeInsets.symmetric(vertical: 8),
//           child: ListTile(
//             leading: const Icon(Icons.school, color: Colors.blue, size: 32),
//             title: const Text("Udemy Certificate – Dart"),
//             subtitle: const Text(
//               "Completed a course and earned a certificate in Dart programming.",
//             ),
//           ),
//         ),

//         Card(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12),
//           ),
//           elevation: 4,
//           margin: const EdgeInsets.symmetric(vertical: 8),
//           child: ListTile(
//             leading: const Icon(Icons.school, color: Colors.orange, size: 32),
//             title: const Text("Udemy Certificate – Flutter"),
//             subtitle: const Text(
//               "Completed a course and earned a certificate in Flutter development.",
//             ),
//           ),
//         ),

//         Card(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12),
//           ),
//           elevation: 4,
//           margin: const EdgeInsets.symmetric(vertical: 8),
//           child: ListTile(
//             leading: const Icon(
//               Icons.phone_android,
//               color: Colors.green,
//               size: 32,
//             ),
//             title: const Text("First App: ALQuds"),
//             subtitle: const Text(
//               "Developed my first Islamic app with Prayer Times, Quran offline, Azkar, and more.",
//             ),
//           ),
//         ),

//         Card(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12),
//           ),
//           elevation: 4,
//           margin: const EdgeInsets.symmetric(vertical: 8),
//           child: ListTile(
//             leading: const Icon(Icons.groups, color: Colors.purple, size: 32),
//             title: const Text(
//               "Volunteer Project – University (Quality Management)",
//             ),
//             subtitle: const Text(
//               "Contributed in a university volunteer team building a Quality Management app.",
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:my_portfolio2/core/app_locallizatin.dart';
import 'package:my_portfolio2/utils/helpers.dart';

class AchievementsSection extends StatelessWidget {
   AchievementsSection({super.key});//error

  final List<Map<String, dynamic>> items =  [
    {
      "title": "udemy_dart".tr,//error
      "subtitle": "udemy_dart_desc".tr,//error
      "image": "assets/images/c1jpg.jpg",
      "icon": Icons.school,
      "iconColor": Colors.blue,
    },
    {
      "title": "udemy_flutter".tr,//error
      "subtitle": "udemy_flutter_desc".tr,//error
      "image": "assets/images/c1jpg.jpg",
      "icon": Icons.school,
      "iconColor": Colors.orange,
    },
    {
      "title": "first_app".tr,//error
      "subtitle": "first_app_desc".tr,//error
      "downloads": "500+",
      "icon": Icons.phone_android,
      "iconColor": Colors.green,
    },
    {
      "title": "volunteer_proj".tr,//error
      "subtitle": "volunteer_proj_desc".tr,//error
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
          ...items.map((item) => _buildListItem(context, item)).toList(),
        ],
      ),
    );
  }

  Widget _buildListItem(BuildContext context, Map<String, dynamic> item) {
    bool hasImage = item.containsKey("image");
    bool hasDownloads = item.containsKey("downloads");

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(item["icon"], color: item["iconColor"], size: 32),
        title: Text(item["title"](context)),
        subtitle: Text(item["subtitle"](context)),
        onTap: (hasImage || hasDownloads)
            ? () {
                if (hasImage) {
                  showDialog(
                    context: context,
                    builder: (_) => Dialog(
                      backgroundColor: Colors.transparent,
                      insetPadding: const EdgeInsets.all(16),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          color: Colors.transparent,
                          padding: const EdgeInsets.all(12),
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
                                  maxScale: 1,
                                  child: SizedBox(
                                    width: 600,
                                    height: 400,
                                    child: Image.asset(
                                      item["image"],
                                      fit: BoxFit.cover,
                                    ),
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
                  showDialog(
                    context: context,
                    builder: (_) => Dialog(
                      backgroundColor: Colors.transparent,
                      insetPadding: const EdgeInsets.all(32),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          width: 300,
                          color: Colors.white,
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                item["title"](context),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
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
                                    style: const TextStyle(fontSize: 18),
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
            : null,
      ),
    );
  }
}
