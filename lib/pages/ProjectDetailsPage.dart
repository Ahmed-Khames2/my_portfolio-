import 'package:flutter/material.dart';
import 'package:my_portfolio2/models/project_data.dart';
import 'package:my_portfolio2/widgets/custom_carousel_project.dart';
// import 'package:my_portfolio/models/project_data.dart';
// import 'package:my_portfolio/widgets/custom_carousel_project.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDetailsPage extends StatelessWidget {
  final ProjectModel project;

  const ProjectDetailsPage({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: Text(project.title), centerTitle: true),

      // 👇 زر التحميل ثابت تحت
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () async {
              final Uri url = Uri.parse(project.downloadUrl);
              if (await canLaunchUrl(url)) {
                await launchUrl(url, mode: LaunchMode.externalApplication);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Could not launch download link"),
                  ),
                );
              }
            },
            icon: const Icon(Icons.download),
            label: const Text("Download App"),
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 👇 الموبايل موكاب (container شبيه بالشاشة)
            Center(
              child: Container(
                width: 250,
                height: 500,
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
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

            // 👇 العنوان
            Text(project.title, style: t.headlineSmall),
            const SizedBox(height: 12),

            // 👇 الوصف
            Text(
              project.fullDesc,
              style: t.bodyMedium,
              textAlign: TextAlign.start,
            ),

            const SizedBox(height: 80), // مساحة علشان الزرار تحت
          ],
        ),
      ),
    );
  }
}
