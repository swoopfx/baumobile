// import 'package:bau/model/place_longitude_latitude.dart';
import 'package:flutter/material.dart';
import 'logistics_overview.dart';
import 'package:provider/provider.dart';
import '../../provider/place_search_provider.dart';
import '../../services/place_service.dart';
import '../../provider/logistics_provider.dart';
// import 'package:flutterwave/flutterwave.dart';

class LogisticsRequestForm extends StatefulWidget {
  String serviceId = "";

  String serviceName = "";
  LogisticsRequestForm(
      {Key? key, required this.serviceId, required this.serviceName})
      : super(key: key);

  @override
  _LogisticsRequestFormState createState() => _LogisticsRequestFormState();
}

class _LogisticsRequestFormState extends State<LogisticsRequestForm> {
  final double _fieldMarginTop = 10;

  final double _fieldMarginBottom = 0;

  final double _fieldMarginLeft = 0;

  final double _fieldMarginRight = 0;

  final _pickupaddressFocusNode = FocusNode();
  final _destinationaddressFocusNode = FocusNode();
  final _quantityFocusNode = FocusNode();
  final _itemNameFocus = FocusNode();
  final _noteFocusNode = FocusNode();

  void getLatitudeLogitude() {}

  var _pickupcontroller = TextEditingController();
  var _destinationController = TextEditingController();

  Map<String, dynamic> _logisticsData = {
    "destinationPlaceId": "",
    "pickUpPlaceId": "",
    "pickAddress": "",
    "destinationAddress": "",
    "pickupLat": "",
    "pickupLong": "",
    "destinationLat": "",
    "destinationLong": "",
    "quantity": 0,
    "item_name": "",
    "service_type": 10,
    "delivery_type": 10,
    "note": "",
  };

  final _form = GlobalKey<FormState>();

  bool _isRequesting = false;
  // final

  @override
  void dispose() {
    super.dispose();
    _pickupaddressFocusNode.dispose();
    _destinationaddressFocusNode.dispose();
    _quantityFocusNode.dispose();
    _itemNameFocus.dispose();
    _noteFocusNode.dispose();
  }

  void _requestLogistics() {
    _logisticsData["service_type"] = widget.serviceId;
    final isValid = _form.currentState!.validate();
    setState(() {
      _isRequesting = true;
    });

    if (isValid) {
      // process logistics request logic
      _form.currentState!.save();
      // print(_logisticsData);
      _processModalRequest();
    } else {
      return;
    }
  }

  void _processModalRequest() async {
    try {
      var logisticsProvider =
          Provider.of<LogisticsProvider>(context, listen: false);
      Map stats = await logisticsProvider.fetchStats(_logisticsData);

      showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            child: LogisticsOverView(
              logisticsDetails: stats,
            ),
            onTap: () {},
          );
        },
      );
    } catch (e) {
      return showDialog<Null>(
          context: context,
          builder: (_) => AlertDialog(
                title: const Text("Error Occured"),
                content: Text(e.toString()),
                actions: [
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();

                        _isRequesting = false;
                      },
                      child: const Text("OK"))
                ],
              ));
    } finally {
      setState(() {
        _isRequesting = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var placeSearchProvider = Provider.of<PlaceSearchProvider>(context);
    // var destinationSearch = Provider.of<PlaceSearchProvider>(context);
    // var mediaQuery = MediaQuery.of(context);
    return Form(
      key: _form,
      child: Container(
        margin: EdgeInsets.fromLTRB(40, 5, 40, 5),
        padding: EdgeInsets.all(3),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text("Logo"),
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(10),
              child: Text(
                "Logistics Information",
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.justify,
              ),
            ),
            Container(
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  controller: _pickupcontroller,
                  validator: (e) {
                    if (e!.isEmpty) {
                      return "pick up address cannot be empty";
                    }
                    return null;
                  },
                  onFieldSubmitted: (_) {
                    FocusScope.of(context)
                        .requestFocus(_destinationaddressFocusNode);
                  },
                  focusNode: _pickupaddressFocusNode,
                  onChanged: (value) => placeSearchProvider.searchPlaces(value),
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.search),
                      labelText: "Pick Up Address",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      hintText: "Enter Your Pick Up Address",
                      fillColor: Colors.white70),
                ),
                width: double.infinity),
            if (placeSearchProvider.searchResult.isNotEmpty)
              Stack(
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      backgroundBlendMode: BlendMode.darken,
                    ),
                  ),
                  if (placeSearchProvider.searchResult.isNotEmpty)
                    Container(
                        height: 200,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: TextButton(
                                onPressed: () async {
                                  var response = await PlaceService()
                                      .getLatitudeLongitude(placeSearchProvider
                                          .searchResult[index].placeId);
                                  _logisticsData["pickUpPlaceId"] =
                                      placeSearchProvider
                                          .searchResult[index].placeId;
                                  _logisticsData["pickupLong"] =
                                      response["geometry"]["location"]["lng"];
                                  _logisticsData["pickupLat"] =
                                      response["geometry"]["location"]["lat"];
                                  _logisticsData["pickAddress"] =
                                      response["formatted_address"];
                                  print(_logisticsData["pickupLong"]);
                                  print(_logisticsData["pickupLat"]);
                                  setState(() {
                                    _pickupcontroller.text =
                                        _logisticsData["pickAddress"];
                                    placeSearchProvider.searchResult = [];
                                  });

                                  // Navigator.of(context).pop();
                                },
                                child: Text(
                                    placeSearchProvider
                                        .searchResult[index].description,
                                    style: TextStyle(color: Colors.white)),
                              ),
                            );
                          },
                          itemCount: placeSearchProvider.searchResult.length,
                        ))
                ],
              ),
            Container(
                margin: EdgeInsets.fromLTRB(_fieldMarginLeft, _fieldMarginTop,
                    _fieldMarginRight, _fieldMarginBottom),
                child: TextFormField(
                  validator: (e) {
                    if (e!.isEmpty) {
                      return "Destination Address is required";
                    }
                  },
                  controller: _destinationController,
                  keyboardType: TextInputType.text,
                  focusNode: _destinationaddressFocusNode,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_itemNameFocus);
                  },
                  onChanged: (value) =>
                      placeSearchProvider.destinationSearchPlace(value),
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.search),
                      labelText: "Destination Address ",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      hintText: "Destination of the Package",
                      fillColor: Colors.white70),
                ),
                width: double.infinity),
            if (placeSearchProvider.destinationResult.isNotEmpty)
              Stack(
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      backgroundBlendMode: BlendMode.darken,
                    ),
                  ),
                  if (placeSearchProvider.destinationResult.isNotEmpty)
                    Container(
                        height: 200,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: TextButton(
                                onPressed: () async {
                                  var response = await PlaceService()
                                      .getLatitudeLongitude(placeSearchProvider
                                          .destinationResult[index].placeId);
                                  _logisticsData["destinationPlaceId"] =
                                      placeSearchProvider
                                          .destinationResult[index].placeId;
                                  _logisticsData["destinationLong"] =
                                      response["geometry"]["location"]["lng"];
                                  _logisticsData["destinationLat"] =
                                      response["geometry"]["location"]["lat"];
                                  _logisticsData["destinationAddress"] =
                                      response["formatted_address"];
                                  print(_logisticsData["destinationLong"]);
                                  print(_logisticsData["destinationLat"]);
                                  setState(() {
                                    _destinationController.text =
                                        _logisticsData["destinationAddress"];
                                    placeSearchProvider.destinationResult = [];
                                  });

                                  // Navigator.of(context).pop();
                                },
                                child: Text(
                                    placeSearchProvider
                                        .destinationResult[index].description,
                                    style: TextStyle(color: Colors.white)),
                              ),
                            );
                          },
                          itemCount:
                              placeSearchProvider.destinationResult.length,
                        ))
                ],
              ),
            Container(
                margin: EdgeInsets.fromLTRB(_fieldMarginLeft, _fieldMarginTop,
                    _fieldMarginRight, _fieldMarginBottom),
                child: TextFormField(
                  // obscureText: true,
                  onSaved: (newValue) {
                    _logisticsData["item_name"] = newValue.toString();
                  },
                  validator: (e) {
                    if (e!.isEmpty) {
                      return "Item Name is required";
                    }
                  },
                  focusNode: _itemNameFocus,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_quantityFocusNode);
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      labelText: "Item Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      // hintText: "Enter Password",
                      fillColor: Colors.white70),
                ),
                width: double.infinity),
            Container(
                margin: EdgeInsets.fromLTRB(_fieldMarginLeft, _fieldMarginTop,
                    _fieldMarginRight, _fieldMarginBottom),
                child: TextFormField(
                  focusNode: _quantityFocusNode,
                  onSaved: (newValue) {
                    _logisticsData["quantity"] = newValue;
                  },
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_noteFocusNode);
                  },
                  validator: (e) {
                    if (e!.isEmpty) {
                      return "Please provide the qunatity of the package";
                    }
                    if (int.tryParse(e) == null) {
                      return "Please provide a valid number";
                    }
                    if (int.parse(e) <= 0) {
                      return "Please provide a quantity";
                    }
                  },
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      labelText: "Quantity",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      // hintText: "Confirm Password",
                      fillColor: Colors.white70),
                ),
                width: double.infinity),

            Container(
                margin: EdgeInsets.fromLTRB(_fieldMarginLeft, _fieldMarginTop,
                    _fieldMarginRight, _fieldMarginBottom),
                child: TextFormField(
                  onSaved: (newValue) {
                    _logisticsData["note"] = newValue;
                  },
                  focusNode: _noteFocusNode,
                  keyboardType: TextInputType.multiline,
                  maxLines: 4,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      labelText: "Note",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      // hintText: "Confirm Password",
                      fillColor: Colors.white70),
                ),
                width: double.infinity),
            Container(
              margin: EdgeInsets.all(10),
            ),
            Container(
              child: _isRequesting
                  ? const Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                      child: Text(
                        "Request".toUpperCase(),
                      ),
                      style: ButtonStyle(
                          // minimumSize: MaterialStateProperty.all<Size>(
                          //     Size.fromWidth(double.infinity)),
                          // fixedSize: const Size.fromWidth(240),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.green),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ))),
                      onPressed: () => _requestLogistics()),
            )
          ],
        ),
      ),
    );
  }
}
