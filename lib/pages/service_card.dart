import "package:flutter/material.dart";

class ServiceCards extends StatelessWidget {
  const ServiceCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: Theme.of(context).cardTheme.color,
        elevation: Theme.of(context).cardTheme.elevation,
        shape: Theme.of(context).cardTheme.shape,
        child: Column(
          children: [Text("Welcome")],
        ),
      ),
    );
  }
}
