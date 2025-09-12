// main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portfolio2/app.dart';
import 'package:my_portfolio2/core/cubit/locale_cubit.dart';
import 'package:my_portfolio2/core/theme/bloc/theme_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LocaleCubit()..getSavedLanguage(),
        ),
        BlocProvider(
          create: (context) => ThemeBloc()..add(GetCuurrentThemeEvent()),
        ),
      ],
      child: const PortfolioDemoApp(),
    ),
  );
}
