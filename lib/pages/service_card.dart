import 'dart:developer';

import "package:flutter/material.dart";
import './logistics.dart';
// import 'service.dart';

class ServiceCards extends StatelessWidget {
  final String servicename;
  final String serviceimage;

  final String serviceId;

  const ServiceCards(
      {Key? key,
      required this.servicename,
      required this.serviceimage,
      required this.serviceId})
      : super(key: key);

  void goToLogistisPage(ctx) {
    Navigator.of(ctx).pushNamed(Logisics.routeName,
        arguments: {"serviceId": serviceId, "serviceName": servicename});
  }

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => goToLogistisPage(context),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Padding(
          padding: EdgeInsets.all(6),
          child: ListTile(
            key: ValueKey(serviceId),
            leading: CircleAvatar(
              child: Icon(Icons.delivery_dining),
            ),
            title: Text(servicename),
            // subtitle: Text(serviceName),
            trailing: Icon(Icons.remove_red_eye),
          ),
        ),
      ),
    );

    // InkWell(
    //   onTap: () => goToLogistisPage(context),
    //   child: Container(
    //     width: double.infinity,
    //     alignment: Alignment.center,
    //     // margin: EdgeInsets.fromLTRB(0, , right, bottom),
    //     // height: mediaquesy.size.height * 0.1,
    //     margin: EdgeInsets.all(30),
    //     padding: EdgeInsets.all(30),
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.all(Radius.circular(20)),
    //       gradient: LinearGradient(
    //         colors: [
    //           Color.fromARGB(255, 51, 145, 71),
    //           Color.fromARGB(255, 47, 184, 115),
    //           Color.fromARGB(255, 51, 145, 71),
    //         ],
    //         begin: Alignment.topLeft,
    //         end: Alignment.bottomRight,
    //       ),
    //     ),
    //     child: Row(
    //       // mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Container(
    //           height: mediaquery.height * 0.2,
    //           child: CircleAvatar(
    //             radius: 30,
    //             foregroundImage: AssetImage("assets/images/wallet.png"),
    //             // backgroundImage: NetworkImage(serviceimage),
    //             backgroundColor: Colors.transparent,
    //           ),
    //           // Image.network(widget.serviceimage, fit: BoxFit.cover),
    //         ),
    //         Column(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             crossAxisAlignment: CrossAxisAlignment.end,
    //             children: [
    //               Text(servicename),
    //             ])
    //       ],
    //     ),
    //   ),
    // );
  }
}
