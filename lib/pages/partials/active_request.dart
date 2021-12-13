import 'package:bau/pages/request_overview_page.dart';
import 'package:flutter/material.dart';

class ActiveRequest extends StatelessWidget {
  const ActiveRequest(
      {Key? key,
      required this.id,
      required this.uid,
      required this.itemName,
      required this.serviceName,
      required this.state})
      : super(key: key);

  final String id;
  final String uid;
  final String itemName;
  final String serviceName;
  final String state;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(
          RequestOverviewPage.routeName,
          arguments: {"uid": uid, "itemName": itemName}),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        child: Padding(
          padding: EdgeInsets.all(6),
          child: ListTile(
            key: ValueKey(uid),
            leading: CircleAvatar(
              child: Icon(Icons.delivery_dining),
            ),
            title: Text(itemName),
            subtitle: Text(serviceName),
            trailing: Icon(Icons.remove_red_eye),
          ),
        ),
      ),
    );
  }
}
