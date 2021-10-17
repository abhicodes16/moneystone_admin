import 'package:flutter/material.dart';
import 'package:moneystone_admin/screens/orders/orders.dart';
import 'package:moneystone_admin/screens/product/addProduct.dart';
import 'package:moneystone_admin/screens/dashboard.dart';
import 'package:moneystone_admin/screens/login.dart';
import 'package:moneystone_admin/screens/product/product.dart';
import 'package:moneystone_admin/screens/recharge/recharge.dart';
import 'package:moneystone_admin/screens/user/userlist.dart';
import 'package:moneystone_admin/screens/withdrawal/withrawalList.dart';
import 'dart:convert';

import 'package:moneystone_admin/style/Palette.dart';

class DrawerMenu extends StatefulWidget {
  //const DrawerMenu({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DrawerMenuItem();
  }
}

class DrawerMenuItem extends State<DrawerMenu> {
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  TextStyle _drawerText = TextStyle(
    fontWeight: FontWeight.w600,
  );

  EdgeInsets _five = EdgeInsets.all(5.0);

  @override
  Widget build(BuildContext context) {
    /*------------------- Menu Drawer ---------------------*/
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            //decoration: decoration,
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.black,
              child: Image.asset(
                'assets/img/logo.png',
                height: 50.0,
                width: 50.0,
              ),
            ),
            accountEmail: null,
            accountName: Text(
              'Rupees Plant',
              style: Palette.title,
            ),
          ),
          // ListTile(
          //   title: Text(
          //     "Dashboard",
          //     style: _drawerText,
          //   ),
          //   leading: Icon(Icons.dashboard_outlined),
          //   onTap: () => Navigator.push(
          //       context, MaterialPageRoute(builder: (context) => Dashborad())),
          // ),
          // Divider(),
          ListTile(
            title: Text(
              "Withrawal",
              style: _drawerText,
            ),
            leading: Icon(Icons.dashboard_outlined),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => WithrawalList())),
          ),
          Divider(),
          ListTile(
            title: Text(
              "All User",
              style: _drawerText,
            ),
            leading: Icon(Icons.people),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => AllUsers())),
          ),
          Divider(),
          ListTile(
            title: Text(
              "Products",
              style: _drawerText,
            ),
            leading: Icon(Icons.list_alt),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => Product())),
          ),
          Divider(),
          ListTile(
            title: Text(
              "Recharge",
              style: _drawerText,
            ),
            leading: Icon(Icons.money_sharp),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => Recharge())),
          ),
          Divider(),
          ListTile(
            title: Text(
              "Orders",
              style: _drawerText,
            ),
            leading: Icon(Icons.pending_actions_rounded),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => Orders())),
          ),
          Divider(),
          SizedBox(height: MediaQuery.of(context).size.height / 2.5),
          Divider(),
          ListTile(
            title: Text(
              "Logout",
              style: _drawerText,
            ),
            leading: Icon(Icons.logout),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Login()),
                (route) => false,
              );
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}
