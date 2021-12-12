import 'package:flutter/material.dart';
import './partials/login_form.dart';
import "logo.dart";

class Login extends StatefulWidget {
  static const routeName = "/login";
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // const ({ Key? key }) : super(key: key);

  Future showError(err) {
    // get provider instance that returns a future
    // catch the error
    return showDialog<Null>(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("Error Occured"),
              content: Text(err["message"].toString()),
              actions: [
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("OK"))
              ],
            ));
    //
  }

  void processLogin() {}

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
                const BauLogo(),
                Container(
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(10),
                  child: Text("Login To Your Account"),
                ),
                LoginForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
