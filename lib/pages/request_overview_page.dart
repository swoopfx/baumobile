import 'package:flutter/material.dart';
import './partials/app_drawer.dart';
import 'package:provider/provider.dart';
import '../provider/request_list_provider.dart';
import 'package:intl/intl.dart';
import '../pages/service.dart';
import '../pages/request_list_page.dart';
import '../provider/logistics_provider.dart';
import '../provider/wallet_provider.dart';

class RequestOverviewPage extends StatefulWidget {
  static const routeName = "request_overview_page";

  // RequestOverviewPage({Key? key}) : super(key: key);

  @override
  State<RequestOverviewPage> createState() => _RequestOverviewPageState();
}

class _RequestOverviewPageState extends State<RequestOverviewPage> {
  List dispatchActivity = [];
  String getCurrency(context) {
    // var format =
    //     NumberFormat.simpleCurrency(locale: Platform.localeName, name: 'NGN');
    Locale locale = Localizations.localeOf(context);
    var format =
        NumberFormat.simpleCurrency(locale: locale.toString(), name: "NGN");
    return format.currencySymbol;
  }

  String formatedCurrency(context, String value) {
    final format = NumberFormat("#,##0.00", "en_US");
    return getCurrency(context) + format.format(double.parse(value));
  }

  String logisticsUid = "";
  String itemName = "";

  bool _isLoading = false;
  Map item = {};

  Future fetchRideInfo(uid) async {
    setState(() {
      _isLoading = true;
    });
    try {
      var _item = await Provider.of<RequestListProvider>(context, listen: false)
          .fetchRideInfo(uid);
      // print(_item["calculatedDistanceText"]);
      dispatchActivity =
          await Provider.of<LogisticsProvider>(context, listen: false)
              .dispatchActivity(_item['id'].toString());

      setState(() {
        item = _item;
      });
    } catch (e) {
      rethrow;
    }

    // print(item);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    try {
      final routeArg =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      String _logisticsUid = routeArg["uid"].toString();
      String _itemName = routeArg["itemName"].toString();
      fetchRideInfo(_logisticsUid);
      setState(() {
        _isLoading = false;
        itemName = _itemName;
        logisticsUid = _logisticsUid;
      });
    } catch (e) {
      showDialog<Null>(
          context: context,
          builder: (_) => AlertDialog(
                title: const Text("Error Occured"),
                content: Text(e.toString()),
                actions: [
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("OK"))
                ],
              ));
    }
  }

  // _showAlertDialog() {
  //   // set up the buttons

  //   Widget cancelButton = FlatButton(
  //     child: Text("Cancel"),
  //     onPressed: () {},
  //   );
  //   Widget continueButton = FlatButton(
  //     child: Text("Continue"),
  //     onPressed: () {},
  //   );
  //   // set up the AlertDialog
  //   AlertDialog alert = AlertDialog(
  //     title: Text("Caution"),
  //     content: Text(""),
  //     actions: [
  //       cancelButton,
  //       continueButton,
  //     ],
  //   );
  //   // show the dialog
  //   return showDialog<Null>(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return alert;
  //     },
  //   );
  // }

  Widget _getFAB() {
    if (item.isNotEmpty) {
      if (item["status"]["id"] == 10) {
        return FloatingActionButton(
          onPressed: () => showDialog<Null>(
              context: context,
              builder: (_) => AlertDialog(
                    title: const Text("Caution"),
                    content: const Text(
                        "The cost of this Service would be transfered into your wallet, Are you sure you want to cancel this request  "),
                    actions: [
                      FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            _isLoading = false;
                          },
                          child: const Text("Cancel")),
                      FlatButton(
                          onPressed: () {
                            // print("Before");
                            var logisticsProvider =
                                Provider.of<LogisticsProvider>(context,
                                    listen: false);

                            logisticsProvider
                                .deleteLogistics(item['id'].toString())
                                .then((value) {
                              // print("After");
                              var walletProvider = Provider.of<Walletprovider>(
                                  context,
                                  listen: false);
                              Map data = {
                                "status": "success",
                                "txRef": DateTime.now().toIso8601String(),
                                "amountPayed": item["logisticsTransaction"]
                                    ["amount"]
                              };
                              walletProvider.fundwallet(data);
                              Navigator.of(context).pushReplacementNamed(
                                  RequestListPage.routName);
                            });
                          },
                          child: const Text("Continue")),
                    ],
                  )),
          child: const Icon(Icons.delete),
        );
      } else {
        return Container();
      }
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(itemName),
        ),
        drawer: AppDrawer(),
        body: SafeArea(
          child: item.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: const BorderSide(
                                color: Color.fromARGB(255, 70, 230, 214),
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                        child: Text(item["status"]["status"]),
                        onPressed: () {},
                      ),
                      Divider(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            item["itemName"],
                            style: Theme.of(context).textTheme.headline1,
                            textAlign: TextAlign.justify,
                          ),
                          Text(
                            item["logisticsUid"].toString().toUpperCase(),
                            style:
                                TextStyle(fontSize: 14, color: Colors.black54),
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 7),
                            child: Row(
                              children: [
                                const Text(
                                  "Pick Up :",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                Flexible(
                                  child: Text(item["pickUpAddress"] == null
                                      ? "No Pick Up Address"
                                      : item["pickUpAddress"]),
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            child: Row(
                              children: [
                                const Text(
                                  "Destination Address:",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                Flexible(
                                  child: Text(item["destination"] == null
                                      ? "No Destination"
                                      : item["destination"]),
                                )
                              ],
                            ),
                          ),
                          Divider(),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    WidgetSpan(
                                      child: Icon(
                                        Icons.location_on,
                                        color: Colors.green[400],
                                      ),
                                    ),
                                    TextSpan(
                                        text: item["calculatedDistanceText"],
                                        style: const TextStyle(
                                            color: Colors.black)),
                                  ],
                                ),
                              ),
                              // Text(item["logisticsTransaction"]["amount"]
                              //     .toString()),
                              // if (item["logisticsTransaction"] != null)
                              Container(
                                width: 20,
                              ),
                              const VerticalDivider(
                                color: Colors.black,
                                width: 1,
                                thickness: 2,
                              ),
                              Container(
                                width: 20,
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      style: const TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30),
                                      text: formatedCurrency(
                                        context,
                                        item["logisticsTransaction"]["amount"]
                                            .toString(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            child: Row(
                              children: [
                                const Text(
                                  "Note :",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                Flexible(
                                  child: Text(item["note"] == null
                                      ? "No Note"
                                      : item["note"]),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      const Divider(),
                      const Text("Activity"),
                      Container(
                        height: 250,
                        width: double.infinity,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          // backgroundBlendMode: BlendMode.darken,
                          border: Border.all(
                            color: Color.fromARGB(255, 110, 189, 114),
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Card(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 2),
                              child: Padding(
                                padding: EdgeInsets.all(2),
                                child: ListTile(
                                  key: ValueKey(dispatchActivity[index]['id']),
                                  leading: Icon(Icons.info_rounded),

                                  title: Text(
                                      dispatchActivity[index]['information']),
                                  // subtitle: Text(serviceName),
                                  // trailing: Icon(Icons.remove_red_eye),
                                ),
                              ),
                            );
                          },
                          itemCount: dispatchActivity.length,
                        ),
                      ),
                    ],
                  ),
                ),
        ),
        //  if(item["status"]["id"] == 10)
        floatingActionButton: _getFAB());
  }
}
