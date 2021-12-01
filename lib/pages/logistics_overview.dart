import 'package:flutter/material.dart';

class LogisticsOverView extends StatelessWidget {
  LogisticsOverView({Key? key}) : super(key: key);

  void processPayment(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffB8DCF0),
      child: Column(
        children: [
          Row(
            children: [],
          ),
          Row(
            children: [],
          ),
          Container(
            child: Text("23km"),
          ),
          ElevatedButton(
              onPressed: () => processPayment(context), child: Text("PRE")),
          FloatingActionButton(
            onPressed: () => null,
            child: Text("PP"),
          ),
        ],
      ),
    );
  }
}
