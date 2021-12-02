import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './pages/login.dart';
import './pages/register.dart';
import './pages/logistics.dart';
import './pages/wallet_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: Colors.white,
          accentColor: Colors.amber,
          fontFamily: "QuickSand",
          textTheme: ThemeData.light().textTheme.copyWith(
                headline1: TextStyle(
                  // fontFamily: "QuickSand",
                  // fontWeight: FontWeight.,

                  fontSize: 20,
                ),
              ),
          cardTheme: ThemeData.light().cardTheme.copyWith(
              color: Color.fromARGB(255, 194, 240, 213),
              elevation: 7.0,
              shape: null),
          backgroundColor: Theme.of(context).primaryColorLight),
      home: Wallet(),
    );
  }
}
