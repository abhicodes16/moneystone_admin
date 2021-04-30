import 'package:flutter/material.dart';

import 'constants.dart';

class Palette {
  static TextStyle appbarTitle = TextStyle(
    fontFamily: kFontLato,
    fontWeight: FontWeight.w600,
    fontSize: 18.0,
  );

  static TextStyle appbarTitleWhite = TextStyle(
    fontFamily: kFontLato,
    fontWeight: FontWeight.w600,
    fontSize: 18.0,
    color: Colors.white,
  );

  static TextStyle header = TextStyle(
    fontFamily: kFontLato,
    fontWeight: FontWeight.w700,
    fontSize: 18.0,
  );
  static TextStyle subTitle = TextStyle(
    fontFamily: kFontLato,
    fontWeight: FontWeight.w300,
    fontSize: 12.0,
  );

  static TextStyle subTitle2 = TextStyle(
    fontFamily: kFontLato,
    fontWeight: FontWeight.w400,
    fontSize: 12.0,
  );
  static TextStyle subTitle2Black = TextStyle(
    fontFamily: kFontLato,
    fontWeight: FontWeight.w400,
    fontSize: 12.0,
    color: Colors.black
  );

  static TextStyle title2 = TextStyle(
    fontFamily: kFontLato,
    fontWeight: FontWeight.w600,
    fontSize: 14.0,
  );

  static TextStyle whiteHeader = TextStyle(
    fontFamily: kFontLato,
    fontWeight: FontWeight.w700,
    fontSize: 30.0,
    color: Colors.white,
  );

  static TextStyle whiteHeader2 = TextStyle(
    fontFamily: kFontLato,
    fontWeight: FontWeight.w600,
    fontSize: 20.0,
    color: Colors.white,
  );

  static TextStyle whiteBtnTxt = TextStyle(
    fontFamily: kFontLato,
    fontWeight: FontWeight.w700,
    fontSize: 16.0,
    color: Colors.white,
  );

  static TextStyle header2 = TextStyle(
    fontFamily: kFontLato,
    fontWeight: FontWeight.w700,
    fontSize: 18.0,
  );

  static TextStyle whiteContent = TextStyle(
    fontFamily: kFontLato,
    fontWeight: FontWeight.w400,
    fontSize: 14.0,
    color: Colors.white,
  );

  static TextStyle whiteSubTitleB = TextStyle(
    fontFamily: kFontLato,
    fontWeight: FontWeight.w500,
    fontSize: 14.0,
    color: Colors.white,
  );

  static TextStyle themeTxt = TextStyle(
    fontFamily: kFontLato,
    fontWeight: FontWeight.w500,
    fontSize: 14.0,
    color: cThemePink,
  );
  static TextStyle themeBlueTxt = TextStyle(
    fontFamily: kFontLato,
    fontWeight: FontWeight.w500,
    fontSize: 14.0,
    color: cDarkBlue,
  );

  static TextStyle themeTxtPinkB = TextStyle(
    fontFamily: kFontLato,
    fontWeight: FontWeight.w700,
    fontSize: 14.0,
    color: cThemePink,
  );

  static TextStyle themeTxtPink = TextStyle(
    fontFamily: kFontLato,
    fontWeight: FontWeight.w700,
    fontSize: 12.0,
    color: cThemePink,
  );

  static TextStyle themeTxt2 = TextStyle(
    fontFamily: kFontLato,
    fontWeight: FontWeight.w700,
    fontSize: 16.0,
    color: cThemeBlue,
  );

  static TextStyle whiteSubTitleS = TextStyle(
    fontFamily: kFontLato,
    fontWeight: FontWeight.w500,
    fontSize: 10.0,
    color: Colors.white,
  );

  static TextStyle themeColorSubTitle = TextStyle(
    fontFamily: kFontLato,
    fontWeight: FontWeight.w700,
    fontSize: 12.0,
    color: cThemeBlue,
  );

  static TextStyle whiteTitle = TextStyle(
    fontFamily: kFontLato,
    fontWeight: FontWeight.w500,
    fontSize: 16.0,
    color: Colors.white,
  );

  static TextStyle whiteTitle2 = TextStyle(
    fontFamily: kFontLato,
    fontWeight: FontWeight.w500,
    fontSize: 14.0,
    color: Colors.white,
  );

  static TextStyle title = TextStyle(
    fontFamily: kFontLato,
    fontWeight: FontWeight.w600,
    fontSize: 16.0,
  );
  static TextStyle titleblack = TextStyle(
    fontFamily: kFontLato,
    fontWeight: FontWeight.w600,
    fontSize: 16.0,
    color: Colors.black
  );

  static TextStyle titleTheme = TextStyle(
    fontFamily: kFontLato,
    fontWeight: FontWeight.w600,
    fontSize: 16.0,
    color: cDarkBlue,
  );

  static TextStyle themeBtnTxt = TextStyle(
    fontFamily: kFontLato,
    fontWeight: FontWeight.bold,
    color: cDarkPink,
    fontSize: 16.0,
  );

  static TextStyle btnTextMagento = TextStyle(
    fontFamily: kFontLato,
    fontWeight: FontWeight.w600,
    fontSize: 16.0,
    color: cDarkPink,
  );

  static TextStyle listTileTitle =
      TextStyle(fontFamily: kFontLato, fontWeight: FontWeight.w600);

  static TextStyle listTileSubTitle =
      TextStyle(fontFamily: kFontLato, fontWeight: FontWeight.w500);

  static BoxDecoration appbarGradient = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [cDarkPink, cThemeBlue],
    ),
  );

  static BoxDecoration pageGradient = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [cDarkPink, cThemeBlue],
    ),
  );

  static BoxDecoration unitGradient = BoxDecoration(
      color: Colors.pink[50],
      borderRadius: BorderRadius.all(Radius.circular(5.0)));

  static LinearGradient headerGradientCont = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      cDarkPink,
      cDarkPink,
      cThemeBlue,
    ],
  );

  static RoundedRectangleBorder cardShape =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0));

  static RoundedRectangleBorder btnShape =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0));
  static RoundedRectangleBorder seachBoxCardShape =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0));

  static RoundedRectangleBorder topCardShape =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0));

  static EdgeInsets productNameMargin = EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0);

  //dashboard grid theme
  static TextStyle catName = TextStyle(
    fontFamily: kFontLato,
    fontWeight: FontWeight.w500,
    fontSize: 14.0,
  );

  static TextStyle catField = TextStyle(
    fontFamily: kFontLato,
    fontWeight: FontWeight.w700,
    fontSize: 14.0,
  );

  //List UI
  static TextStyle listHeader = TextStyle(
    fontFamily: kFontLato,
    fontSize: 17.0,
    fontWeight: FontWeight.w700,
  );

  static TextStyle listTitle = TextStyle(
    fontFamily: kFontLato,
    fontWeight: FontWeight.w600,
  );

  static TextStyle listSubTitle = TextStyle(
    fontFamily: kFontLato,
    fontWeight: FontWeight.w500,
    fontSize: 12.0,
  );
  static TextStyle listTrailing1 = TextStyle(
    fontFamily: kFontLato,
    fontWeight: FontWeight.w700,
    color: cThemeBlue,
  );
  static TextStyle listTrailing = TextStyle(
    fontFamily: kFontLato,
    fontWeight: FontWeight.w500,
    fontSize: 12.0,
  );
  static TextStyle listTrailing2 = TextStyle(
    fontFamily: kFontLato,
    fontWeight: FontWeight.w600,
    fontSize: 10.0,
    color: Colors.white,
  );

  static TextStyle statusClr = TextStyle(
    fontFamily: kFontLato,
    fontWeight: FontWeight.w600,
    fontSize: 12.0,
    color: Colors.white,
  );

  static TextStyle listSubTrailing = TextStyle(
    fontFamily: kFontLato,
    fontWeight: FontWeight.w500,
    fontSize: 10.0,
  );

  static TextStyle listFieldsText = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    fontFamily: kFontLato,
  );
  static TextStyle listBodyText = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w700,
    fontFamily: kFontLato,
  );
}
