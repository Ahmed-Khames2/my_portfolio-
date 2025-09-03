// import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LangCacheHelper {
  static const String _localeKey = "LOCALE";

  /// تقوم هذه الدالة بتخزين رمز اللغة في SharedPreferences.
  Future<void> cacheLanguageCode(String languageCode) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_localeKey, languageCode);
  }

  /// تقوم هذه الدالة باسترجاع رمز اللغة المخزن. 
  /// إذا لم يتم العثور على رمز، تعيد القيمة الافتراضية "en".
  Future<String> getCachedLanguageCode() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final cachedLanguageCode = sharedPreferences.getString(_localeKey);
    return cachedLanguageCode ?? "en";
  }
}
