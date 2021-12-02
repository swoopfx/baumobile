import 'package:flutter/material.dart';

class BauLogo extends StatelessWidget {
  // final double logoHeigth = ;

  const BauLogo();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset("assets/images/baulog.jpeg", fit: BoxFit.cover),
      height: MediaQuery.of(context).size.height * 0.3,
    );
  }
}
