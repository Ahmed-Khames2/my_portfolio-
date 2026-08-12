import 'package:flutter/material.dart';
import 'package:my_portfolio2/core/app_localization.dart';
import 'package:my_portfolio2/models/project_data.dart';
import 'package:my_portfolio2/widgets/section_title.dart';
import 'package:my_portfolio2/widgets/custom_project_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  List<ProjectModel> _getProjects(BuildContext context) {
    return [
      ProjectModel(
        title: "alquds_title".tr(context),
        description: "alquds_desc".tr(context),
        downloadUrl: "https://github.com/Ahmed-Khames2/ramadan_project",
        demoUrl: "https://ramadan-project-qbrn.vercel.app/",
        images: const [
          "assets/images/alqudes5.jpg",
          "assets/images/alqudes3.jpg",
          "assets/images/alqudes4.jpg",
          "assets/images/alqudes1.jpg",
        ],
        imagesBackGround: 'assets/images/zad_almumin.png',
        fullDesc: "${"alquds_title".tr(context)} ✨ ${"alquds_desc".tr(context)}",
      ),
      ProjectModel(
        title: "ecom_title".tr(context),
        description: "ecom_desc".tr(context),
        downloadUrl: "https://github.com/Ahmed-Khames2/e_com",
        images: const [
          "assets/images/e1.jpg",
          "assets/images/e2.jpg",
          "assets/images/e3.jpg",
          "assets/images/e4.jpg",
          "assets/images/e5.jpg",
          "assets/images/e6.jpg",
        ],
        imagesBackGround: "assets/images/Logo (2).png",
        fullDesc: "ecom_desc".tr(context),
      ),
      ProjectModel(
        title: "todo_title".tr(context),
        description: "todo_desc".tr(context),
        downloadUrl: "https://github.com/Ahmed-Khames2/todo_app",
        images: const [
          "assets/images/todo1.jpg",
          "assets/images/todo2.jpg",
          "assets/images/todo3.jpg",
          "assets/images/todo4.jpg",
          "assets/images/todo5.jpg",
          "assets/images/todo6.jpg",
          "assets/images/todo7.jpg",
          "assets/images/todo8.jpg",
          "assets/images/todo9.jpg",
          "assets/images/todo10.jpg",
        ],
        imagesBackGround: 'assets/images/productivity (5).png',
        fullDesc: "todo_full_desc".tr(context),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    const gap = 20.0;
    final projects = _getProjects(context);

    return Padding(
      padding: EdgeInsets.all(
        MediaQuery.of(context).size.width < 750 ? 16.0 : 0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle("projects".tr(context)),
          const SizedBox(height: 20),
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
                      onSelect: () {},
                    ),
                  );
                }),
              );
            },
          ),
          const SizedBox(height: 28),
        ],
      ),
    );
  }
}

