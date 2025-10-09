import 'package:flutter/material.dart';
import 'app_localization.dart';
import 'app_localization_ar.dart';
import 'app_localization_en.dart';

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['ar', 'en'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalization> load(Locale locale) async {
    switch (locale.languageCode) {
      case 'ar':
        return AppLocalizationAr();
      case 'en':
        return AppLocalizationEn();
      default:
        return AppLocalizationAr();
    }
  }

  @override
  bool shouldReload(AppLocalizationDelegate old) => false;
}

extension LocalizationContext on BuildContext {
  AppLocalization get loc {
    return Localizations.of<AppLocalization>(this, AppLocalization)!;
  }
}

