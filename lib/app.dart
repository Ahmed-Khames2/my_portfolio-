import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portfolio2/core/app_locallizatin.dart';
import 'package:my_portfolio2/core/app_theme.dart';
import 'package:my_portfolio2/core/cubit/locale_cubit.dart';
import 'package:my_portfolio2/pages/portfolio_page.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_portfolio2/testpage.dart'; // ✅ الحل هنا


class PortfolioDemoApp extends StatelessWidget {
  const PortfolioDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, LocaleState>(
      builder: (context, state) {
        if (state is ChangeLocaleState) {
          return MaterialApp(
            locale: state.locale,
            supportedLocales: const [Locale('en', 'US'), Locale('ar', '')],
            localizationsDelegates: const [
              AppLocalization.delegate,
              GlobalMaterialLocalizations.delegate,//error here
              GlobalWidgetsLocalizations.delegate,//error here
              GlobalCupertinoLocalizations.delegate,//error here
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
            title: 'Portfolio Demo',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.darkTheme,
            home: const PortfolioOnePage(),
            // initialRoute: AppRoutes.home,
            // onGenerateRoute: AppRouteGenerator.generateRoute,
          );
        } else {
          return const SizedBox(); // شاشة مؤقتة أثناء التحميل
        }
      },
    );
    // return MaterialApp(
    //   title: 'Portfolio Demo',
    //   debugShowCheckedModeBanner: false,
    //   theme: AppTheme.darkTheme,
    //   home: const PortfolioOnePage(),
    // );
  }
}
