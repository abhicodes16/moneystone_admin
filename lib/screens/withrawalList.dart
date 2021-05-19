import 'package:flutter/material.dart';
import 'package:moneystone_admin/style/Palette.dart';
import 'package:moneystone_admin/style/constants.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Status', style: Palette.title),
                  )),
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
                    var tranactionDate = withdrawalrData[index]['userDetails']['phone'];

                    var accountName = withdrawalrData[index]['bankDetails']['accountName'];
                    var mobile = withdrawalrData[index]['bankDetails']['mobile'];
                    var email = withdrawalrData[index]['bankDetails']['email'];
                    var bankAccount = withdrawalrData[index]['bankDetails']['bankAccount'];
                    var bankName = withdrawalrData[index]['bankDetails']['bankName'];
                    var upiId = withdrawalrData[index]['bankDetails']['upiId'];
                    var ifsc = withdrawalrData[index]['bankDetails']['ifsc'];
                    
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('$status', style: Palette.title),
                          ),
                        ),
                        Container(
                          child: InkWell(
                            child: CircleAvatar(
                              radius: 22.0,
                              backgroundColor: Colors.amber[50],
                              child: Icon(Icons.edit),
                            ),
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) => AddUser(
                              //         isUpdate: true,
                              //         id: id,
                              //         phone: phone,
                              //         name: name,
                              //         pass: password,
                              //         device: device,
                              //         team: team,
                              //         wallet: wallet,
                              //       ),
                              //     ));
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
}
