import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:moneystone_admin/style/Palette.dart';
import 'package:moneystone_admin/style/constants.dart';
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

  List<dynamic> filterlist = [];

  TextEditingController controller = TextEditingController();
  String filter = "";

  @override
  void initState() {
    List<dynamic> tmpList = List<dynamic>();
    for (int i = 0; i < productData.length; i++) {
      tmpList.add(productData[i]);
    }
    setState(() {
      productData = tmpList;
      filterlist = productData;

      controller.addListener(() {
        if (controller.text.isEmpty) {
          setState(() {
            filter = "";
            filterlist = productData;
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
    this._getOrderList();
  }

  //---------------- build function ----------------//
  @override
  Widget build(BuildContext context) {
    if ((filter.isNotEmpty)) {
      List<dynamic> tmpList = List<dynamic>();
      for (int i = 0; i < filterlist.length; i++) {
        if (filterlist[i]['userName']
            .toLowerCase()
            .contains(filter.toLowerCase())) {
          tmpList.add(filterlist[i]);
        } else if (filterlist[i]['userPhone']
            .toLowerCase()
            .contains(filter.toLowerCase())) {
          tmpList.add(filterlist[i]);
        }
      }
      filterlist = tmpList;
    }

    //---------------- Scaffold ----------------//
    return Scaffold(
      drawer: DrawerMenu(),
      appBar: AppBar(
        title: Text('Product List', style: Palette.appbarTitle),
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
            _ordersCardWidget(),
          ],
        ),
      ),
    );
  }

  Widget _ordersCardWidget() {
    return Card(
      margin: EdgeInsets.all(30.0),
      shape: Palette.cardShape,
      shadowColor: Colors.green[700],
      elevation: 18.0,
      child: Column(
        children: [
          Card(
            elevation: 0.0,
            margin: EdgeInsets.zero,
            shape: Palette.cardShape,
            color: Colors.green[50],
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
                        backgroundColor: Colors.green[50],
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
                  itemCount: productData != null ? filterlist.length : 0,
                  itemBuilder: (BuildContext context, int index) {
                    var seq = index + 1;
                    var id = filterlist[index]['_id'];
                    var image = filterlist[index]['orderDetails']['image'];
                    var userName = filterlist[index]['userName'];
                    var userPhone = filterlist[index]['userPhone'];
                    var orderDateTime = filterlist[index]['orderDateTime'];
                    var productName =
                        filterlist[index]['orderDetails']['productName'];
                    var price =
                        filterlist[index]['orderDetails']['price'] ?? '';

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
                          child: Text('$userPhone', style: Palette.title),
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
                              backgroundColor: Colors.green[50],
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
        filterlist = productData;
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
