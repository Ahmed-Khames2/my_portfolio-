import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portfolio2/core/cubit/locale_cubit.dart';
import 'package:my_portfolio2/core/app_localization.dart';
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
    final colorScheme = Theme.of(context).colorScheme;

    Widget themeSwitch() {
      return BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          AppTheme currentTheme = AppTheme.todoLight;
          if (state is LoadingThemeState) currentTheme = state.appTheme;
          final isDark = currentTheme == AppTheme.todoDark;

          return IconButton(
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder:
                  (child, anim) =>
                      RotationTransition(turns: anim, child: child),
              child: Icon(
                isDark ? Icons.nightlight_round : Icons.wb_sunny,
                key: ValueKey(isDark),
                color: colorScheme.primary,
              ),
            ),
            onPressed: () {
              context.read<ThemeBloc>().add(
                ChangeThemeEvent(
                  isDark ? AppTheme.todoLight : AppTheme.todoDark,
                ),
              );
            },
          );
        },
      );
    }

    Widget languageIcon() {
      return BlocBuilder<LocaleCubit, LocaleState>(
        builder: (context, state) {
          final currentLang =
              state is ChangeLocaleState ? state.locale.languageCode : 'en';
          final newLang = currentLang == "en" ? "ar" : "en";

          return TextButton(
            onPressed:
                () => context.read<LocaleCubit>().changeLanguage(newLang),
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              foregroundColor: colorScheme.secondary,
            ),
            child: Text(
              currentLang.toUpperCase(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          );
        },
      );
    }

    Widget menuLinks() {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children:
            items.map((e) {
              final isHovered = hoveredItem == e;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  onEnter: (_) => setState(() => hoveredItem = e),
                  onExit: (_) => setState(() => hoveredItem = ""),
                  child: GestureDetector(
                    onTap: () => widget.onNav(e),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color:
                            isHovered
                                ? colorScheme.primary.withValues(alpha: 0.12)
                                : Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        e.tr(context),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight:
                              isHovered ? FontWeight.bold : FontWeight.w500,
                          color:
                              isHovered
                                  ? colorScheme.primary
                                  : colorScheme.onSurface,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
      );
    }

    return AppBar(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      scrolledUnderElevation: 4,
      elevation: 0,
      leadingWidth: 0,
      title:
          isMobile
              ? Row(
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Ahmed'.tr(context),
                          style: TextStyle(
                            color: colorScheme.primary,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Cairo',
                          ),
                        ),
                        const TextSpan(text: ' '),
                        TextSpan(
                          text: 'Khames'.tr(context),
                          style: TextStyle(
                            color: colorScheme.secondary,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Cairo',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  languageIcon(),
                  themeSwitch(),
                  PopupMenuButton<String>(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    onSelected: widget.onNav,
                    itemBuilder:
                        (c) =>
                            items
                                .map(
                                  (e) => PopupMenuItem<String>(
                                    value: e,
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.circle,
                                          size: 8,
                                          color: colorScheme.primary,
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          e.tr(context),
                                          style: TextStyle(
                                            color: colorScheme.onSurface,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                                .toList(),
                    icon: Icon(Icons.menu_rounded, color: colorScheme.onSurface),
                  ),
                ],
              )
              : Row(
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Ahmed'.tr(context),
                          style: TextStyle(
                            color: colorScheme.primary,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Cairo',
                          ),
                        ),
                        const TextSpan(text: ' '),
                        TextSpan(
                          text: 'Khames'.tr(context),
                          style: TextStyle(
                            color: colorScheme.secondary,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Cairo',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  menuLinks(),
                  const SizedBox(width: 12),
                  languageIcon(),
                  themeSwitch(),
                ],
              ),
    );
  }
}
