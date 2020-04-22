import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class ThemeModel with ChangeNotifier {

  bool _userDarkMode;
  MaterialColor _themeColor;
  int _fontIndex;

  static const fontValueList = ['system', 'kuaile'];

  int get fontIndex => _fontIndex;

   ThemeModel() {
      /// 用户选择的明暗模式
      _userDarkMode = false;

      /// 获取主题色
      _themeColor = Colors.primaries[4];

      /// 获取字体
      _fontIndex = 0;
  }

  //isDark: 表示是否是暗黑模式
  ThemeData themeData({bool platformDarkModel = false}) {
    var isDark = platformDarkModel || _userDarkMode;
    Brightness brightness = isDark ? Brightness.dark : Brightness.light;
    var themeColor = _themeColor;
    var accentColor = isDark ? themeColor[700] : _themeColor;

    var themeData = ThemeData(
      brightness:brightness,
      accentColor: accentColor,
      primarySwatch: themeColor,
      fontFamily: fontValueList[0]
    );

    themeData = themeData.copyWith(
      brightness: brightness,
      accentColor: accentColor,
      cupertinoOverrideTheme: CupertinoThemeData(
        primaryColor: themeColor,
        brightness: brightness,
      ),

      appBarTheme: themeData.appBarTheme.copyWith(elevation: 0),
      splashColor: themeColor.withAlpha(50),
      hintColor: themeData.hintColor.withAlpha(90),
      errorColor: Colors.red,
      cursorColor: accentColor,
      textTheme: themeData.textTheme.copyWith(
        /// 解决中文hint不居中的问题 https://github.com/flutter/flutter/issues/40248
          subhead: themeData.textTheme.subhead
              .copyWith(textBaseline: TextBaseline.alphabetic)),
      textSelectionColor: accentColor.withAlpha(60),
      textSelectionHandleColor: accentColor.withAlpha(60),
      toggleableActiveColor: accentColor,
      chipTheme: themeData.chipTheme.copyWith(
        pressElevation: 0,
        padding: EdgeInsets.symmetric(horizontal: 10),
        labelStyle: themeData.textTheme.caption,
        backgroundColor: themeData.chipTheme.backgroundColor.withOpacity(0.1),
      ),
//          textTheme: CupertinoTextThemeData(brightness: Brightness.light)
      // inputDecorationTheme: ThemeHelper.inputDecorationTheme(themeData),
    );
    return themeData;


  }





}