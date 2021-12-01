import 'package:flutter/material.dart';

class BauLogo extends StatelessWidget {
  final double logoHeigth;

  BauLogo({this.logoHeigth = 200.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset("assets/images/baulog.jpeg", fit: BoxFit.cover),
      height: logoHeigth,
    );
  }
}
