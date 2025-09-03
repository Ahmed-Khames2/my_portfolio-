import 'dart:ui';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// import 'package:cubit_progect2/widgets/lang_cache_helper.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:my_portfolio2/core/widgets/lang_cache_helper.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(LocaleInitial());

  // تحميل اللغة المحفوظة من الكاش وتغيير الحالة
  Future<void> getSavedLanguage() async {
    final String cachedLanguageCode = await LangCacheHelper().getCachedLanguageCode();
    emit(ChangeLocaleState(Locale(cachedLanguageCode)));
  }

  // تغيير اللغة وتخزين الرمز الجديد في الكاش
  Future<void> changeLanguage(String languageCode) async {
    await LangCacheHelper().cacheLanguageCode(languageCode);
    emit(ChangeLocaleState(Locale(languageCode)));
  }
}
