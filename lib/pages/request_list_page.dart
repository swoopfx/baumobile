import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './partials/app_drawer.dart';
import '../provider/request_list_provider.dart';
import './partials/active_request.dart';

class RequestListPage extends StatefulWidget {
  static const routName = "request_list";

  // const RequestListPage({Key? key}) : super(key: key);

  @override
  State<RequestListPage> createState() => _RequestListPageState();
}

class _RequestListPageState extends State<RequestListPage> {
  bool _isLoading = true;
  List _activeRequest = [];

  void fetchActiveRide() async {
    setState(() {
      _isLoading = true;
    });
    try {
      _activeRequest =
          await Provider.of<RequestListProvider>(context, listen: false)
              .fetchActiveRequest();
      // =  _activeRequestProvider.;
      print(_activeRequest);
    } catch (e) {
      return showDialog<Null>(
          context: context,
          builder: (_) => AlertDialog(
                title: Text("Error Occured"),
                content: Text(e.toString()),
                actions: [
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        _isLoading = false;
                      },
                      child: Text("OK"))
                ],
              ));
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    fetchActiveRide();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Active Request"),
      ),
      drawer: const AppDrawer(),
      body: SafeArea(
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    ..._activeRequest.map(
                      (e) => ActiveRequest(
                          id: e["id"].toString(),
                          uid: e["logisticsUid"],
                          itemName: e["itemName"],
                          serviceName: e["serviceType"]["type"],
                          state: e["status"]["status"]),
                    )
                  ],
                )

                // ListView.builder(
                //   itemBuilder: (context, index) =>
                //       Text(_activeRequest[index]["itemName"]),

                //   itemCount: _activeRequest.length,
                // ),
                ),
      ),
    );
  }
}
