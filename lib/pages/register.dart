import 'package:flutter/material.dart';
import 'logo.dart';

class RegisterUser extends StatelessWidget {
  // const RegisterUser({Key? key}) : super(key: key);

  double _fieldMarginTop = 10;
  double _fieldMarginBottom = 0;
  double _fieldMarginLeft = 0;
  double _fieldMarginRight = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(40, 5, 40, 5),
        padding: EdgeInsets.all(3),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BauLogo(),
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(10),
              child: Text("Register For Free"),
            ),
            Container(
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: "Full Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      hintText: "Enter Your Full Name",
                      fillColor: Colors.white70),
                ),
                width: double.infinity),
            Container(
                margin: EdgeInsets.fromLTRB(_fieldMarginLeft, _fieldMarginTop,
                    _fieldMarginRight, _fieldMarginBottom),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      hintText: "Enter Your Email",
                      fillColor: Colors.white70),
                ),
                width: double.infinity),
            Container(
                margin: EdgeInsets.fromLTRB(_fieldMarginLeft, _fieldMarginTop,
                    _fieldMarginRight, _fieldMarginBottom),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      hintText: "Enter Password",
                      fillColor: Colors.white70),
                ),
                width: double.infinity),
            Container(
                margin: EdgeInsets.fromLTRB(_fieldMarginLeft, _fieldMarginTop,
                    _fieldMarginRight, _fieldMarginBottom),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: "Confirm Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      hintText: "Confirm Password",
                      fillColor: Colors.white70),
                ),
                width: double.infinity),
            Container(
              margin: EdgeInsets.all(10),
              child:
                  TextButton(onPressed: () {}, child: Text("Forgot Password")),
            ),
            Container(
              child: ElevatedButton(
                  child: Text(
                    "Login".toUpperCase(),
                  ),
                  style: ButtonStyle(
                      // fixedSize: const Size.fromWidth(240),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.green),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ))),
                  onPressed: () => null),
            )
          ],
        ),
      ),
    );
  }
}
