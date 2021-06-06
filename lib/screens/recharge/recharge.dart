import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:moneystone_admin/style/Palette.dart';
import 'package:moneystone_admin/style/constants.dart';
import 'package:moneystone_admin/utils/common.dart';
import 'package:http/http.dart' as http;
import 'package:moneystone_admin/widgets/drawer.dart';

class Recharge extends StatefulWidget {
  Recharge({Key key}) : super(key: key);

  @override
  _RechargeState createState() => _RechargeState();
}

class _RechargeState extends State<Recharge> {
  List rechargeData = [];
  bool isLoading;
  List<dynamic> filterlist = [];

  TextEditingController controller = TextEditingController();
  String filter = "";

  @override
  void initState() {
    List<dynamic> tmpList = List<dynamic>();
    for (int i = 0; i < rechargeData.length; i++) {
      tmpList.add(rechargeData[i]);
    }
    setState(() {
      rechargeData = tmpList;
      filterlist = rechargeData;

      controller.addListener(() {
        if (controller.text.isEmpty) {
          setState(() {
            filter = "";
            filterlist = rechargeData;
          });
        } else {
          setState(() {
            filter = controller.text;
          });
        }
      });
    });
    super.initState();
    isLoading = true;
    this._getRechargeList();
  }

  //---------------- build function ----------------//
  @override
  Widget build(BuildContext context) {
    //search function
    if ((filter.isNotEmpty)) {
      List<dynamic> tmpList = List<dynamic>();
      for (int i = 0; i < filterlist.length; i++) {
        if (filterlist[i]['userDetails']['name']
            .toLowerCase()
            .contains(filter.toLowerCase())) {
          tmpList.add(filterlist[i]);
        } else if (filterlist[i]['userDetails']['phone']
            .toLowerCase()
            .contains(filter.toLowerCase())) {
          tmpList.add(filterlist[i]);
        }
      }
      filterlist = tmpList;
    }

    return Scaffold(
      drawer: DrawerMenu(),
      appBar: AppBar(
        title: Text('Recharge List', style: Palette.appbarTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: kStandardMargin * 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  margin: EdgeInsets.only(top: 5),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.black38.withAlpha(10),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          controller: controller,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            hintText: "Search",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            _rechargeCardWidget(),
          ],
        ),
        //child: _allWidthrawalListWidget(),
      ),
    );
  }

  Widget _rechargeCardWidget() {
    return Card(
      margin: EdgeInsets.all(30.0),
      shape: Palette.cardShape,
      shadowColor: Colors.amber[700],
      elevation: 18.0,
      child: Column(
        children: <Widget>[
          Card(
            elevation: 0.0,
            margin: EdgeInsets.zero,
            shape: Palette.cardShape,
            color: Colors.amber[50],
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Row(
                children: <Widget>[
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
                    child: Text('$kCurrency Amount', style: Palette.title),
                  )),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Date', style: Palette.title),
                  )),
                  SizedBox(width: 10.0),
                  Container(
                    child: InkWell(
                      child: CircleAvatar(
                        radius: 22.0,
                        backgroundColor: Colors.amber[50],
                        //child: Icon(Icons.more_vert_outlined),
                      ),
                      onTap: () {},
                    ),
                  ),
                  SizedBox(width: 10.0),
                ],
              ),
            ),
          ),

          SizedBox(height: 15.0),

          !isLoading 
          ? ListView.separated(
            primary: false,
                  shrinkWrap: true,
                  itemCount: rechargeData != null ? filterlist.length : 0,
                  itemBuilder: (BuildContext context, int index) {

                    var seq = index + 1;  
                    var id = filterlist[index]['_id'];

                    var amount = filterlist[index]['amount'];
                    var status = filterlist[index]['status'] ?? '';
                    var name = filterlist[index]['userDetails']['name'];
                    var phone = filterlist[index]['userDetails']['phone'];
                    var tranactionDate = filterlist[index]['transactionDate'];

                    return Row(
                      children: [
                        SizedBox(width: 10.0),
                        Container(
                          width: 50.0,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('$seq', style: Palette.title),
                          ),
                        ),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('$phone', style: Palette.title),
                        )),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('$name', style: Palette.title),
                        )),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('$amount', style: Palette.title),
                        )),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('$tranactionDate', style: Palette.title),
                        )),
                        SizedBox(width: 10.0),
                       
                      ],
                    );
                  },
                   separatorBuilder: (BuildContext context, int index) {
                    return Divider();
                  },
          ) : Container(
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

  Future<String> _getRechargeList() async {
    final String url = Common.RECHARGE;

    http.Response response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      setState(() {
        isLoading = false;
        rechargeData = json.decode(response.body);
        filterlist = rechargeData;
      });
    } else {
      setState(() {
        isLoading = true;
      });
    }

    print(response.body);

    return 'Suceess';
  }

}
