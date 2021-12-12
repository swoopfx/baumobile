import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Wallet extends StatelessWidget with ChangeNotifier {
  static const routeName = "/wallet";

  // const Wallet({Key? key}) : super(key: key);

  final double walletBalance = 0.0;

  // void currency(context) {
  //   var localle = Localizations.localeOf(context);
  // }

  String getCurrency(context) {
    // var format =
    //     NumberFormat.simpleCurrency(locale: Platform.localeName, name: 'NGN');
    Locale locale = Localizations.localeOf(context);
    var format =
        NumberFormat.simpleCurrency(locale: locale.toString(), name: "NGN");
    return format.currencySymbol;
  }

  String formatedCurrency(context, String value) {
    final format = new NumberFormat("#,##0.00", "en_US");
    return getCurrency(context) + format.format(double.parse(value));
  }

  @override
  Widget build(BuildContext context) {
    final mediaquesy = MediaQuery.of(context);

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("My Wallet"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Text(
                  "My Wallet",
                  style: Theme.of(context).textTheme.headline1,
                  textAlign: TextAlign.justify,
                ),
              ),
              Container(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      width: double.infinity,
                      alignment: Alignment.bottomCenter,
                      // margin: EdgeInsets.fromLTRB(0, , right, bottom),
                      height: mediaquesy.size.height * 0.3,
                      padding: EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 51, 145, 71),
                            Color.fromARGB(255, 47, 184, 115),
                            Color.fromARGB(255, 51, 145, 71),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                              height: mediaquesy.size.height * 0.2,
                              child: Image.asset("assets/images/wallet.png",
                                  fit: BoxFit.cover)),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("Fund Your Wallet"),
                                Divider(
                                  height: 10,
                                ),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.deepPurple[200],
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 50, vertical: 20),
                                    ),
                                    onPressed: () {},
                                    child: Text("Fund Wallet")),
                              ])
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "View History",
                          style: TextStyle(),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                    Container(height: mediaquesy.size.height * 0.1),
                    Container(
                        // padding: 20,
                        width: double.infinity,
                        alignment: Alignment.bottomCenter,
                        // margin: EdgeInsets.fromLTRB(0, , right, bottom),
                        height: mediaquesy.size.height * 0.3,
                        padding: EdgeInsets.all(30),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 51, 145, 71),
                              Color.fromARGB(255, 47, 184, 115),
                              Color.fromARGB(255, 51, 145, 71),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "BALANCE".toUpperCase(),
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            Divider(
                              height: 20,
                              thickness: 5,
                              indent: 20,
                              color: Colors.white,
                              endIndent: 20,
                            ),
                            Text(
                              formatedCurrency(
                                  context, walletBalance.toString()),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 45),
                            ),
                          ],
                        ) //declare your widget here

                        ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
