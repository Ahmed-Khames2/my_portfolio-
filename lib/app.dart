// app.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portfolio2/core/app_locallizatin.dart';
import 'package:my_portfolio2/core/cubit/locale_cubit.dart';
import 'package:my_portfolio2/core/theme/app_theme.dart';
import 'package:my_portfolio2/core/theme/bloc/theme_bloc.dart';
import 'package:my_portfolio2/pages/portfolio_page.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';

class PortfolioDemoApp extends StatelessWidget {
  const PortfolioDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider<LocaleCubit>(create: (_) => LocaleCubit()),
        BlocProvider<ThemeBloc>(create: (_) => ThemeBloc()..add(GetCuurrentThemeEvent())),
      ],
      child: BlocBuilder<LocaleCubit, LocaleState>(
        builder: (context, localeState) {
          return BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, themeState) {
              ThemeData lightTheme = appThemeData[AppTheme.todoLight]!;
              ThemeData darkTheme = appThemeData[AppTheme.todoDark]!;

              ThemeMode themeMode = ThemeMode.system;
              if (themeState is LoadingThemeState) {
                themeMode = themeState.appTheme == AppTheme.todoLight
                    ? ThemeMode.light
                    : ThemeMode.dark;
              }

              return MaterialApp(
                locale: localeState is ChangeLocaleState
                    ? localeState.locale
                    : const Locale('en', 'US'),
                supportedLocales: const [Locale('en', 'US'), Locale('ar', '')],
                localizationsDelegates: const [
                  AppLocalization.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                localeResolutionCallback: (deviceLocale, supportedLocales) {
                  if (deviceLocale != null) {
                    for (var locale in supportedLocales) {
                      if (locale.languageCode == deviceLocale.languageCode) {
                        return locale;
                      }
                    }
                  }
                  return supportedLocales.first;
                },
                title: 'Ahmed Khames Portfolio',
                debugShowCheckedModeBanner: false,
                theme: lightTheme,
                darkTheme: darkTheme,
                themeMode: themeMode,
                home: const PortfolioOnePage(),
              );
            },
          );
        },
      ),
    );
  }
}
