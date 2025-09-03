import 'package:flutter/material.dart';
import 'package:my_portfolio2/models/project_data.dart';
import 'package:my_portfolio2/utils/helpers.dart';
import 'package:my_portfolio2/widgets/custom_project_card.dart';
// import 'package:my_portfolio/models/project_data.dart';
// import 'package:my_portfolio/utils/helpers.dart';
// import 'package:my_portfolio/models/project_model.dart';
// import 'package:my_portfolio/widgets/custom_carousel_project.dart';
// import 'package:my_portfolio/widgets/custom_project_card.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  int _selectedIndex = 0;

  final projects = [
    ProjectModel(
      title: "AlQuds",
      description: "تطبيق ديني شامل بدون إنترنت",
      downloadUrl:
          "https://drive.google.com/file/d/1MY2MSudVNXjyoUlhH0DQs2O-QGJYzlfE/view?usp=sharing",
      images: [
        "assets/images/alqudes5.jpg",
        // "assets/images/alqudes2.jpg",
        "assets/images/alqudes3.jpg",
        "assets/images/alqudes4.jpg",
        "assets/images/alqudes1.jpg",
      ],
      imagesBackGround: 'assets/images/alquds.png',
      fullDesc: '''
"ALQuds ✨ كل ما تحتاجه في تطبيق ديني واحد: القرآن، الأذكار، ومواقيت الصلاة بدون إنترنت!"
''',
    ),
    ProjectModel(
      title: "Project 2",
      description: "الوصف يضاف لاحقًا",
      downloadUrl: "",
      images: ["p2-1.png", "p2-2.png"],
      imagesBackGround: 'assets/images/alquds.png',
      fullDesc: '',
    ),
    ProjectModel(
      title: "Project 3",
      description: "الوصف يضاف لاحقًا",
      downloadUrl: "",
      images: ["p3-1.png", "p3-2.png"],
      imagesBackGround: 'assets/images/alquds.png',
      fullDesc: '',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final gap = 16.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle("Projects"),

        const SizedBox(height: 16),

        // ✅ شبكة الكروت
        LayoutBuilder(
          builder: (ctx, c) {
            final cols = c.maxWidth < 750 ? 1 : (c.maxWidth < 1100 ? 2 : 3);
            final w = (c.maxWidth - gap * (cols - 1)) / cols;

            return Wrap(
              spacing: gap,
              runSpacing: gap,
              children: List.generate(projects.length, (i) {
                return SizedBox(
                  width: w,
                  child: ProjectCard(
                    project: projects[i],
                    onSelect: () {
                      setState(() {
                        _selectedIndex = i;
                      });
                    },
                  ),
                );
              }),
            );
          },
        ),

        const SizedBox(height: 28),

        // ✅ الكروسل الخاص بالمشروع المختار
        // CarouselProject(images: projects[_selectedIndex].images),
      ],
    );
  }
}
