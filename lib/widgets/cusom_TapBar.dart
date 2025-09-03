import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portfolio2/core/app_colors.dart';
import 'package:my_portfolio2/core/cubit/locale_cubit.dart';

class TopBar extends StatefulWidget implements PreferredSizeWidget {
  final void Function(String section) onNav;
  const TopBar({super.key, required this.onNav});

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  final List<String> items = [
    'Cover',
    'About',
    'Education',
    'Skills',
    'Experience',
    'Services',
    'Projects',
    'Achievements',
    'Testimonials',
    'Contact',
  ];

  String hoveredItem = "";

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background.withOpacity(0.9),
      elevation: 2,
      title: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Ahmed ',
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: 'Khames',
              style: TextStyle(
                color: AppColors.secondary,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      actions: [
        LayoutBuilder(
          builder: (ctx, c) {
            final compact = MediaQuery.of(ctx).size.width < 980;
            if (compact) {
              return PopupMenuButton<String>(
                onSelected: widget.onNav,
                itemBuilder:
                    (c) =>
                        items
                            .map(
                              (e) => PopupMenuItem<String>(
                                value: e,
                                child: Text(
                                  e,
                                  style: TextStyle(
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                icon: Icon(Icons.menu, color: AppColors.textPrimary),
              );
            }
            return Row(
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
                              e,
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
            );
          },
        ),
        const SizedBox(width: 16),

        /// 🌐 Dropdown لتغيير اللغة بالأعلام
        BlocBuilder<LocaleCubit, LocaleState>(
          builder: (context, state) {
            if (state is ChangeLocaleState) {
              return DropdownButton<String>(
                value: state.locale.languageCode,
                underline: const SizedBox(),
                icon: Icon(Icons.language, color: AppColors.primary),

                /// 👇 العناصر داخل القائمة
                items: [
                  DropdownMenuItem(
                    value: 'en',
                    child: Row(
                      children: [
                        const Text("🇺🇸 ", style: TextStyle(fontSize: 18)),
                        Text(
                          "English",
                          style: TextStyle(color: AppColors.textPrimary),
                        ),
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'ar',
                    child: Row(
                      children: [
                        const Text("🇪🇬 ", style: TextStyle(fontSize: 18)),
                        Text(
                          "العربية",
                          style: TextStyle(color: AppColors.textPrimary),
                        ),
                      ],
                    ),
                  ),
                ],
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    BlocProvider.of<LocaleCubit>(
                      context,
                    ).changeLanguage(newValue);
                  }
                },
              );
            }
            return const SizedBox();
          },
        ),

        const SizedBox(width: 16),
      ],
    );
  }
}
