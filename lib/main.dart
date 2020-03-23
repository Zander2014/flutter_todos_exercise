import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_todos_exercise/config/provider_config.dart';
import 'package:flutter_todos_exercise/l10n/localization_intl.dart';
import 'package:flutter_todos_exercise/model/global_model.dart';
import 'package:flutter_todos_exercise/pages/splash_page.dart';
import 'package:flutter_todos_exercise/utils/theme_utils.dart';
import 'package:provider/provider.dart';

void main() => runApp(ProviderConfig.getInstance().getGlobal(MyApp()));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<GlobalModel>(context)..setContext(context);
    return MaterialApp(
      title: model.appName,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        DemoLocalizationsDelegate(),
      ],
      supportedLocales: [
        const Locale('en', 'US'), //美国英语
        const Locale('zh', 'CN'), //中文简体
      ],
      localeResolutionCallback:
          (Locale locale, Iterable<Locale> supportedLocales) {
        debugPrint(
            "locale: $locale    sups: $supportedLocales  currentLocale:${model.currentLocale}");
        if (model.currentLocale == locale) return model.currentLocale;
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale == locale) {
            model.currentLocale = locale;
            model.currentLanguageCode = [
              locale.languageCode,
              locale.countryCode
            ];
            locale.countryCode == "CN"
                ? model.currentLanguage = "中文"
                : model.currentLanguage = "English";
            return model.currentLocale;
          }
        }
        if (model.currentLocale == null) {
          model.currentLocale = Locale('zh', 'CN');
          return model.currentLocale;
        }
        return model.currentLocale;
      },
      localeListResolutionCallback:
          (List<Locale> locales, Iterable<Locale> supportedLocales) {
        debugPrint("locatassss: $locales  sups: $supportedLocales");
        return model.currentLocale;
      },
      locale: model.currentLocale,
      theme: ThemeUtil.getInstance().getTheme(model.currentThemeBean),
      home: getHomePage(model.goToLogin, model.enableSplashAnimation),
    );
  }

  Widget getHomePage(bool goToLogin, bool enableSplashAnimation) {
    if(goToLogin == null) return Container();
    if(enableSplashAnimation) return SplashPage();
    return goToLogin ? ProviderConfig.getInstance().getLoginPage(isFirst: true) : ProviderConfig.getInstance().getMainPage();
  }
}
