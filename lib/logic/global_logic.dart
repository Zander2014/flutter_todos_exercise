import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_todos_exercise/config/keys.dart';
import 'package:flutter_todos_exercise/json/color_bean.dart';
import 'package:flutter_todos_exercise/json/theme_bean.dart';
import 'package:flutter_todos_exercise/model/global_model.dart';
import 'package:flutter_todos_exercise/utils/shared_util.dart';
import 'package:flutter_todos_exercise/utils/theme_utils.dart';

class GlobalLogic{
  final GlobalModel _model;

  GlobalLogic(this._model);

  /// 当为夜间模式的时候，白色背景替换为特定灰色
  Color getBgInDark(){
    final themeType = _model.currentThemeBean.themeType;
    return themeType == MyTheme.darkTheme ? Colors.grey[800] : Colors.white;
  }

  ///获取当前的主题数据
  Future getCurrentTheme() async{
    final theme = await SharedUtil.instance.getString(Keys.currentThemeBean);
    if(theme == null) return;
    ThemeBean themeBean = ThemeBean.fromJson(jsonDecode(theme));
    if(themeBean.themeType == MyTheme.random){
      themeBean.colorBean = ColorBean.fromColor(Colors.primaries[Random().nextInt(Colors.primaries.length)]);
    }else if(themeBean.themeType == _model.currentThemeBean.themeType) return;
    _model.currentThemeBean = themeBean;
  }

  ///根据数据来决定显示什么主题
  void chooseTheme(){

  }


}