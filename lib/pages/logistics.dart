import 'package:flutter/material.dart';
import 'partials/logistics_overview.dart';
import './partials/logistics_request_form.dart';

class Logisics extends StatelessWidget {
  static const routeName = "/logistics";

  String serviceId = "";

  String serviceName = "";

  Logisics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    serviceId = routeArg["serviceId"].toString();
    serviceName = routeArg["serviceName"].toString();

    return Scaffold(
      appBar: AppBar(title: Text(serviceName)),
      body: SafeArea(
        child: SingleChildScrollView(
          child: LogisticsRequestForm(
              serviceId: serviceId, serviceName: serviceName),
        ),
      ),
    );
  }
}
