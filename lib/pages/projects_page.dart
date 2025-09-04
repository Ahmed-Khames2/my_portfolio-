// import 'package:flutter/material.dart';
// import 'package:my_portfolio2/core/app_locallizatin.dart';
// import 'package:my_portfolio2/models/project_data.dart';
// import 'package:my_portfolio2/utils/helpers.dart';
// import 'package:my_portfolio2/widgets/custom_project_card.dart';

// class ProjectsSection extends StatefulWidget {
//   const ProjectsSection({super.key});

//   @override
//   State<ProjectsSection> createState() => _ProjectsSectionState();
// }

// class _ProjectsSectionState extends State<ProjectsSection> {
//   int _selectedIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     final gap = 16.0;

//     final projects = [
//       ProjectModel(
//         title: "alquds_title", // ⬅️ مفتاح فقط
//         description: "alquds_description",
//         downloadUrl: "https://github.com/Ahmed-Khames2/ALQudes-",
//         images: [
//           "assets/images/alqudes5.jpg",
//           "assets/images/alqudes3.jpg",
//           "assets/images/alqudes4.jpg",
//           "assets/images/alqudes1.jpg",
//         ],
//         imagesBackGround: 'assets/images/alquds.png',
//         fullDesc: "alquds_fullDesc",
//       ),
//       ProjectModel(
//         title: "ecom_title",
//         description: "ecom_description",
//         downloadUrl: "https://github.com/Ahmed-Khames2/e_com",
//         images: [
//           "assets/images/e1.jpg",
//           "assets/images/e2.jpg",
//           "assets/images/e3.jpg",
//           "assets/images/e4.jpg",
//           "assets/images/e5.jpg",
//           "assets/images/e6.jpg",
//         ],
//         imagesBackGround: "assets/images/Logo (2).png",
//         fullDesc: "ecom_fullDesc",
//       ),
//       ProjectModel(
//         title: "todo_title",
//         description: "todo_description",
//         downloadUrl: "",
//         images: ["p3-1.png", "p3-2.png"],
//         imagesBackGround: 'assets/images/alquds.png',
//         fullDesc: "todo_fullDesc",
//       ),
//     ];

//     final headerColors = [
//       Colors.tealAccent.shade700,
//       Colors.blueGrey,
//       Colors.orangeAccent,
//       Colors.blueAccent,
//       Colors.greenAccent.shade400,
//     ];

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SectionTitle("projects".tr(context)),

//         const SizedBox(height: 16),

//         LayoutBuilder(
//           builder: (ctx, c) {
//             final cols = c.maxWidth < 750 ? 1 : (c.maxWidth < 1100 ? 2 : 3);
//             final w = (c.maxWidth - gap * (cols - 1)) / cols;

//             return Wrap(
//               spacing: gap,
//               runSpacing: gap,
//               children: List.generate(projects.length, (i) {
//                 return SizedBox(
//                   width: w,
//                   child: ProjectCard(
//                     project: projects[i],
//                     headerColor: headerColors[i % headerColors.length],
//                     onSelect: () {
//                       setState(() {
//                         _selectedIndex = i;
//                       });
//                     },
//                   ),
//                 );
//               }),
//             );
//           },
//         ),

//         const SizedBox(height: 28),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:my_portfolio2/models/project_data.dart';
import 'package:my_portfolio2/utils/helpers.dart';
import 'package:my_portfolio2/widgets/custom_project_card.dart';

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
      description:
          "تطبيق ديني شامل بدون إنترنت  تطبيق ديني شامل بدون إنترنت تطبيق ديني شامل بدون إنترنت تطبيق ديني شامل بدون إنترنت تطبيق ديني شامل بدون إنترنت تطبيق ديني شامل بدون إنترنت تطبيق ديني شامل بدون إنترنت",

      downloadUrl: "https://github.com/Ahmed-Khames2/ALQudes-",
      images: [
        "assets/images/alqudes5.jpg",
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
      title: "E-Commerce App",
      description:
          "A simple e-commerce application to browse products, view details, and add items to the cart with Firebase authentication.",
      downloadUrl: "https://github.com/Ahmed-Khames2/e_com", // your repo link
      images: [
        "assets/images/e1.jpg",
        "assets/images/e2.jpg",
        "assets/images/e3.jpg",
        "assets/images/e4.jpg",
        "assets/images/e5.jpg",
        "assets/images/e6.jpg",
      ],
      imagesBackGround: "assets/images/Logo (2).png",
      fullDesc: """
    This project is a basic E-Commerce application built with Flutter.
    
    Features:
    - Display products on the home page.
    - Product detail page for each item.
    - Add products to the shopping cart.
    - Cart page to manage orders.
    - User authentication (Sign up & Login) with Firebase.
    """,
    ),
    ProjectModel(
      title: "ToDo App",
      description: "الوصف يضاف لاحقًا",
      downloadUrl: "",
      images: ["p3-1.png", "p3-2.png"],
      imagesBackGround: 'assets/images/alquds.png',
      fullDesc: '',
    ),
  ];

  // 🎨 ألوان مختلفة للهيدر
  final headerColors = [
    Colors.tealAccent.shade700,
    Colors.grey,
    Colors.orangeAccent,
    Colors.blueAccent,
    Colors.greenAccent.shade400,
    // Colors.purpleAccent,
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
                    headerColor: headerColors[i % headerColors.length],
                    onSelect: () {
                      //error
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
      ],
    );
  }
}
