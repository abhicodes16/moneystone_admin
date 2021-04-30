import 'package:flutter/material.dart';
import 'package:moneystone_admin/style/Palette.dart';
import 'package:moneystone_admin/style/constants.dart';

class ErrorDialouge {
  static Future<void> showErrorDialogue(
      BuildContext context, GlobalKey key, String mesasge) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return new WillPopScope(
          onWillPop: () async => false,
          child: SimpleDialog(
            key: key,
            //backgroundColor: Colors.white,
            children: <Widget>[
              Center(
                child: Column(
                  children: [
                    SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
                      child: Text(
                        mesasge,
                        style: Palette.title,
                      ),
                    ),
                    SizedBox(height: 12.0),
                    Padding(
                      padding: kStandardMargin,
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        shape: Palette.btnShape,
                        color: kThemeColor,
                        child: Text('RETRY', style: Palette.whiteSubTitleB),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
