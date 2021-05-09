import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:moneystone_admin/screens/user/userlist.dart';
import 'package:moneystone_admin/style/Palette.dart';
import 'package:moneystone_admin/style/constants.dart';
import 'package:moneystone_admin/utils/common.dart';
import 'package:moneystone_admin/widgets/customTextField.dart';
import 'package:moneystone_admin/widgets/cutomePhoneTextField.dart';
import 'package:moneystone_admin/widgets/error_dialouge.dart';
import 'package:moneystone_admin/widgets/loadingDialog.dart';
import 'package:http/http.dart' as http;

class AddUser extends StatefulWidget {
  final bool isUpdate;
  final String id;
  final String phone;
  final String name;
  final String pass;
  final double device;
  final double team;
  final double wallet;

  AddUser(
      {this.isUpdate,
      this.id,
      this.phone,
      this.name,
      this.pass,
      this.device,
      this.team,
      this.wallet});

  @override
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  final GlobalKey<State> _errorKeyLoader = new GlobalKey<State>();

  //controller
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController deviceEarningContorller = TextEditingController();
  TextEditingController teamEarningContorller = TextEditingController();
  TextEditingController walletContorller = TextEditingController();

  var appbarTitle;

  @override
  void initState() {
    super.initState();
    if (widget.isUpdate) {
      appbarTitle = 'Update User';
      phoneController.text = widget.phone;
      nameController.text = widget.name;
      passwordController.text = widget.pass;
      deviceEarningContorller.text = widget.device.toString();
      teamEarningContorller.text = widget.team.toString();
      walletContorller.text = widget.wallet.toString();
    } else {
      appbarTitle = 'Add User';
    }
  }

  //---------------- build function ----------------//
  @override
  Widget build(BuildContext context) {
    //---------------- Scaffold ----------------//
    return Scaffold(
      appBar: AppBar(
        title: Text('$appbarTitle', style: Palette.appbarTitle),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 30.0),
          child: _cardWidget(),
        ),
      ),
    );
  }

  Widget _cardWidget() {
    return LayoutBuilder(builder: (context, constraits) {
      return Center(
        child: Container(
          width: constraits.maxWidth > 1200
              ? MediaQuery.of(context).size.width / 3
              : MediaQuery.of(context).size.width,
          child: Card(
            margin: EdgeInsets.all(25.0),
            shape: Palette.cardShape,
            shadowColor: Colors.amber[700],
            elevation: 18.0,
            child: Column(
              children: [
                SizedBox(height: 20.0),
                CustomPhoneTextField(
                  controller: phoneController,
                  hint: 'Mobile No.',
                ),
                SizedBox(height: 10.0),
                CustomTextField(
                  controller: nameController,
                  hint: 'Name',
                ),
                SizedBox(height: 10.0),
                CustomTextField(
                  controller: passwordController,
                  hint: 'Password',
                ),
                SizedBox(height: 30.0),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Device Earning',
                              style: Palette.title,
                            ),
                          ),
                          CustomTextField(
                            controller: deviceEarningContorller,
                            hint: '0.0',
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Team Earning',
                              style: Palette.title,
                            ),
                          ),
                          CustomTextField(
                            controller: teamEarningContorller,
                            hint: '0.0',
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Wallet Earning',
                              style: Palette.title,
                            ),
                          ),
                          CustomTextField(
                            controller: walletContorller,
                            hint: '0.0',
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.0),
                widget.isUpdate ? _updateDeleteBtnWidget() : _addBtnWidget(),
                SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _updateDeleteBtnWidget() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          SizedBox(width: 15.0),
          Expanded(
            child: MaterialButton(
              onPressed: () {
                _updateUserApi();
              },
              minWidth: 200.0,
              height: 55.0,
              elevation: 0.0,
              color: kThemeColor,
              shape: Palette.btnShape,
              child: Text('Update', style: Palette.blackBtn),
            ),
          ),
          SizedBox(width: 20.0),
          Expanded(
            child: MaterialButton(
              onPressed: () {
                deleteDialoge();
              },
              minWidth: 200.0,
              height: 55.0,
              elevation: 0.0,
              color: Colors.red[700],
              shape: Palette.btnShape,
              child: Text('Delete', style: Palette.whiteBtn),
            ),
          ),
          SizedBox(width: 15.0),
        ],
      ),
    );
  }

  Widget _addBtnWidget() {
    return MaterialButton(
      onPressed: () {
        _addUserApi();
      },
      minWidth: 200.0,
      height: 55.0,
      elevation: 0.0,
      color: kThemeColor,
      shape: Palette.btnShape,
      child: Text('Add', style: Palette.blackBtn),
    );
  }

  //
  /*--------------- Add user Calling -------------*/
  Future<String> _addUserApi() async {
    LoadingDialog.showLoadingDialog(context, _keyLoader);

    final String url = Common.USER;

    http.Response response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'phone': phoneController.text,
        "password": passwordController.text,
        'name': nameController.text,
        'device_earnings': deviceEarningContorller.text,
        'team_earnings': teamEarningContorller.text,
        'wallet': walletContorller.text
      }),
    );
    Map<String, dynamic> decode = json.decode(response.body);
    if (response.statusCode == 200) {
      Navigator.pop(_keyLoader.currentContext);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AllUsers()),
      );
    } else {
      Navigator.pop(_keyLoader.currentContext);
      ErrorDialouge.showErrorDialogue(
        context,
        _errorKeyLoader,
        decode['message'],
      );
    }
    debugPrint(response.body);
    return 'Success';
  }

  //
  /*--------------- Update user Calling -------------*/
  Future<String> _updateUserApi() async {
    LoadingDialog.showLoadingDialog(context, _keyLoader);

    final String url = Common.USER + '/${widget.id}';

    http.Response response = await http.patch(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'phone': phoneController.text,
        "password": passwordController.text,
        'name': nameController.text,
        'device_earnings': deviceEarningContorller.text,
        'team_earnings': teamEarningContorller.text,
        'wallet': walletContorller.text
      }),
    );
    Map<String, dynamic> decode = json.decode(response.body);
    if (response.statusCode == 200) {
      Navigator.pop(_keyLoader.currentContext);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AllUsers()),
      );
    } else {
      Navigator.pop(_keyLoader.currentContext);
      ErrorDialouge.showErrorDialogue(
        context,
        _errorKeyLoader,
        decode['message'],
      );
    }
    debugPrint(response.body);
    return 'Success';
  }

  //
  /*--------------- delete user Calling -------------*/
  Future<String> deleteUser() async {
    LoadingDialog.showLoadingDialog(context, _keyLoader);

    final String url = Common.USER + '/${widget.id}';

    http.Response response = await http.delete(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    Map<String, dynamic> decode = json.decode(response.body);
    if (response.statusCode == 200) {
      Navigator.pop(_keyLoader.currentContext);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AllUsers()),
      );
    } else {
      Navigator.pop(_keyLoader.currentContext);
      ErrorDialouge.showErrorDialogue(
        context,
        _errorKeyLoader,
        decode['message'],
      );
    }
    debugPrint(response.body);
    return 'Success';
  }

  //delete dialogue
  void deleteDialoge() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        //title: Text('Do you want to exit an App', style: _subTitle,),
        content: Text(
          'Are you sure to Delete user..!',
          style: Palette.title,
        ),
        actions: <Widget>[
          MaterialButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('No'),
          ),
          MaterialButton(
            onPressed: () {
              deleteUser();
            },
            child: Text('Yes', style: TextStyle(color: kThemeColor)),
          ),
        ],
      ),
    );
  }
}
