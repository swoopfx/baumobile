import 'package:flutter/material.dart';
import './partials/register_form.dart';
import './login.dart';
import 'logo.dart';

class RegisterUser extends StatelessWidget {
  static const routeName = "/register";
  // const RegisterUser({Key? key}) : super(key: key);

  double _fieldMarginTop = 10;
  double _fieldMarginBottom = 0;
  double _fieldMarginLeft = 0;
  double _fieldMarginRight = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.fromLTRB(40, 5, 40, 5),
            padding: EdgeInsets.all(3),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                BauLogo(),
                RegisterForm(),
                Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(10),
                    child: TextButton(
                        onPressed: () =>
                            Navigator.of(context).pushNamed(Login.routeName),
                        child: Text("Sign In"))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
