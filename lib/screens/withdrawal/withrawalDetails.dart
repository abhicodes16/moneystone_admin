import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:moneystone_admin/screens/withdrawal/withrawalList.dart';
import 'package:moneystone_admin/style/Palette.dart';
import 'package:moneystone_admin/style/constants.dart';
import 'package:moneystone_admin/utils/common.dart';
import 'package:moneystone_admin/widgets/error_dialouge.dart';
import 'package:moneystone_admin/widgets/loadingDialog.dart';
import 'package:http/http.dart' as http;

class WithrawalDetails extends StatefulWidget {
  final withrawalId;
  final name;
  final phone;
  final amount;
  final tranactionDate;
  final status;
  final accountName;
  final mobile;
  final email;
  final bankAccount;
  final bankName;
  final upiId;
  final ifsc;

  WithrawalDetails({
    this.withrawalId,
    this.name,
    this.phone,
    this.amount,
    this.tranactionDate,
    this.status,
    this.accountName,
    this.mobile,
    this.email,
    this.bankAccount,
    this.bankName,
    this.upiId,
    this.ifsc,
  });

  @override
  _WithrawalDetailsState createState() => _WithrawalDetailsState();
}

class _WithrawalDetailsState extends State<WithrawalDetails> {
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  final GlobalKey<State> _errorKeyLoader = new GlobalKey<State>();

  List<String> _statusOption = ['Approved', 'Pending', 'Cancel'];
  String _selectedStatus;

  @override
  void initState() {
    super.initState();
    _selectedStatus = widget.status;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Withrawals', style: Palette.appbarTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20.0),
            _userDetailsWidget(),
            SizedBox(height: 20.0),
            _userBankDetailsWidget(),
            SizedBox(height: 40.0),
            _dropDownWidget(),
            SizedBox(height: 50.0),
            _updateBtnWidget(),
            SizedBox(height: 30.0),
          ],
        ),
      ),
    );
  }

  Widget _userDetailsWidget() {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Center(
          child: Container(
            width: constraints.maxWidth > 1200
                ? MediaQuery.of(context).size.width / 3
                : MediaQuery.of(context).size.width,
            child: Card(
              margin: EdgeInsets.all(25.0),
              elevation: 18.0,
              shape: Palette.cardShape,
              shadowColor: Colors.amber[700],
              child: Column(
                children: <Widget>[
                  SizedBox(height: 10.0),
                  Padding(
                    padding: kStandardMargin * 2,
                    child: Row(
                      children: [
                        Expanded(child: Text('Name', style: Palette.title)),
                        SizedBox(width: 10.0),
                        Expanded(
                          child: Text('${widget.name}', style: Palette.title),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: kStandardMargin * 2,
                    child: Row(
                      children: [
                        Expanded(
                            child: Text('Mobile No.', style: Palette.title)),
                        SizedBox(width: 10.0),
                        Expanded(
                            child:
                                Text('${widget.phone}', style: Palette.title)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: kStandardMargin * 2,
                    child: Row(
                      children: [
                        Expanded(
                            child: Text('Request Date', style: Palette.title)),
                        SizedBox(width: 10.0),
                        Expanded(
                            child: Text('${widget.tranactionDate}',
                                style: Palette.title)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: kStandardMargin * 2,
                    child: Row(
                      children: [
                        Expanded(child: Text('Amount', style: Palette.title)),
                        SizedBox(width: 10.0),
                        Expanded(
                            child: Text(
                          '$kCurrency ${widget.amount}',
                          style: Palette.title,
                        )),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _userBankDetailsWidget() {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Center(
          child: Container(
            width: constraints.maxWidth > 1200
                ? MediaQuery.of(context).size.width / 3
                : MediaQuery.of(context).size.width,
            child: Card(
              margin: EdgeInsets.all(25.0),
              elevation: 18.0,
              shape: Palette.cardShape,
              shadowColor: Colors.amber[700],
              child: Column(
                children: <Widget>[
                  SizedBox(height: 10.0),
                  Padding(
                    padding: kStandardMargin * 2,
                    child: Row(
                      children: [
                        Expanded(
                            child: Text('Account Name', style: Palette.title)),
                        SizedBox(width: 10.0),
                        Expanded(
                          child: Text('${widget.accountName}',
                              style: Palette.title),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: kStandardMargin * 2,
                    child: Row(
                      children: [
                        Expanded(child: Text('Mobile', style: Palette.title)),
                        SizedBox(width: 10.0),
                        Expanded(
                            child:
                                Text('${widget.mobile}', style: Palette.title)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: kStandardMargin * 2,
                    child: Row(
                      children: [
                        Expanded(child: Text('Email', style: Palette.title)),
                        SizedBox(width: 10.0),
                        Expanded(
                            child:
                                Text('${widget.email}', style: Palette.title)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: kStandardMargin * 2,
                    child: Row(
                      children: [
                        Expanded(
                            child: Text('Bank Account', style: Palette.title)),
                        SizedBox(width: 10.0),
                        Expanded(
                            child: Text(
                          '${widget.bankAccount}',
                          style: Palette.title,
                        )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: kStandardMargin * 2,
                    child: Row(
                      children: [
                        Expanded(
                            child: Text('Bank Name', style: Palette.title)),
                        SizedBox(width: 10.0),
                        Expanded(
                            child: Text(
                          '${widget.bankName}',
                          style: Palette.title,
                        )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: kStandardMargin * 2,
                    child: Row(
                      children: [
                        Expanded(child: Text('UPI ID', style: Palette.title)),
                        SizedBox(width: 10.0),
                        Expanded(
                            child: Text(
                          '${widget.upiId}',
                          style: Palette.title,
                        )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: kStandardMargin * 2,
                    child: Row(
                      children: [
                        Expanded(child: Text('IFSC', style: Palette.title)),
                        SizedBox(width: 10.0),
                        Expanded(
                            child: Text(
                          '${widget.ifsc}',
                          style: Palette.title,
                        )),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _dropDownWidget() {
    return Center(
      child: DropdownButton(
        hint: Text('Select Status'), // Not necessary for Option 1
        value: _selectedStatus,
        onChanged: (newValue) {
          setState(() {
            _selectedStatus = newValue;
          });
        },
        items: _statusOption.map((location) {
          return DropdownMenuItem(
            child: new Text(location),
            value: location,
          );
        }).toList(),
      ),
    );
  }

  Widget _updateBtnWidget() {
    return Center(
      child: MaterialButton(
        onPressed: () {
          _updateWithrawalApi();
        },
        minWidth: 200.0,
        height: 55.0,
        elevation: 0.0,
        color: kThemeColor,
        shape: Palette.btnShape,
        child: Text('Update Withrawal', style: Palette.blackBtn),
      ),
    );
  }

  /*--------------- Update user Calling -------------*/
  Future<String> _updateWithrawalApi() async {
    LoadingDialog.showLoadingDialog(context, _keyLoader);

    final String url = Common.WITHRAWAL + '/${widget.withrawalId}';

    http.Response response = await http.patch(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'status': _selectedStatus,
      }),
    );
    Map<String, dynamic> decode = json.decode(response.body);
    if (response.statusCode == 200) {
      Navigator.pop(_keyLoader.currentContext);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WithrawalList()),
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
}
