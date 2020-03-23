
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_todos_exercise/json/color_bean.dart';
import 'package:flutter_todos_exercise/l10n/localization_intl.dart';
import 'package:flutter_todos_exercise/model/global_model.dart';
import 'package:flutter_todos_exercise/model/login_page_model.dart';
import 'package:flutter_todos_exercise/utils/theme_utils.dart';
import 'package:provider/provider.dart';

///Created by apple on 2020-03-17.
class LoginPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<LoginPageModel>(context)..setContext(context);
    final globalModel = Provider.of<GlobalModel>(context);
    final bgColor = globalModel.logic.getBgInDark();

    bool isDarkNow = globalModel.currentThemeBean.themeType == MyTheme.darkTheme;
    final iconColor = isDarkNow ? ColorBean.fromBean(globalModel.currentThemeBean.colorBean) : Theme.of(context).primaryColor;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        title: Text(
          IntlLocalizations.of(context).login,
          style: TextStyle(color: iconColor),
        ),
        elevation: 0.0,
        leading: model.isFirst ? Container() : IconButton(
          icon: Icon(Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios, color: iconColor),
          onPressed: model.logic.onExit,
        ),
      ),
    );
  }
}