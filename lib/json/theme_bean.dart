import 'color_bean.dart';

class ThemeBean {
  String themeName;
  String themeType;
  ColorBean colorBean;

  ThemeBean({this.themeName, this.themeType, this.colorBean});

  ThemeBean.fromJson(Map<String, dynamic> json) {    
    this.themeName = json['themeName'];
    this.themeType = json['themeType'];
    this.colorBean = json['colorBean'] != null ? ColorBean.fromJson(json['colorBean']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['themeName'] = this.themeName;
    data['themeType'] = this.themeType;
    if (this.colorBean != null) {
      data['colorBean'] = this.colorBean.toJson();
    }
    return data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ThemeBean &&
              runtimeType == other.runtimeType &&
              themeName == other.themeName;

  @override
  int get hashCode => themeName.hashCode;
}
