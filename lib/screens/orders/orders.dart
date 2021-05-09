import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:moneystone_admin/style/Palette.dart';
import 'package:moneystone_admin/utils/common.dart';
import 'package:moneystone_admin/widgets/drawer.dart';
import 'package:http/http.dart' as http;

class Orders extends StatefulWidget {
  Orders({Key key}) : super(key: key);

  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  List productData = [];
  bool isLoading;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    this._getOrderList();
  }

  //---------------- build function ----------------//
  @override
  Widget build(BuildContext context) {
    //---------------- Scaffold ----------------//
    return Scaffold(
      drawer: DrawerMenu(),
      appBar: AppBar(
        title: Text('Product List', style: Palette.appbarTitle),
        
      ),
      body: SingleChildScrollView(
        child: _ordersCardWidget(),
      ),
    );
  }

  Widget _ordersCardWidget() {
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
                  Container(
                    width: 80.0,
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Image', style: Palette.title),
                  ),
                  SizedBox(width: 10.0),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('User Name', style: Palette.title),
                  )),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Mobile No.', style: Palette.title),
                  )),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Order At', style: Palette.title),
                  )),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Product Name', style: Palette.title),
                  )),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Price', style: Palette.title),
                  )),
                
                  Container(
                    child: InkWell(
                      child: CircleAvatar(
                        radius: 22.0,
                        backgroundColor: Colors.amber[50],
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

          //Listview - All user list
          !isLoading
              ? ListView.separated(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: productData.length,
                  itemBuilder: (BuildContext context, int index) {
                    var seq = index + 1;
                    var id = productData[index]['_id'];
                    var image = productData[index]['orderDetails']['image'];
                    var userName = productData[index]['userName'];
                    var userPhone = productData[index]['userPhone'];
                    var orderDateTime = productData[index]['orderDateTime'];
                    var productName = productData[index]['orderDetails']['productName'];
                    var price = productData[index]['orderDetails']['price'] ?? '';

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
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          height: 80.0,
                          width: 80.0,
                          child: Image.network('$image'),
                        ),
                        SizedBox(width: 10.0),

                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('$userName', style: Palette.title),
                        )),

                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('$productName', style: Palette.title),
                        )),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('$orderDateTime', style: Palette.title),
                        )),

                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('$productName', style: Palette.title),
                        )),
                        
                  
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('$price', style: Palette.title),
                          ),
                        ),
                        Container(
                          child: InkWell(
                            child: CircleAvatar(
                              radius: 22.0,
                              backgroundColor: Colors.amber[50],
                              child: Icon(Icons.more_vert_outlined),
                            ),
                            onTap: () {},
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

  Future<String> _getOrderList() async {
    final String url = Common.ORDER;

    http.Response response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      setState(() {
        isLoading = false;
        productData = json.decode(response.body);
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