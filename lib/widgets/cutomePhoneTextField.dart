import 'package:flutter/material.dart';
import 'package:moneystone_admin/style/Palette.dart';
import 'package:moneystone_admin/style/constants.dart';

class CustomPhoneTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  const CustomPhoneTextField({this.controller, this.hint});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.phone,
        style: Palette.textFieldStyle,
        onChanged: (value) {},
        decoration: InputDecoration(
          isDense: true,
          hintText: '$hint',
          hintStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16.0,
          ),
          prefixIcon: Text("     +91",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 15.5,
              )),
          prefixIconConstraints: BoxConstraints(minWidth: 50, minHeight: 0),
          contentPadding: const EdgeInsets.all(kPaddingM),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(10.0),
            ),
            borderSide: BorderSide(
              //color: Colors.red.withOpacity(0.12),
              color: Colors.green[200],
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(10.0),
            ),
            borderSide: BorderSide(
              color: Colors.green[50],
            ),
          ),
          filled: true,
          fillColor: Colors.green[50],
        ),
      ),
    );
  }
}
