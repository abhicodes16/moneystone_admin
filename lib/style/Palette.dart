import 'package:flutter/material.dart';

import 'constants.dart';

class Palette {
  static TextStyle appbarTitle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 18.0,
  );

  static TextStyle header = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 18.0,
  );
  static TextStyle subTitle = TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 12.0,
  );

  static TextStyle subTitle2 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 12.0,
  );

  static TextStyle title2 = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 14.0,
  );

  static TextStyle themeTitle = TextStyle(
    fontWeight: FontWeight.w700,
    color: kThemeColor,
    fontSize: 18.0,
  );

  static TextStyle themeBtnText = TextStyle(
    fontWeight: FontWeight.w700,
    color: kThemeColor,
    fontSize: 15.0,
  );

  static TextStyle whiteHeader = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 30.0,
    color: Colors.white,
  );

  static TextStyle whiteHeader2 = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 20.0,
    color: Colors.white,
  );

  static TextStyle whiteHeader3 = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 18.0,
    color: Colors.white,
  );

  static TextStyle header2 = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 18.0,
  );

  static TextStyle whiteContent = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14.0,
    color: Colors.white,
  );

  static TextStyle whiteSubTitleB = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 14.0,
    color: Colors.white,
  );
  static TextStyle whiteSubTitledashboard = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 11.0,
    color: Colors.white,
  );

  static TextStyle whiteSubTitleS = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 10.0,
    color: Colors.white,
  );

  static TextStyle whiteSubTitle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 13.0,
    color: Colors.white,
  );

  static TextStyle whiteSubTitle2 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 12.0,
    color: Colors.white,
  );

  static TextStyle themeColorSubTitle = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 12.0,
    color: kThemeColor,
  );

  static TextStyle whiteTitle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16.0,
    color: Colors.white,
  );

  static TextStyle whiteTitleB = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 16.0,
    color: Colors.white,
  );

  static TextStyle whiteTitle2 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 14.0,
    color: Colors.white,
  );

  static TextStyle whiteBtn = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 15.0,
    color: Colors.white,
  );

  static TextStyle blackBtn = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 15.0,
    color: Colors.black,
  );

  static TextStyle title = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 16.0,
  );

  static TextStyle btnTextMagento = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 16.0,
    color: kDarkThemeColor,
  );

  static BoxDecoration unitGradient = BoxDecoration(
      color: Colors.pink[50],
      borderRadius: BorderRadius.all(Radius.circular(5.0)));

  static TextStyle listTileTitle =
      TextStyle(fontWeight: FontWeight.w600);

  static TextStyle listTileSubTitle =
      TextStyle(fontWeight: FontWeight.w500);

  static BoxDecoration appbarGradient = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        kThemeColor,
        kDarkThemeColor,
      ],
    ),
  );

  static BoxDecoration pageGradient = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        kDarkThemeColor,
        kDarkThemeColor,
        kThemeColor,
        kThemeColor,
      ],
    ),
  );

  static LinearGradient headerGradientCont = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      kDarkThemeColor,
      kDarkThemeColor,
      kThemeColor,
    ],
  );

  static RoundedRectangleBorder cardShape =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0));

  static RoundedRectangleBorder btnShape =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0));
  static RoundedRectangleBorder seachBoxCardShape =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0));

  static RoundedRectangleBorder topCardShape =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0));

  static EdgeInsets productNameMargin = EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0);

  //dashboard grid theme
  static TextStyle catName = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 14.0,
  );

  static TextStyle catField = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 14.0,
  );

  static EdgeInsets fourlineListPadding =
      EdgeInsets.fromLTRB(15.0, 3.0, 10.0, 2.0);

  static TextStyle listHeader = TextStyle(fontSize: 17.0, fontWeight: FontWeight.w700);

  static TextStyle trailing = TextStyle(
    fontWeight: FontWeight.w600,
    color: Colors.blue,
    fontSize: 14.0,
  );

  static TextStyle subTitleIncome = TextStyle(fontWeight: FontWeight.w500, fontSize: 13.0);

  static TextStyle greenTrailing = TextStyle(
      fontWeight: FontWeight.w600,
      color: Colors.green[700],
      fontSize: 16.0);

  static TextStyle textFieldStyle = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 16.0,
  );
}
