import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:moneystone_admin/style/Palette.dart';
import 'package:moneystone_admin/style/constants.dart';
import 'package:moneystone_admin/utils/common.dart';
import 'package:moneystone_admin/widgets/drawer.dart';

class AllUsers extends StatefulWidget {
  AllUsers({Key key}) : super(key: key);

  @override
  _AllUsersState createState() => _AllUsersState();
}

class _AllUsersState extends State<AllUsers> {
  List userData = [];
  bool isLoading;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    this._getAllUserList();
  }

  //---------------- build function ----------------//
  @override
  Widget build(BuildContext context) {
    //---------------- Scaffold ----------------//
    return Scaffold(
      drawer: DrawerMenu(),
      appBar: AppBar(
        title: Text('All Users', style: Palette.appbarTitle),
      ),
      body: SingleChildScrollView(
        child: _allUserCardWidget(),
      ),
    );
  }

  Widget _allUserCardWidget() {
    return Card(
      margin: EdgeInsets.all(30.0),
      shape: Palette.cardShape,
      shadowColor: Colors.amber[700],
      elevation: 18.0,
      child: Column(
        children: [
          Card(
            elevation: 0.0,
            margin: EdgeInsets.zero,
            shape: Palette.cardShape,
            color: Colors.amber[50],
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Row(
                children: [
                  SizedBox(width: 10.0),
                  Container(
                      width: 50.0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('No. ', style: Palette.title),
                      )),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Mobile No.', style: Palette.title),
                  )),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Name', style: Palette.title),
                  )),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('$kCurrency Device', style: Palette.title),
                  )),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('$kCurrency Team', style: Palette.title),
                  )),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('$kCurrency Wallet', style: Palette.title),
                  )),
                  SizedBox(width: 10.0),
                ],
              ),
            ),
          ),
          SizedBox(height: 15.0),

          //Listview - All user list
          isLoading
              ? ListView.separated(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: [
                        SizedBox(width: 10.0),
                        Container(
                          width: 50.0,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('1', style: Palette.title),
                          ),
                        ),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('94095565656', style: Palette.title),
                        )),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Abhi', style: Palette.title),
                        )),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('25', style: Palette.title),
                        )),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('0', style: Palette.title),
                        )),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('10', style: Palette.title),
                          ),
                        ),
                        SizedBox(width: 10.0),
                      ],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider();
                  },
                )
              : Container(
                  height: 300.0,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
          SizedBox(height: 15.0),
        ],
      ),
    );
  }

  Future<String> _getAllUserList() async {
    final String url = Common.USER;

    http.Response response = await http.get(
      Uri.parse(url),
      headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      setState(() {
        isLoading = false;
        //userData = json.decode(response.body);
      });
    } else {
      setState(() {
        isLoading = true;
      });
    }

    print(response);

    return 'Suceess';
  }
}
