import 'package:flutter/material.dart';
import "logo.dart";

class Login extends StatelessWidget {
  // const ({ Key? key }) : super(key: key);

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
              child: Text("Login To Your Account"),
            ),
            Container(
                child: TextField(
                  decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      hintText: "Type in you",
                      fillColor: Colors.white70),
                ),
                width: double.infinity),
            Container(
                margin: EdgeInsets.fromLTRB(0, 22, 0, 0),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      hintText: "Type in your text",
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
