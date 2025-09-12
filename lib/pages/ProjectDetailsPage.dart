import 'package:flutter/material.dart';
import 'package:my_portfolio2/models/project_data.dart';
import 'package:my_portfolio2/widgets/custom_carousel_project.dart';
import 'package:my_portfolio2/widgets/custom_fotter.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDetailsPage extends StatelessWidget {
  final ProjectModel project;

  const ProjectDetailsPage({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            // 🔹 هيدر زي جوجل بلاي
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // أيقونة التطبيق أصغر
                  SizedBox(height: 16,),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      project.imagesBackGround,
                      width: 50, // قللنا الحجم
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(width: 12),

                  // الاسم + الوصف
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          project.title,
                          style: t.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "by Ahmed Khamis",
                          style: t.bodyMedium?.copyWith(
                            color: Colors.grey[600],
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),

                  // زر التثبيت في آخر الصف
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () async {
                      final Uri url = Uri.parse(project.downloadUrl);
                      if (await canLaunchUrl(url)) {
                        await launchUrl(
                          url,
                          mode: LaunchMode.externalApplication,
                        );
                      }
                    },
                    child: const Text("Install"),
                  ),
                ],
              ),
            ),

            const Divider(thickness: 1),

            // 🔹 صور جوه موكاب موبايل
            Center(
              child: Container(
                width: 250,
                height: 500,
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.grey.shade400, width: 3),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 15,
                      spreadRadius: 2,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: CarouselProject(images: project.images),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // 🔹 الوصف
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "About this app",
                style: t.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                project.fullDesc,
                style: t.bodyMedium?.copyWith(height: 1.5),
              ),
            ),

            const SizedBox(height: 20),

            // 🔹 معلومات إضافية زي جوجل بلاي
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  _infoRow("Version", "1.0.0"),
                  _infoRow("Updated on", "Sep 2025"),
                  _infoRow("Downloads", "1K+"),
                  _infoRow("Size", "25 MB"),
                ],
              ),
            ),
            Footer(),
            // const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: Colors.grey, fontSize: 14)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
