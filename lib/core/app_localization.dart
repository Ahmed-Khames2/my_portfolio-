import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// فئة دعم الترجمة للتطبيق
class AppLocalization {
  // لغة الترجمة الحالية
  final Locale locale;

  // المُنشئ يأخذ لغة الترجمة
  AppLocalization(this.locale);

  // طريقة للوصول إلى الترجمة من خلال سياق البناء (BuildContext)
  static AppLocalization? of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  // التفويض الخاص بالترجمة
  static const LocalizationsDelegate<AppLocalization> delegate = _AppLocalizationDelegate();

  // خريطة لتخزين الترجمات (المفتاح والقيمة)
  late Map<String, String> _localizedValues;

  // تحميل ملف JSON الخاص باللغة وتعيين الترجمات في الخريطة
  Future<void> loadLanguage() async {
    String jsonString = await rootBundle.loadString('assets/lang/${locale.languageCode}.json');
    Map<String, dynamic> mappedJson = json.decode(jsonString);
    _localizedValues = mappedJson.map((key, value) => MapEntry(key, value.toString()));
  }

  // طريقة لاسترجاع الترجمة باستخدام المفتاح
  String translate(String key) {
    return _localizedValues[key] ?? key; // إرجاع المفتاح نفسه إذا لم توجد ترجمة
  }
}

// التفويض الخاص بعملية الترجمة
class _AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const _AppLocalizationDelegate();
  
  // تحديد اللغات المدعومة
  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode);
  }

  // تحميل الترجمات للغة المعطاة
  @override
  Future<AppLocalization> load(Locale locale) async {
    AppLocalization localization = AppLocalization(locale);
    await localization.loadLanguage();
    return localization;
  }

  // لا يلزم إعادة تحميل التفويض عند عدم تغييره
  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalization> old) => false;
}

// امتداد لتسهيل استخدام الترجمة في النصوص
extension TranslateX on String {
  // يعيد الترجمة المقابلة للنص في سياق معين
  String tr(BuildContext context) {
    return AppLocalization.of(context)?.translate(this) ?? this;
  }
}
