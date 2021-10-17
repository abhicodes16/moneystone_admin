import 'package:flutter/material.dart';
import 'package:moneystone_admin/screens/login.dart';
import 'package:moneystone_admin/style/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rupees Plant',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kThemeColor,
        primarySwatch: Colors.green,
      ),
      home: Login(),
    );
  }
}
