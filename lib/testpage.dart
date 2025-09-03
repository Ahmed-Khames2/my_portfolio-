import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portfolio2/core/app_locallizatin.dart';
import 'package:my_portfolio2/core/cubit/locale_cubit.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "title_home".tr(context), // ترجمة عنوان الصفحة الرئيسية
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocListener<LocaleCubit, LocaleState>(
            listener: (context, state) {
              // عند تغيير اللغة يتم الرجوع للخلف (إغلاق صفحة الإعدادات)
              if (state is ChangeLocaleState) {
                // Navigator.of(context).pop();
              }
            },
            child: BlocBuilder<LocaleCubit, LocaleState>(
              builder: (context, state) {
                if (state is ChangeLocaleState) {
                  return DropdownButton<String>(
                    // القيمة الافتراضية للغة هي رمز اللغة الحالي
                    value: state.locale.languageCode,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items:
                        ['ar', 'en'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        // تغيير اللغة عبر Bloc
                        BlocProvider.of<LocaleCubit>(
                          context,
                        ).changeLanguage(newValue);
                      }
                    },
                  );
                }
                // في حال لم يتم تحديد حالة تغيير اللغة، عرض SizedBox فارغ
                return const SizedBox();
              },
            ),
          ),
        ),
      ),
    );
  }
}
