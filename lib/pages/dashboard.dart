import 'package:bau/pages/request_list_page.dart';

import './service.dart';
import './wallet_page.dart';
import 'package:flutter/material.dart';
import './partials/app_drawer.dart';
import 'dart:math' as math;

class Dashboard extends StatelessWidget {
  static const routeName = "dashboard";
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator Dashboard - FRAME
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Dashboard"),
        ),
        drawer: AppDrawer(),
        body: SingleChildScrollView(
          child: Container(
              width: 375,
              height: 812,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
              child: Stack(children: <Widget>[
                Positioned(
                    top: 0,
                    left: 0,
                    child: //Mask holder Template
                        Container(width: 375, height: 812, child: null)),
                Positioned(
                    top: 72,
                    left: 31,
                    child: Container(
                        width: 233,
                        height: 597,
                        child: Stack(children: <Widget>[
                          Positioned(
                              top: 0,
                              left: 0,
                              child: Text(
                                'My Dashboard',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color.fromRGBO(9, 4, 27, 1),
                                    fontFamily: 'Roboto',
                                    fontSize: 31,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1.5 /*PERCENT not supported*/
                                    ),
                              )),
                        ]))),
                Positioned(
                    top: 160,
                    left: 25,
                    child: Container(
                        width: 267,
                        height: 50,
                        child: Stack(children: <Widget>[
                          Positioned(
                              top: 0,
                              left: 0,
                              child: Container(
                                  width: 267,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15),
                                      bottomLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(15),
                                    ),
                                    color: Color.fromRGBO(249, 168, 77, 1),
                                  ))),
                          Positioned(
                              top: 13,
                              left: 18,
                              child: Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                  ),
                                  child: Stack(children: <Widget>[
                                    Container(),
                                    //     Positioned(
                                    //   top: 3,
                                    //   left: 3,
                                    //   child: SvgPicture.asset(
                                    //   'assets/images/vector.svg',
                                    //   semanticsLabel: 'vector'
                                    // );
                                    // ),Positioned(
                                    //   top: 16.649999618530273,
                                    //   left: 16.649999618530273,
                                    //   child: SvgPicture.asset(
                                    //   'assets/images/vector.svg',
                                    //   semanticsLabel: 'vector'
                                    // );
                                    // ),
                                  ]))),
                          Positioned(
                              top: 19,
                              left: 61,
                              child: Text(
                                'What do you want to order?',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color.fromRGBO(218, 99, 23, 1),
                                    fontFamily: 'Roboto',
                                    fontSize: 12,
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.normal,
                                    height: 1),
                              )),
                        ]))),
                Positioned(
                    top: 160,
                    left: 301,
                    child: Container(
                        width: 49,
                        height: 50,
                        child: Stack(children: <Widget>[
                          Positioned(
                              top: 0,
                              left: 0,
                              child: Container(
                                  width: 49,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15),
                                      bottomLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(15),
                                    ),
                                    color: Color.fromRGBO(249, 168, 77, 1),
                                  ))),
                          Positioned(
                              top: 14,
                              left: 13,
                              child: Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                  ),
                                  child: Stack(children: <Widget>[
                                    Positioned(
                                        top: 3,
                                        left: 2,
                                        child: Container(
                                            width: 20,
                                            height: 17.77777862548828,
                                            child: Stack(children: <Widget>[
                                              Container(),
                                            ]))),
                                  ]))),
                        ]))),
                Positioned(
                    top: 230,
                    left: 25,
                    child: Container(
                        width: 325,
                        height: 150,
                        child: Stack(children: <Widget>[
                          Positioned(
                              top: 0,
                              left: 0,
                              child: Container(
                                  width: 325,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(16),
                                      topRight: Radius.circular(16),
                                      bottomLeft: Radius.circular(16),
                                      bottomRight: Radius.circular(16),
                                    ),
                                    gradient: LinearGradient(
                                        begin: Alignment(0.8459399938583374,
                                            0.1310659646987915),
                                        end: Alignment(-0.1310659646987915,
                                            0.11150387674570084),
                                        colors: [
                                          Color.fromRGBO(83, 231, 139, 1),
                                          Color.fromRGBO(20, 190, 119, 1)
                                        ]),
                                  ))),
                          Positioned(
                              top: 88,
                              left: 173,
                              child: Container(
                                  width: 82,
                                  height: 32,
                                  child: Stack(children: <Widget>[
                                    Positioned(
                                        top: 0,
                                        left: 0,
                                        child: Container(
                                            width: 82,
                                            height: 32,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(6),
                                                topRight: Radius.circular(6),
                                                bottomLeft: Radius.circular(6),
                                                bottomRight: Radius.circular(6),
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Color.fromRGBO(0, 0,
                                                        0, 0.12999999523162842),
                                                    offset: Offset(6, 4),
                                                    blurRadius: 20)
                                              ],
                                              color: Color.fromRGBO(
                                                  255, 255, 255, 1),
                                            ))),
                                    Positioned(
                                        top: 11,
                                        left: 19,
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pushNamed(
                                                RequestListPage.routName);
                                          },
                                          child: const Text("Acive request"),
                                          style: const ButtonStyle(),
                                        )),
                                  ]))),
                          Positioned(
                              top: 30,
                              left: 173,
                              child: Text(
                                'Special Deal For October',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontFamily: 'Roboto',
                                    fontSize: 17,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1.5 /*PERCENT not supported*/
                                    ),
                              )),
                          Positioned(
                              top: 0,
                              left: 0,
                              child: //Mask holder Template
                                  Container(
                                      width: 325, height: 150, child: null)),
                        ]))),
                Positioned(
                    top: 445,
                    left: 25,
                    child: Container(
                        width: 479,
                        height: 184,
                        child: Stack(children: <Widget>[
                          Positioned(
                              top: 0,
                              left: 332,
                              child: Container(
                                  width: 147, height: 150, child: Container())),
                          Positioned(
                            top: 0,
                            left: 167,
                            child: InkWell(
                                onTap: () => Navigator.of(context)
                                    .pushNamed(Wallet.routeName),
                                child: Container(
                                    width: 145,
                                    height: 150,
                                    child: Stack(children: <Widget>[
                                      Positioned(
                                          top: 0,
                                          left: 0,
                                          child: Container(
                                              width: 145,
                                              height: 150,
                                              child: Stack(children: <Widget>[
                                                Positioned(
                                                    top: 0,
                                                    left: 0,
                                                    child: Container(
                                                        width: 145,
                                                        height: 150,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    22),
                                                            topRight:
                                                                Radius.circular(
                                                                    22),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    22),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    22),
                                                          ),
                                                          boxShadow: [
                                                            BoxShadow(
                                                                color: Color
                                                                    .fromRGBO(
                                                                        90,
                                                                        108,
                                                                        234,
                                                                        0.07000000029802322),
                                                                offset: Offset(
                                                                    12, 26),
                                                                blurRadius: 50)
                                                          ],
                                                          color: Color.fromRGBO(
                                                              255, 255, 255, 1),
                                                        ))),
                                                Positioned(
                                                    top: 33,
                                                    left: 43,
                                                    child: Container(
                                                        width: 59,
                                                        height: 49,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Color.fromRGBO(
                                                              255, 255, 255, 1),
                                                        ),
                                                        child: Stack(children: <
                                                            Widget>[]))),
                                                Positioned(
                                                    top: 116,
                                                    left: 21,
                                                    child: Text(
                                                      'My Wallet',
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                          color: Color.fromRGBO(
                                                              0, 0, 0, 1),
                                                          fontFamily: 'Roboto',
                                                          fontSize: 16,
                                                          letterSpacing:
                                                              0 /*percentages not used in flutter. defaulting to zero*/,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          height:
                                                              1.5 /*PERCENT not supported*/
                                                          ),
                                                    )),
                                              ]))),
                                      Positioned(
                                          top: 8,
                                          left: 26,
                                          child: Container(
                                              width: 90,
                                              height: 98,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/images/wallet.png'),
                                                    fit: BoxFit.fitWidth),
                                              ))),
                                    ]))),
                          ),
                          Positioned(
                            top: 0,
                            left: 0,
                            child: InkWell(
                                onTap: () => Navigator.of(context)
                                    .pushNamed(ServicePage.routeName),
                                child: Container(
                                    width: 147,
                                    height: 150,
                                    child: Stack(children: <Widget>[
                                      Positioned(
                                          top: 0,
                                          left: 0,
                                          child: Container(
                                              width: 147,
                                              height: 150,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(22),
                                                  topRight: Radius.circular(22),
                                                  bottomLeft:
                                                      Radius.circular(22),
                                                  bottomRight:
                                                      Radius.circular(22),
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Color.fromRGBO(
                                                          90,
                                                          108,
                                                          234,
                                                          0.07000000029802322),
                                                      offset: Offset(12, 26),
                                                      blurRadius: 50)
                                                ],
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 1),
                                              ))),
                                      Positioned(
                                          top: 116,
                                          left: 25,
                                          child: Text(
                                            'Send A Parcel',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color:
                                                    Color.fromRGBO(0, 0, 0, 1),
                                                fontFamily: 'Roboto',
                                                fontSize: 16,
                                                letterSpacing:
                                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                                fontWeight: FontWeight.normal,
                                                height:
                                                    1.5 /*PERCENT not supported*/
                                                ),
                                          )),
                                      Positioned(
                                          top: 26,
                                          left: 21,
                                          child: Container(
                                              width: 96,
                                              height: 73,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/images/pickup.png'),
                                                    fit: BoxFit.fitWidth),
                                              ))),
                                    ]))),
                          ),
                        ]))),
              ])),
        ),
      ),
    );
  }
}
