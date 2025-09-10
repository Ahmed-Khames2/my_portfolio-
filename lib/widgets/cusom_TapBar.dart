import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portfolio2/core/app_colors.dart';
import 'package:my_portfolio2/core/cubit/locale_cubit.dart';
import 'package:my_portfolio2/core/app_locallizatin.dart'; // ✅ علشان نستخدم .tr(context)

class TopBar extends StatefulWidget implements PreferredSizeWidget {
  final void Function(String section) onNav;
  const TopBar({super.key, required this.onNav});

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  // ✅ بدل النصوص الثابتة خلينا نخزن الـ keys
  final List<String> items = [
    "cover",
    "about",
    "education",
    "skills",
    "experience",
    "services",
    "projects",
    "achievements",
    // "testimonials",
    "contact",
  ];

  String hoveredItem = "";

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 980;

    return AppBar(
      backgroundColor: AppColors.background.withOpacity(0.9),
      elevation: 2,
      title: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Ahmed'.tr(context),
              style: TextStyle(
                color: AppColors.primary,
                fontSize: isMobile ? 16 : 20, // ✅ صغير على الموبايل
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: 'Khames'.tr(context),
              style: TextStyle(
                color: AppColors.secondary,
                fontSize: isMobile ? 16 : 20, // ✅ صغير على الموبايل
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      actions: [
        if (isMobile) ...[
          // ✅ أول حاجة: أيقونة المينيو
          PopupMenuButton<String>(
            onSelected: widget.onNav,
            itemBuilder:
                (c) =>
                    items
                        .map(
                          (e) => PopupMenuItem<String>(
                            value: e,
                            child: Text(
                              e.tr(context), // ✅ ترجمة من JSON
                              style: TextStyle(color: AppColors.textPrimary),
                            ),
                          ),
                        )
                        .toList(),
            icon: Icon(Icons.menu, color: AppColors.textPrimary),
          ),
          const SizedBox(width: 8),

          // ✅ بعد كدا: أيقونة اللغة
          BlocBuilder<LocaleCubit, LocaleState>(
            builder: (context, state) {
              if (state is ChangeLocaleState) {
                return IconButton(
                  icon: Icon(Icons.language, color: AppColors.primary),
                  onPressed: () {
                    final newLang =
                        state.locale.languageCode == "en" ? "ar" : "en";
                    BlocProvider.of<LocaleCubit>(
                      context,
                    ).changeLanguage(newLang);
                  },
                );
              }
              return const SizedBox();
            },
          ),
          const SizedBox(width: 8),
        ] else ...[
          // ✅ Desktop: روابط مترجمة
          Row(
            children:
                items.map((e) {
                  final isHovered = hoveredItem == e;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      onEnter: (_) => setState(() => hoveredItem = e),
                      onExit: (_) => setState(() => hoveredItem = ""),
                      child: GestureDetector(
                        onTap: () => widget.onNav(e),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color:
                                    isHovered
                                        ? AppColors.primary
                                        : Colors.transparent,
                                width: 2,
                              ),
                            ),
                          ),
                          child: Text(
                            e.tr(context), // ✅ ترجمة من JSON
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color:
                                  isHovered
                                      ? AppColors.primary
                                      : AppColors.textPrimary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
          ),
          const SizedBox(width: 16),

          // ✅ أيقونة اللغة بعد اللينكات
          BlocBuilder<LocaleCubit, LocaleState>(
            builder: (context, state) {
              if (state is ChangeLocaleState) {
                return IconButton(
                  icon: Icon(Icons.language, color: AppColors.primary),
                  onPressed: () {
                    final newLang =
                        state.locale.languageCode == "en" ? "ar" : "en";
                    BlocProvider.of<LocaleCubit>(
                      context,
                    ).changeLanguage(newLang);
                  },
                );
              }
              return const SizedBox();
            },
          ),
          const SizedBox(width: 16),
        ],
      ],
    );
  }
}
