import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portfolio2/core/app_colors.dart';
import 'package:my_portfolio2/core/cubit/locale_cubit.dart';
import 'package:my_portfolio2/core/app_locallizatin.dart';
import 'package:my_portfolio2/core/theme/bloc/theme_bloc.dart';
import 'package:my_portfolio2/core/theme/app_theme.dart';

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
    "cover",
    "about",
    "education",
    "skills",
    "experience",
    "services",
    "projects",
    "achievements",
    "contact",
  ];

  String hoveredItem = "";

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 980;

    // ================= Theme Switch =================
    Widget themeSwitch() {
      return BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          AppTheme currentTheme = AppTheme.todoLight;
          if (state is LoadingThemeState) currentTheme = state.appTheme;

          return MouseRegion(
            cursor: SystemMouseCursors.click,
            child: TweenAnimationBuilder<double>(
              duration: const Duration(milliseconds: 150),
              tween: Tween(begin: 1.0, end: 1.0),
              builder: (context, scale, child) {
                return Transform.scale(
                  scale: scale,
                  child: Switch(
                    value: currentTheme == AppTheme.todoDark,
                    onChanged: (val) {
                      context.read<ThemeBloc>().add(
                        ChangeThemeEvent(
                          val ? AppTheme.todoDark : AppTheme.todoLight,
                        ),
                      );
                    },
                    activeColor: AppColors.lightPrimary,
                    inactiveThumbColor: AppColors.lightSecondary,
                    inactiveTrackColor: AppColors.lightSecondary.withOpacity(
                      0.3,
                    ),
                  ),
                );
              },
            ),
          );
        },
      );
    }

    // ================= Language Icon =================
    Widget languageIcon() {
      return BlocBuilder<LocaleCubit, LocaleState>(
        builder: (context, state) {
          final currentLang =
              state is ChangeLocaleState ? state.locale.languageCode : 'en';

          return MouseRegion(
            cursor: SystemMouseCursors.click,
            child: TweenAnimationBuilder<double>(
              duration: const Duration(milliseconds: 150),
              tween: Tween(begin: 1.0, end: 1.0),
              builder: (context, scale, child) {
                return Transform.scale(
                  scale: scale,
                  child: IconButton(
                    icon: Icon(Icons.language, color: AppColors.lightPrimary),
                    onPressed: () {
                      final newLang = currentLang == "en" ? "ar" : "en";
                      context.read<LocaleCubit>().changeLanguage(newLang);
                    },
                  ),
                );
              },
            ),
          );
        },
      );
    }

    // ================= Menu Links =================
    Widget menuLinks() {
      return Row(
        mainAxisSize: MainAxisSize.min,
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
                    child: TweenAnimationBuilder<double>(
                      duration: const Duration(milliseconds: 150),
                      tween: Tween(begin: 1.0, end: isHovered ? 1.05 : 1.0),
                      builder: (context, scale, child) {
                        return Transform.scale(
                          scale: scale,
                          child: Text(
                            e.tr(context),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color:
                                  isHovered
                                      ? AppColors.lightPrimary
                                      : AppColors.lightBackground,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              );
            }).toList(),
      );
    }

    return AppBar(
      backgroundColor: AppColors.lightTextPrimary.withOpacity(0.9),
      elevation: 2,
      leadingWidth: 0,
      title: Row(
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Ahmed'.tr(context),
                  style: TextStyle(
                    color: AppColors.lightPrimary,
                    fontSize: isMobile ? 16 : 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: 'Khames'.tr(context),
                  style: TextStyle(
                    color: AppColors.lightSecondary,
                    fontSize: isMobile ? 16 : 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          if (!isMobile) menuLinks(),
          if (isMobile)
            PopupMenuButton<String>(
              onSelected: widget.onNav,
              itemBuilder:
                  (c) =>
                      items
                          .map(
                            (e) => PopupMenuItem<String>(
                              value: e,
                              child: Text(
                                e.tr(context),
                                style: TextStyle(
                                  color: AppColors.lightBackground,
                                ),
                              ),
                            ),
                          )
                          .toList(),
              icon: Icon(Icons.menu, color: AppColors.lightBackground),
            ),
          languageIcon(),
          themeSwitch(),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}
