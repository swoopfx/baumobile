import 'package:flutter/material.dart';
import 'service_card.dart';

class ServicePage extends StatelessWidget {
  List<Map> get serviceTypes {
    return List.generate(4, (index) {
      return {};
    });
  }

  // const ServicePage({Key? key}) : super(key: key);
//  final  mediasss = MediaQuery.of(context)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [Container(), Container()],
        ),
      ),
    );
  }
}
