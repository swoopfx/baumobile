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
                    top: 689,
                    left: 25,
                    child: Container(
                        width: 323,
                        height: 87,
                        child: Stack(children: <Widget>[
                          Positioned(
                              top: 0,
                              left: 0,
                              child: Container(
                                  width: 323,
                                  height: 87,
                                  child: Stack(children: <Widget>[
                                    Positioned(
                                        top: 0,
                                        left: 0,
                                        child: Container(
                                            width: 323,
                                            height: 87,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(22),
                                                topRight: Radius.circular(22),
                                                bottomLeft: Radius.circular(22),
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
                                                    offset: Offset(0, 0),
                                                    blurRadius: 50)
                                              ],
                                              color: Color.fromRGBO(
                                                  255, 255, 255, 1),
                                            ))),
                                    Positioned(
                                        top: 25,
                                        left: 95,
                                        child: Text(
                                          'Green Noddle',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color:
                                                  Color.fromRGBO(9, 4, 27, 1),
                                              fontFamily: 'Roboto',
                                              fontSize: 15,
                                              letterSpacing:
                                                  0 /*percentages not used in flutter. defaulting to zero*/,
                                              fontWeight: FontWeight.normal,
                                              height:
                                                  1.5 /*PERCENT not supported*/
                                              ),
                                        )),
                                    Positioned(
                                        top: 29,
                                        left: 264,
                                        child: Text(
                                          '\$15',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  254, 173, 29, 1),
                                              fontFamily: 'Roboto',
                                              fontSize: 22,
                                              letterSpacing:
                                                  0 /*percentages not used in flutter. defaulting to zero*/,
                                              fontWeight: FontWeight.normal,
                                              height:
                                                  1.5 /*PERCENT not supported*/
                                              ),
                                        )),
                                    Positioned(
                                        top: 49,
                                        left: 95,
                                        child: Text(
                                          'Noodle Home',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color:
                                                  Color.fromRGBO(59, 59, 59, 1),
                                              fontFamily: 'Roboto Condensed',
                                              fontSize: 14,
                                              letterSpacing: 0.5,
                                              fontWeight: FontWeight.normal,
                                              height: 1),
                                        )),
                                    Positioned(
                                        top: 11,
                                        left: 10,
                                        child: Container(
                                            width: 64,
                                            height: 64,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                topRight: Radius.circular(10),
                                                bottomLeft: Radius.circular(10),
                                                bottomRight:
                                                    Radius.circular(10),
                                              ),
                                              color: Color.fromRGBO(
                                                  255, 255, 255, 1),
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/Photomenu.png'),
                                                  fit: BoxFit.fitWidth),
                                            ))),
                                  ]))),
                        ]))),
                Positioned(
                    top: 71,
                    left: 291,
                    child: Container(
                        width: 45,
                        height: 45,
                        child: Stack(children: <Widget>[
                          Positioned(
                              top: 0,
                              left: 0,
                              child: Container(
                                  width: 45,
                                  height: 45,
                                  child: Stack(children: <Widget>[
                                    Positioned(
                                        top: 0,
                                        left: 0,
                                        child: Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(15),
                                                topRight: Radius.circular(15),
                                                bottomLeft: Radius.circular(15),
                                                bottomRight:
                                                    Radius.circular(15),
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Color.fromRGBO(
                                                        19,
                                                        77,
                                                        90,
                                                        0.20000000298023224),
                                                    offset: Offset(11, 28),
                                                    blurRadius: 50)
                                              ],
                                              color: Color.fromRGBO(
                                                  250, 253, 255, 1),
                                            ))),
                                  ]))),
                          Positioned(
                              top: 11,
                              left: 14,
                              child: Container(
                                  width: 19,
                                  height: 22.996456146240234,
                                  child: Stack(children: <Widget>[
                                    //     Positioned(
                                    //   top: 3,
                                    //   left: 0,
                                    //   child: SvgPicture.asset(
                                    //   'assets/images/vector.svg',
                                    //   semanticsLabel: 'vector'
                                    // );
                                    // ),Positioned(
                                    //   top: 22,
                                    //   left: 7.26953125,
                                    //   child: SvgPicture.asset(
                                    //   'assets/images/vector.svg',
                                    //   semanticsLabel: 'vector'
                                    // );
                                    // ),
                                    Positioned(
                                        top: 0,
                                        left: 11,
                                        child: Container(
                                            width: 8,
                                            height: 8,
                                            decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                  255, 69, 69, 1),
                                              border: Border.all(
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 1),
                                                width: 1,
                                              ),
                                              borderRadius: BorderRadius.all(
                                                  Radius.elliptical(8, 8)),
                                            ))),
                                  ]))),
                        ]))),
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
                                'My Wallet',
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
                          Positioned(
                              top: 333,
                              left: 0,
                              child: Text(
                                'Nearest Restaurant',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color.fromRGBO(9, 4, 27, 1),
                                    fontFamily: 'Roboto',
                                    fontSize: 15,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1.5 /*PERCENT not supported*/
                                    ),
                              )),
                          Positioned(
                              top: 577,
                              left: 0,
                              child: Text(
                                'Popular Menu',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color.fromRGBO(9, 4, 27, 1),
                                    fontFamily: 'Roboto',
                                    fontSize: 15,
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
                    top: 409,
                    left: 286,
                    child: Container(
                        width: 57,
                        height: 260,
                        child: Stack(children: <Widget>[
                          Positioned(
                              top: 0,
                              left: 0,
                              child: Text(
                                'View More',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color.fromRGBO(255, 123, 50, 1),
                                    fontFamily: 'Roboto',
                                    fontSize: 12,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1.5 /*PERCENT not supported*/
                                    ),
                              )),
                          Positioned(
                              top: 244,
                              left: 0,
                              child: Text(
                                'View More',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color.fromRGBO(255, 123, 50, 1),
                                    fontFamily: 'Roboto',
                                    fontSize: 12,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1.5 /*PERCENT not supported*/
                                    ),
                              )),
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
                                        child: Text(
                                          'Buy Now',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Colors.amber,
                                              fontFamily: 'Roboto',
                                              fontSize: 10,
                                              letterSpacing:
                                                  0 /*percentages not used in flutter. defaulting to zero*/,
                                              fontWeight: FontWeight.normal,
                                              height:
                                                  1.5 /*PERCENT not supported*/
                                              ),
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
                    top: 728,
                    left: 10,
                    child: Container(
                        width: 355,
                        height: 74,
                        child: Stack(children: <Widget>[
                          Positioned(
                              top: 0,
                              left: 0,
                              child: Container(
                                  width: 355,
                                  height: 74,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(22),
                                      topRight: Radius.circular(22),
                                      bottomLeft: Radius.circular(22),
                                      bottomRight: Radius.circular(22),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color.fromRGBO(90, 108, 234,
                                              0.10000000149011612),
                                          offset: Offset(0, 0),
                                          blurRadius: 50)
                                    ],
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                  ))),
                          Positioned(
                              top: 15,
                              left: 20,
                              child: Container(
                                  width: 105,
                                  height: 44,
                                  child: Stack(children: <Widget>[
                                    Positioned(
                                        top: 0,
                                        left: 0,
                                        child: Container(
                                            width: 105,
                                            height: 44,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(12),
                                                topRight: Radius.circular(12),
                                                bottomLeft: Radius.circular(12),
                                                bottomRight:
                                                    Radius.circular(12),
                                              ),
                                              gradient: LinearGradient(
                                                  begin: Alignment(
                                                      0.8459399938583374,
                                                      0.1310659646987915),
                                                  end: Alignment(
                                                      -0.1310659646987915,
                                                      0.11150387674570084),
                                                  colors: [
                                                    Color.fromRGBO(
                                                        83, 231, 139, 1),
                                                    Color.fromRGBO(
                                                        20, 190, 119, 1)
                                                  ]),
                                            ))),
                                    Positioned(
                                        top: 10,
                                        left: 17,
                                        child: Container(
                                            width: 24,
                                            height: 24,
                                            decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                  255, 255, 255, 1),
                                            ),
                                            child: Stack(children: <Widget>[
                                              Positioned(
                                                  top: 2,
                                                  left: 2.5,
                                                  child: Container(
                                                    width: 19,
                                                    height: 20,
                                                  )),
                                            ]))),
                                    Positioned(
                                        top: 16,
                                        left: 53,
                                        child: Text(
                                          'Home',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color:
                                                  Color.fromRGBO(9, 5, 28, 1),
                                              fontFamily: 'Roboto',
                                              fontSize: 12,
                                              letterSpacing:
                                                  0 /*percentages not used in flutter. defaulting to zero*/,
                                              fontWeight: FontWeight.normal,
                                              height:
                                                  1.5 /*PERCENT not supported*/
                                              ),
                                        )),
                                  ]))),
                          Positioned(
                            top: 25,
                            left: 293,
                            child: Container(),
                          ),
                          Positioned(
                              top: 23,
                              left: 308,
                              child: Container(
                                  width: 13,
                                  height: 13,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(255, 74, 74, 1),
                                    border: Border.all(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.all(
                                        Radius.elliptical(13, 13)),
                                  ))),
                          Positioned(
                              top: 25,
                              left: 247,
                              child: Text(
                                '7',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontFamily: 'Roboto',
                                    fontSize: 9,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1.5 /*PERCENT not supported*/
                                    ),
                              )),
                          Positioned(
                              top: 23,
                              left: 224,
                              child: Container(
                                  width: 28,
                                  height: 26,
                                  child: Stack(children: <Widget>[
                                    Positioned(
                                      top: 2,
                                      left: 0,
                                      child: Container(),
                                    ),
                                    Positioned(
                                        top: 0,
                                        left: 15,
                                        child: Container(
                                            width: 13,
                                            height: 14,
                                            child: Stack(children: <Widget>[
                                              Positioned(
                                                  top: 0,
                                                  left: 0,
                                                  child: Container(
                                                      width: 13,
                                                      height: 13,
                                                      decoration: BoxDecoration(
                                                        color: Color.fromRGBO(
                                                            255, 74, 74, 1),
                                                        border: Border.all(
                                                          color: Color.fromRGBO(
                                                              255, 255, 255, 1),
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius
                                                                    .elliptical(
                                                                        13,
                                                                        13)),
                                                      ))),
                                              Positioned(
                                                  top: 2,
                                                  left: 4,
                                                  child: Text(
                                                    '7',
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            255, 255, 255, 1),
                                                        fontFamily: 'Roboto',
                                                        fontSize: 9,
                                                        letterSpacing:
                                                            0 /*percentages not used in flutter. defaulting to zero*/,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        height:
                                                            1.5 /*PERCENT not supported*/
                                                        ),
                                                  )),
                                            ]))),
                                  ]))),
                          Positioned(
                              top: 26.999755859375,
                              left: 171,
                              child: Container(
                                  width: 15.994000434875488,
                                  height: 19.999900817871094,
                                  child: Stack(children: <Widget>[
                                    Positioned(
                                        top: 0,
                                        left: 0,
                                        child: Container(
                                          width: 15.994000434875488,
                                          height: 19.999900817871094,
                                        )),
                                  ]))),
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
                                  width: 147,
                                  height: 184,
                                  child: Stack(children: <Widget>[
                                    Positioned(
                                        top: 0,
                                        left: 0,
                                        child: Container(
                                            width: 147,
                                            height: 184,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(22),
                                                topRight: Radius.circular(22),
                                                bottomLeft: Radius.circular(22),
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
                                        left: 32,
                                        child: Text(
                                          'Good Food',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Color.fromRGBO(0, 0, 0, 1),
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
                                        top: 141,
                                        left: 51,
                                        child: Text(
                                          '12 Mins',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Color.fromRGBO(0, 0, 0, 1),
                                              fontFamily: 'Roboto',
                                              fontSize: 13,
                                              letterSpacing:
                                                  0 /*percentages not used in flutter. defaulting to zero*/,
                                              fontWeight: FontWeight.normal,
                                              height:
                                                  1.5 /*PERCENT not supported*/
                                              ),
                                        )),
                                    Positioned(
                                        top: 17,
                                        left: 31,
                                        child: Container(
                                            width: 86,
                                            height: 88,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/Restaurantimage.png'),
                                                  fit: BoxFit.fitWidth),
                                            ))),
                                  ]))),
                          Positioned(
                              top: 0,
                              left: 167,
                              child: Container(
                                  width: 145,
                                  height: 184,
                                  child: Stack(children: <Widget>[
                                    Positioned(
                                        top: 0,
                                        left: 0,
                                        child: Container(
                                            width: 145,
                                            height: 184,
                                            child: Stack(children: <Widget>[
                                              Positioned(
                                                  top: 0,
                                                  left: 0,
                                                  child: Container(
                                                      width: 145,
                                                      height: 184,
                                                      decoration: BoxDecoration(
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
                                                              color: Color.fromRGBO(
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
                                                      decoration: BoxDecoration(
                                                        color: Color.fromRGBO(
                                                            255, 255, 255, 1),
                                                      ),
                                                      child: Stack(children: <
                                                          Widget>[]))),
                                              Positioned(
                                                  top: 116,
                                                  left: 21,
                                                  child: Text(
                                                    'Healthy Food',
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
                                              Positioned(
                                                  top: 141,
                                                  left: 50,
                                                  child: Text(
                                                    '8 Mins',
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            0, 0, 0, 1),
                                                        fontFamily: 'Roboto',
                                                        fontSize: 13,
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
                                                      'assets/images/Restaurantimage.png'),
                                                  fit: BoxFit.fitWidth),
                                            ))),
                                  ]))),
                          Positioned(
                              top: 0,
                              left: 0,
                              child: Container(
                                  width: 147,
                                  height: 184,
                                  child: Stack(children: <Widget>[
                                    Positioned(
                                        top: 0,
                                        left: 0,
                                        child: Container(
                                            width: 147,
                                            height: 184,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(22),
                                                topRight: Radius.circular(22),
                                                bottomLeft: Radius.circular(22),
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
                                          'Vegan Resto',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Color.fromRGBO(0, 0, 0, 1),
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
                                        top: 141,
                                        left: 51,
                                        child: Text(
                                          '12 Mins',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Color.fromRGBO(0, 0, 0, 1),
                                              fontFamily: 'Roboto',
                                              fontSize: 13,
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
                                                      'assets/images/Resturantimage.png'),
                                                  fit: BoxFit.fitWidth),
                                            ))),
                                  ]))),
                        ]))),
              ])),
        ),
      ),
    );
  }
}
