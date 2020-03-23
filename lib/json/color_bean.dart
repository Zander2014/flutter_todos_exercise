import 'dart:convert';

import 'package:flutter/material.dart';

class ColorBean {
  int red;
  int green;
  int blue;
  double opacity;

  ColorBean({this.red, this.green, this.blue, this.opacity});

  static Color fromBean(ColorBean bean) =>
      Color.fromRGBO(bean.red, bean.green, bean.blue, bean.opacity);

  static ColorBean fromJson(Map<String, dynamic> map) {
    if (map == null) return null;
    if (map.isEmpty) return null;
    ColorBean bean = ColorBean();
    bean.red = map['red'] is int ? map['red'] : int.parse(map['red']);
    bean.green = map['green'] is int ? map['green'] : int.parse(map['green']);
    bean.blue = map['blue'] is int ? map['blue'] : int.parse(map['blue']);
    bean.opacity = map['opacity'] is double
        ? map['opacity']
        : double.parse(map['opacity']);
    return bean;
  }

  static ColorBean fromColor(Color color) {
    ColorBean colorBean = ColorBean();
    colorBean.opacity = color.opacity;
    colorBean.red = color.red;
    colorBean.green = color.green;
    colorBean.blue = color.blue;
    return colorBean;
  }

  Map<String, dynamic> toJson() {
    return {
      'red': red.toString(),
      'green': green.toString(),
      'blue': blue.toString(),
      'opacity': opacity.toString()
    };
  }

  bool equalTo(other) => this == other;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ColorBean &&
          runtimeType == other.runtimeType &&
          red == other.red &&
          green == other.green &&
          blue == other.blue &&
          opacity == other.opacity;

  @override
  int get hashCode =>
      red.hashCode ^ green.hashCode ^ blue.hashCode ^ opacity.hashCode;
}
