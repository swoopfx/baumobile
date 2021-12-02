import 'package:flutter/material.dart';
import "logistics_overview.dart";

class Logisics extends StatelessWidget {
  // const Logisics({Key? key}) : super(key: key);

  double _fieldMarginTop = 10;
  double _fieldMarginBottom = 0;
  double _fieldMarginLeft = 0;
  double _fieldMarginRight = 0;

  void processModalRequest(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return GestureDetector(
          child: LogisticsOverView(),
          onTap: () {},
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Icon(Icons.arrow_back),
      //   actions: [
      //     IconButton(
      //         onPressed: () => Navigator.of(context).pop(),
      //         icon: Icon(Icons.arrow_back))
      //   ],
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.fromLTRB(40, 5, 40, 5),
            padding: EdgeInsets.all(3),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Text("Logo"),
                Container(
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Logistics Information",
                    style: Theme.of(context).textTheme.headline1,
                    textAlign: TextAlign.justify,
                  ),
                ),
                Container(
                    child: TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: "Pick Up Address",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[800]),
                          hintText: "Enter Your Pick Up Address",
                          fillColor: Colors.white70),
                    ),
                    width: double.infinity),
                Container(
                    margin: EdgeInsets.fromLTRB(_fieldMarginLeft,
                        _fieldMarginTop, _fieldMarginRight, _fieldMarginBottom),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: "Destination ",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[800]),
                          hintText: "Destination of the Package",
                          fillColor: Colors.white70),
                    ),
                    width: double.infinity),
                Container(
                    margin: EdgeInsets.fromLTRB(_fieldMarginLeft,
                        _fieldMarginTop, _fieldMarginRight, _fieldMarginBottom),
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
                    margin: EdgeInsets.fromLTRB(_fieldMarginLeft,
                        _fieldMarginTop, _fieldMarginRight, _fieldMarginBottom),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Quantity",
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
                  child: TextButton(
                      onPressed: () {}, child: Text("Forgot Password")),
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
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ))),
                      onPressed: () => processModalRequest(context)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
