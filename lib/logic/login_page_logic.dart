import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todos_exercise/l10n/localization_intl.dart';
import 'package:flutter_todos_exercise/model/login_page_model.dart';
import 'package:flutter_todos_exercise/widgets/net_loading_widget.dart';

///Created by apple on 2020-03-18.
class LoginPageLogic {
  final LoginPageModel _model;

  LoginPageLogic(this._model);

  void onExit() {
    _model.currentAnimation = "move_out";
    _model.showLoginWidget = false;
    _model.refresh();
  }

  String validatorEmail(String email) {
    final context = _model.context;
    _model.isEmailOk = false;
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (email.isEmpty)
      return IntlLocalizations.of(context).emailCantBeEmpty;
    else if (!regex.hasMatch(email))
      return IntlLocalizations.of(context).emailIncorrectFormat;
    else {
      _model.isEmailOk = true;
      return null;
    }
  }

  String validatePassword(String password) {
    final context = _model.context;
    _model.isPasswordOk = false;
    if (password.isEmpty) {
      return IntlLocalizations.of(context).passwordCantBeEmpty;
    } else if (password.length < 8) {
      return IntlLocalizations.of(context).passwordTooShort;
    } else if (password.length > 20) {
      return IntlLocalizations.of(context).passwordTooLong;
    } else {
      _model.isPasswordOk = true;
      return null;
    }
  }

  void onLogin() {
    final context = _model.context;
    _model.formKey.currentState.validate();
    if (!_model.isEmailOk || !_model.isPasswordOk) {
      _showDialog(
          IntlLocalizations.of(context).checkYourEmailOrPassword, context);
      return;
    }
    showDialog(
        context: _model.context,
        builder: (ctx) {
          return NetLoadingWidget();
        });
    _onLoginRequest(context);
  }

  void _showDialog(String text, BuildContext context) {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            content: Text(text),
          );
        });
  }

  void _onLoginRequest(BuildContext context){

  }
}
