import 'package:flutter/material.dart';
import 'package:moneystone_admin/screens/login.dart';
import 'package:moneystone_admin/screens/userlist.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Money Stone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: AllUsers(),
    );
  }
}
