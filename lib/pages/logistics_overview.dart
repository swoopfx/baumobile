import 'package:flutter/material.dart';

class LogisticsOverView extends StatefulWidget {
  LogisticsOverView({Key? key}) : super(key: key);

  @override
  State<LogisticsOverView> createState() => _LogisticsOverViewState();
}

class _LogisticsOverViewState extends State<LogisticsOverView> {
  void processPayment(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
      color: Color(0xffB8DCF0),
      padding: EdgeInsets.only(
          top: 0, left: 0, right: 0, bottom: mediaQuery.viewInsets.bottom + 10),
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
