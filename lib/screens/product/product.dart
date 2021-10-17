import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:moneystone_admin/screens/product/addProduct.dart';
import 'package:moneystone_admin/style/Palette.dart';
import 'package:moneystone_admin/utils/common.dart';
import 'package:moneystone_admin/widgets/drawer.dart';
import 'package:http/http.dart' as http;

class Product extends StatefulWidget {
  Product({Key key}) : super(key: key);

  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  List productData = [];
  bool isLoading;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    this._getProductList();
  }

  //---------------- build function ----------------//
  @override
  Widget build(BuildContext context) {
    //---------------- Scaffold ----------------//
    return Scaffold(
      drawer: DrawerMenu(),
      appBar: AppBar(
        title: Text('Product List', style: Palette.appbarTitle),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddProduct()),
              );
            },
          ),
          SizedBox(width: 20.0),
        ],
      ),
      body: SingleChildScrollView(
        child: _productsCardWidget(),
      ),
    );
  }

  Widget _productsCardWidget() {
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
                  // Container(
                  //   width: 80.0,
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Text('Image', style: Palette.title),
                  // ),
                  SizedBox(width: 10.0),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Product Name', style: Palette.title),
                  )),
                  // Expanded(
                  //     child: Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Text('Features', style: Palette.title),
                  // )),
                  // Expanded(
                  //     child: Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Text('Size', style: Palette.title),
                  // )),
                  // Expanded(
                  //     child: Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Text('Minimum', style: Palette.title),
                  // )),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Price', style: Palette.title),
                  )),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Status', style: Palette.title),
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
                  itemCount: productData.length,
                  itemBuilder: (BuildContext context, int index) {
                    var seq = index + 1;
                    var id = productData[index]['_id'];
                    //var image = productData[index]['image'];
                    var productName = productData[index]['productName'];
                    var featureOne = productData[index]['featureOne'] ?? '';
                    var featureTwo = productData[index]['featureTwo'] ?? '';
                    var height = productData[index]['height'] ?? '';
                    var length = productData[index]['length'] ?? '';
                    var width = productData[index]['width'] ?? '';
                    var minimum = productData[index]['minimum'] ?? '';
                    var price = productData[index]['price'] ?? '';
                    var status = productData[index]['status'] ?? '';
                    var details = productData[index]['details'] ?? '';

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
                        // Container(
                        //   padding: const EdgeInsets.all(8.0),
                        //   height: 80.0,
                        //   width: 80.0,
                        //   child: Image.network('$image'),
                        // ),
                        SizedBox(width: 10.0),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('$productName', style: Palette.title),
                        )),
                        // Expanded(
                        //     child: Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Text('$featureOne \n$featureTwo',
                        //       style: Palette.title),
                        // )),
                        // Expanded(
                        //     child: Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Text('$height H *$width W * $length L',
                        //       style: Palette.title),
                        // )),
                        // Expanded(
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(8.0),
                        //     child: Text('$minimum', style: Palette.title),
                        //   ),
                        // ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('$price', style: Palette.title),
                          ),
                        ),
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

  Future<String> _getProductList() async {
    final String url = Common.PRODUCT;

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
