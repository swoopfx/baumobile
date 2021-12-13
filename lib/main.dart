import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import './pages/login.dart';
import "./pages/service.dart";
import './pages/register.dart';
import './pages/logistics.dart';
import './pages/wallet_page.dart';
import './pages/register.dart';
import './pages/dashboard.dart';
import './provider/auth.dart';
import './provider/service_type_provider.dart';
import './provider/place_search_provider.dart';
import './provider/logistics_provider.dart';
import './provider/wallet_provider.dart';
import './provider/request_list_provider.dart';
import './pages/request_list_page.dart';
import './pages/request_overview_page.dart';
import './pages/splash_page.dart';

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
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => Auth(),
          ),
          // ChangeNotifierProxyProvider<Auth>(
          //   update: (context, auth) => ServiceTypes(),
          // ),
          ChangeNotifierProxyProvider<Auth, ServiceTypes>(
              create: (context) => ServiceTypes(
                  Provider.of<Auth>(context, listen: false).token, []),
              update: (context, auth, pre) =>
                  ServiceTypes(auth.token, pre!.items)),
          ChangeNotifierProxyProvider<Auth, LogisticsProvider>(
              create: (context) => LogisticsProvider(
                  Provider.of<Auth>(context, listen: false).token, {}),
              update: (context, auth, pre) =>
                  LogisticsProvider(auth.token, pre!.stats)),

          ChangeNotifierProxyProvider<Auth, Walletprovider>(
              create: (context) => Walletprovider(
                  Provider.of<Auth>(context, listen: false).token, {}),
              update: (context, auth, pre) =>
                  Walletprovider(auth.token, pre!.items)),
          ChangeNotifierProxyProvider<Auth, RequestListProvider>(
              create: (context) => RequestListProvider(
                  Provider.of<Auth>(context, listen: false).token, []),
              update: (context, auth, pre) =>
                  RequestListProvider(auth.token, pre!.items)),
          // ChangeNotifierProvider(
          //   create: (context) => Wallet(),
          // ),
          ChangeNotifierProvider(create: (context) => PlaceSearchProvider()),
        ],
        child: Consumer<Auth>(
          builder: (context, auth, _) => MaterialApp(
            title: 'Bau Dispatch',
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
                canvasColor: Color.fromARGB(224, 225, 222, 1),
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
            home: auth.isAuth
                ? ServicePage()
                : FutureBuilder(
                    future: auth.autoLogin(),
                    builder: (context, snapshot) =>
                        snapshot.connectionState == ConnectionState.waiting
                            ? const SplashPage()
                            : Login(),
                  ),
            routes: {
              ServicePage.routeName: (context) => ServicePage(),
              Wallet.routeName: (context) => Wallet(),
              Login.routeName: (context) => Login(),
              Logisics.routeName: (context) => Logisics(),
              RegisterUser.routeName: (context) => RegisterUser(),
              RequestListPage.routName: (context) => RequestListPage(),
              RequestOverviewPage.routeName: (context) => RequestOverviewPage()
            },
          ),
        ));
  }
}
