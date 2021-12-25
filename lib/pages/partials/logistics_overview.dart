import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
// import 'package:flutterwave/flutterwave.dart';
import '../../provider/flutterwave_payment_provider.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import '../../provider/logistics_provider.dart';
import '../../pages/request_overview_page.dart';
import '../../provider/wallet_provider.dart';
import '../../pages/service.dart';

class LogisticsOverView extends StatefulWidget {
  Map logisticsDetails = {};

  LogisticsOverView({Key? key, required this.logisticsDetails})
      : super(key: key);

  @override
  State<LogisticsOverView> createState() => _LogisticsOverViewState();
}

class _LogisticsOverViewState extends State<LogisticsOverView> {
  bool isLoaded = false;
  final formKey = GlobalKey<FormState>();
  final _paymentTypeController = TextEditingController();
  String _selectedPaymentMethod = "";

  var paymentConfig = {};

  bool _isProcessingPayment = false;

  final plugin = PaystackPlugin();

  final paymentMethod = [
    "Wallet",
    "Card",
  ];

  _onSubmitLogisticsRequest() async {
    // try {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isProcessingPayment = true;
      });
      var paymentProvider =
          Provider.of<FlutterwavePaymentProvider>(context, listen: false);
      var paymentConfig = await paymentProvider.paymentConfig();

      String fullname = paymentConfig['customer']['full_name'];
      String invoiceNumber = paymentConfig["bau_tx_ref"];

      // Charge charge = Charge()
      String enteredAmount = widget.logisticsDetails["price"].toString();
      //  int.parse(enteredAmount.padRight(enteredAmount.length + 2, '0'));
      if (_selectedPaymentMethod == "Card") {
        Charge charge = Charge();
        charge.amount =
            int.parse(enteredAmount.padRight(enteredAmount.length + 2, '0'));
        // int.parse(enteredAmount);
        // int.parse(enteredAmount.padRight(enteredAmount.length + 2, '0'));
        charge.reference = invoiceNumber;
        charge.email = paymentConfig["customer"]["email"];

        setState(() {
          isLoaded = true;
        });

        CheckoutResponse response = await plugin.checkout(
          context,
          method: CheckoutMethod.card, // Defaults to CheckoutMethod.selectable
          charge: charge,
        );

        if (response.message == "Success" && response.reference != null) {
          Map verification = await paymentProvider
              .verifypaymentPaystack(response.reference.toString());
          if (verification['status'] == true) {
            Map data = widget.logisticsDetails;
            data["amountPayed"] = verification["data"]["amount"];
            data["status"] = "success";
            data["txRef"] = verification["data"]["reference"];
            data["payment_mode"] = _selectedPaymentMethod == "Card" ? 20 : 10;
            var logisticsProvider =
                Provider.of<LogisticsProvider>(context, listen: false);
            Map res = await logisticsProvider.createDispatch(data);
            // setState(() {
            //   isLoaded = false;
            // });

            Navigator.of(context).pushReplacementNamed(
                RequestOverviewPage.routeName,
                arguments: {
                  "uid": res["uid"].toString(),
                  "itemName": res["item_name"].toString()
                });
          }
        }
      } else {
        // charge wallet
        // get Wallet Balance
        var walletProvider =
            Provider.of<Walletprovider>(context, listen: false);
        var balance = await walletProvider.fetchBalance();

        if (double.parse(widget.logisticsDetails["price"].toString()) >
            double.parse(balance['balance'].toString())) {
          showLoading("Insufficient Funds");
        } else {
          Map res = await walletProvider.chargeWallet(
              double.parse(widget.logisticsDetails["price"].toString()));
          if (res['status'] == "success") {
            //create request
            Map data = widget.logisticsDetails;
            var logisticsProvider =
                Provider.of<LogisticsProvider>(context, listen: false);
            data["amountPayed"] = res['paid'];
            data["status"] = "success";
            data["txRef"] = res["txRef"];
            data["payment_mode"] = _selectedPaymentMethod == "Card" ? 20 : 10;
            Map<dynamic, dynamic> dis =
                await logisticsProvider.createDispatch(data);

            print(dis);

            // Map<String, String> route = {
            //   "uid": dis["uid"].toString(),
            //   "itemName": dis["item_name"].toString()
            // };

            Navigator.of(context).pushReplacementNamed(
                RequestOverviewPage.routeName,
                arguments: {
                  "uid": dis["uid"].toString(),
                  "itemName": dis["item_name"].toString()
                });
          }
        }
      }
    }
    setState(() {
      _isProcessingPayment = false;
    });
  }

  Future<void> showLoading(String message) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          actions: [
            FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"))
          ],
          content: Container(
            margin: EdgeInsets.fromLTRB(30, 20, 30, 20),
            width: double.infinity,
            height: 50,
            child: Text(message),
          ),
        );
      },
    );
  }

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

  Widget preview() {
    if (widget.logisticsDetails.isEmpty) {
      setState(() {
        isLoaded = true;
      });
    }
    if (isLoaded) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return Form(
        key: formKey,
        child: Container(
          color: Color(0xffB8DCF0),
          padding: EdgeInsets.symmetric(
              // vertical: MediaQuery.of(context).viewInsets.bottom + 10,
              vertical: 30,
              horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: const Text(
                  "Dispatch Overview",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              const Divider(),
              Container(
                padding: EdgeInsets.all(3),
                margin: EdgeInsets.all(3),
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            const WidgetSpan(
                              child: Icon(Icons.credit_card, size: 25),
                            ),
                            WidgetSpan(
                                child: SizedBox(
                              width: 2,
                            )),
                            TextSpan(
                                text: formatedCurrency(
                                    context,
                                    widget.logisticsDetails["price"]
                                        .toString()),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      const VerticalDivider(),
                      Container(
                          margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: TextFormField(
                            controller: _paymentTypeController,
                            textInputAction: TextInputAction.next,
                            style: const TextStyle(color: Colors.black),
                            readOnly: true,
                            onTap: _openBottomSheet,
                            decoration: const InputDecoration(
                              hintText: "Select Payment",
                            ),
                            validator: (value) => value!.isNotEmpty
                                ? null
                                : "Payment Type is required",
                          ),
                          width: MediaQuery.of(context).size.width * 0.3),
                    ],
                  ),
                ),
              ),
              const Divider(
                thickness: 2,
              ),
              Container(
                margin: const EdgeInsets.all(13),
                child: Text(
                  widget.logisticsDetails["distance"].toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: RaisedButton(
                  onPressed: () => _onSubmitLogisticsRequest(),
                  color: Colors.blue,
                  child: _isProcessingPayment
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Text(
                          "Pay With $_selectedPaymentMethod",
                          style: const TextStyle(color: Colors.white),
                        ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  void _openBottomSheet() {
    showModalBottomSheet(
        context: this.context,
        builder: (context) {
          return this._getCurrency();
        });
  }

  Widget _getCurrency() {
    return Container(
      height: 250,
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
      color: Colors.white,
      child: ListView(
        children: paymentMethod
            .map((currency) => ListTile(
                  onTap: () => {this._handleCurrencyTap(currency)},
                  title: Column(
                    children: [
                      Text(
                        currency,
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(height: 4),
                      Divider(height: 1)
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }

  _handleCurrencyTap(String currency) {
    this.setState(() {
      _selectedPaymentMethod = currency;
      _paymentTypeController.text = currency;
    });
    Navigator.pop(this.context);
  }

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    paymentConfig =
        await Provider.of<FlutterwavePaymentProvider>(context, listen: false)
            .paymentConfigPaystack();

    plugin.initialize(publicKey: paymentConfig["public_key"]);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return preview();
  }
}
