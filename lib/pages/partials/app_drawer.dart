import "package:flutter/material.dart";
import '../dashboard.dart';
import 'package:provider/provider.dart';
import '../../provider/auth.dart';
import '../wallet_page.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text("Menu"),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.dashboard),
            title: Text("Dashboard"),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(Dashboard.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.account_balance_wallet),
            title: Text("Wallet"),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(Wallet.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
            onTap: () {
              // Na
              Navigator.of(context).pop();
              Provider.of<Auth>(context, listen: false).logout();
            },
          ),
        ],
      ),
    );
  }
}