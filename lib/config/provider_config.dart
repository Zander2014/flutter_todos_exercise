
import 'package:flutter/material.dart';
import 'package:flutter_todos_exercise/model/global_model.dart';
import 'package:flutter_todos_exercise/model/login_page_model.dart';
import 'package:flutter_todos_exercise/model/main_page_model.dart';
import 'package:flutter_todos_exercise/pages/main/login_page.dart';
import 'package:flutter_todos_exercise/pages/main/main_page.dart';
import 'package:provider/provider.dart';

class ProviderConfig{
  static ProviderConfig _instance;

  static ProviderConfig getInstance(){
    if(_instance == null){
      _instance = ProviderConfig._internal();
    }
    return _instance;
  }

  ProviderConfig._internal();

  ///全局provider
  ChangeNotifierProvider<GlobalModel> getGlobal(Widget child){
    return ChangeNotifierProvider<GlobalModel>(
      create: (context) => GlobalModel(),
      child: child,
    );
  }

  ///主页provider
  ChangeNotifierProvider<MainPageModel> getMainPage(){
    return ChangeNotifierProvider<MainPageModel>(
      create: (context) => MainPageModel(),
      child: MainPage(),
    );
  }

  ///登录页provider
  ChangeNotifierProvider<LoginPageModel> getLoginPage({bool isFirst = false}){
    return ChangeNotifierProvider<LoginPageModel>(
      create: (context) => LoginPageModel(isFirst: isFirst),
      child: LoginPage(),
    );
  }

}