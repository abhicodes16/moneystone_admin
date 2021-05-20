import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:moneystone_admin/screens/withdrawal/withrawalDetails.dart';
import 'package:moneystone_admin/style/Palette.dart';
import 'package:moneystone_admin/style/constants.dart';
import 'package:moneystone_admin/utils/common.dart';
import 'package:moneystone_admin/widgets/drawer.dart';
import 'package:http/http.dart' as http;

class WithrawalList extends StatefulWidget {
  WithrawalList({Key key}) : super(key: key);

  @override
  _WithrawalListState createState() => _WithrawalListState();
}

class _WithrawalListState extends State<WithrawalList> {
  bool isLoading;
  List withdrawalrData = [];

  @override
  void initState() {
    super.initState();
    isLoading = true;
    this._withdrawalListApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(),
      appBar: AppBar(
        title: Text('Withrawals', style: Palette.appbarTitle),
      ),
      body: SingleChildScrollView(
        child: _allWidthrawalListWidget(),
      ),
    );
  }

  Widget _allWidthrawalListWidget() {
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
                    child: Text('$kCurrency Amount', style: Palette.title),
                  )),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Date', style: Palette.title),
                  )),
                  Container(
                      width: 100.0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Status', style: Palette.title),
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

          //Listview - All withrawal list
          !isLoading
              ? ListView.separated(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: withdrawalrData.length,
                  itemBuilder: (BuildContext context, int index) {
                    var seq = index + 1;
                    var id = withdrawalrData[index]['_id'];

                    var amount = withdrawalrData[index]['amount'];
                    var status = withdrawalrData[index]['status'] ?? '';
                    var name = withdrawalrData[index]['userDetails']['name'];
                    var phone = withdrawalrData[index]['userDetails']['phone'];
                    var tranactionDate = withdrawalrData[index]['requestTime'];

                    var accountName;
                    var mobile;
                    var email;
                    var bankAccount;
                    var bankName;
                    var upiId;
                    var ifsc;

                    if (withdrawalrData[index]['bankDetails'] == null) {
                      accountName = '-';
                      mobile = '-';
                      email = '-';
                      bankAccount = '-';
                      bankName = '-';
                      upiId = '-';
                      ifsc = '-';
                    } else {
                      accountName =
                          withdrawalrData[index]['bankDetails']['accountName'];
                      mobile = withdrawalrData[index]['bankDetails']['mobile'];
                      email = withdrawalrData[index]['bankDetails']['email'];
                      bankAccount =
                          withdrawalrData[index]['bankDetails']['bankAccount'];
                      bankName =
                          withdrawalrData[index]['bankDetails']['bankName'];
                      upiId = withdrawalrData[index]['bankDetails']['upiId'];
                      ifsc = withdrawalrData[index]['bankDetails']['ifsc'];
                    }

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
                        Container(
                          width: 100.0,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('$status', style: Palette.title),
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Container(
                          child: InkWell(
                            child: CircleAvatar(
                              radius: 22.0,
                              backgroundColor: Colors.amber[50],
                              child: Icon(Icons.edit),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WithrawalDetails(
                                    withrawalId: id,
                                    name: name,
                                    phone: phone,
                                    amount: amount,
                                    tranactionDate: tranactionDate,
                                    status: status,
                                    accountName: accountName,
                                    mobile: mobile,
                                    email: email,
                                    bankAccount: bankAccount,
                                    bankName: bankName,
                                    upiId: upiId,
                                    ifsc: ifsc,
                                  ),
                                ),
                              ).then((value) => _withdrawalListApi());  
                            },
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

  Future<String> _withdrawalListApi() async {
    final String url = Common.WITHRAWAL;

    http.Response response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      setState(() {
        isLoading = false;
        withdrawalrData = json.decode(response.body);
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
