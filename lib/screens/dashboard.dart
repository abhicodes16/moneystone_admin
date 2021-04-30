import 'package:flutter/material.dart';
import 'package:moneystone_admin/style/Palette.dart';
import 'package:moneystone_admin/widgets/drawer.dart';

class Dashborad extends StatefulWidget {
  Dashborad({Key key}) : super(key: key);

  @override
  _DashboradState createState() => _DashboradState();
}

class _DashboradState extends State<Dashborad> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(),
      appBar: AppBar(
        title: Text('Dashboard', style: Palette.appbarTitle),
      ),
      body: Center(
        child: Text('Comming soon..!', style: Palette.header),
      ),
    );
  }
}
