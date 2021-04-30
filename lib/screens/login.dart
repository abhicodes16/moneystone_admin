import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:moneystone_admin/screens/dashboard.dart';
import 'package:moneystone_admin/style/Palette.dart';
import 'package:moneystone_admin/style/constants.dart';
import 'package:moneystone_admin/widgets/error_dialouge.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _obsecurePass = true;

  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  //Admin - Username & Password
  var adminUsername = "admin";
  var adminPassword = "Admin@12345";

  //---------------- build function ----------------//
  @override
  Widget build(BuildContext context) {
    //---------------- Scaffold ----------------//
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 50.0),
            _logoWidget(),
            SizedBox(height: 20.0),
            _cardWidget(),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }

  Widget _logoWidget() {
    return Container(
      height: 200.0,
      width: 200.0,
      margin: EdgeInsets.all(15.0),
      child: Image.asset('assets/img/logo.png'),
    );
  }

  Widget _cardWidget() {
    return LayoutBuilder(builder: (context, constraits) {
      return Center(
        child: Container(
          width: constraits.maxWidth > 800
              ? MediaQuery.of(context).size.width / 3
              : MediaQuery.of(context).size.width,
          child: Card(
            margin: EdgeInsets.all(25.0),
            shape: Palette.cardShape,
            shadowColor: Colors.amber[700],
            elevation: 18.0,
            child: Column(
              children: [
                SizedBox(height: 30.0),
                _lodinTextWidget(),
                SizedBox(height: 30.0),
                _usernameTextFieldWidget(),
                SizedBox(height: 10.0),
                _passTextFieldWidget(),
                SizedBox(height: 20.0),
                _loginBtnWidget(),
                SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _lodinTextWidget() {
    return Container(
      child: Text(
        'Welcome to Money Stone',
        style: TextStyle(
          fontFamily: kFontLato,
          fontWeight: FontWeight.bold,
          fontSize: 30.0,
        ),
      ),
    );
  }

  Widget _usernameTextFieldWidget() {
    return Padding(
      padding: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
      child: TextField(
        controller: usernameController,
        keyboardType: TextInputType.phone,
        style: Palette.textFieldStyle,
        onChanged: (value) {},
        decoration: InputDecoration(
          isDense: true,
          hintText: 'Username',
          hintStyle: TextStyle(
            fontFamily: kFontLato,
            fontWeight: FontWeight.w400,
            fontSize: 16.0,
          ),
          // prefixIcon: Text("     +91",
          //     style: TextStyle(
          //       fontFamily: kFontLato,
          //       fontWeight: FontWeight.w700,
          //       fontSize: 15.5,
          //     )),
          prefixIcon: Icon(
            Icons.person,
            color: Colors.black,
            size: 20.0,
          ),
          prefixIconConstraints: BoxConstraints(minWidth: 50, minHeight: 0),
          contentPadding: const EdgeInsets.all(kPaddingM),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(10.0),
            ),
            borderSide: BorderSide(
              //color: Colors.red.withOpacity(0.12),
              color: Colors.yellow[200],
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(10.0),
            ),
            borderSide: BorderSide(
              color: Colors.yellow[50],
            ),
          ),
          filled: true,
          fillColor: Colors.yellow[50],
        ),
      ),
    );
  }

  Widget _passTextFieldWidget() {
    return Padding(
      padding: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
      child: TextField(
        controller: passwordController,
        obscureText: _obsecurePass,
        style: Palette.textFieldStyle,
        onChanged: (value) {},
        decoration: InputDecoration(
          isDense: true,
          hintText: 'Password',
          hintStyle: TextStyle(
            fontFamily: kFontLato,
            fontWeight: FontWeight.w400,
            fontSize: 16.0,
          ),
          contentPadding: const EdgeInsets.all(kPaddingM),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(10.0),
            ),
            borderSide: BorderSide(
              //color: Colors.red.withOpacity(0.12),
              color: Colors.yellow[200],
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(10.0),
            ),
            borderSide: BorderSide(
              color: Colors.yellow[50],
            ),
          ),
          filled: true,
          fillColor: Colors.yellow[50],
          prefixIcon: Icon(
            Icons.lock_outline,
            color: Colors.black,
            size: 20.0,
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _obsecurePass = !_obsecurePass;
              });
            },
            child: Icon(
              _obsecurePass ? Icons.visibility : Icons.visibility_off,
            ),
          ),
        ),
      ),
    );
  }

  Widget _loginBtnWidget() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: MaterialButton(
        onPressed: () {
          if (usernameController.text.isEmpty) {
            ErrorDialouge.showErrorDialogue(
                context, _keyLoader, 'Please Enter Username');
          } else if (passwordController.text.isEmpty) {
            ErrorDialouge.showErrorDialogue(
                context, _keyLoader, 'Please Enter Password');
          } else if (usernameController.text == adminUsername &&
              passwordController.text == adminPassword) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Dashborad()),
              (route) => false,
            );
          } else {
            ErrorDialouge.showErrorDialogue(
                context, _keyLoader, 'Invalid username & password..!');
          }
        },
        minWidth: 200.0,
        height: 55.0,
        elevation: 0.0,
        color: kThemeColor,
        shape: Palette.btnShape,
        child: Text('SING IN', style: Palette.blackBtn),
      ),
    );
  }
}
