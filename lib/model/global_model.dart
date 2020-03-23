
import 'package:flutter/material.dart';
import 'package:flutter_todos_exercise/json/color_bean.dart';
import 'package:flutter_todos_exercise/json/theme_bean.dart';
import 'package:flutter_todos_exercise/logic/global_logic.dart';
import 'package:flutter_todos_exercise/utils/theme_utils.dart';

class GlobalModel extends ChangeNotifier{
  GlobalLogic logic;
  BuildContext context;

  /// app的名字
  String appName = '一日';

  /// 当前的主题颜色数据
  ThemeBean currentThemeBean = ThemeBean(
    themeName: 'pink',
    colorBean: ColorBean.fromColor(MyThemeColor.defaultColor),
    themeType: MyTheme.defaultTheme
  );

  /// 当前语言
  List<String> currentLanguageCode = ['zh', 'CN'];
  String currentLanguage = '中文';
  Locale currentLocale;

  ///是否开启首页动画
  bool enableSplashAnimation = true;

  ///是否进入登录页
  bool goToLogin;

  void setContext(BuildContext context){
    if(this.context == null){
      this.context = context;
      Future.wait([
        logic.getCurrentTheme(),
      ]).then((value){
        logic.chooseTheme();
        currentLocale = Locale(currentLanguageCode[0]);

      });
    }
  }
}