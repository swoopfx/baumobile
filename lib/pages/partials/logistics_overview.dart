import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:flutterwave/flutterwave.dart';
import '../../provider/flutterwave_payment_provider.dart';

class LogisticsOverView extends StatefulWidget {
  Map logisticsDetails = {};

  LogisticsOverView({Key? key, required this.logisticsDetails})
      : super(key: key);

  @override
  State<LogisticsOverView> createState() => _LogisticsOverViewState();
}

class _LogisticsOverViewState extends State<LogisticsOverView> {
  bool isLoaded = false;

  Map paymentConfig = {
    "channel": "Flutterwave",
    "public_key": "FLWPUBK_TEST-de78bdcbfddc309da479426460ffe81c-X",
    "secret_key": "FLWSECK_TEST-874b3c83e0f048c71ceade34c7af0f58-X",
    "encrption_key": "FLWSECK_TEST7bd22c1713a1",
    "bau_tx_ref": "inv61b84e78aff53",
    "customer": {
      "uid": "19879689605fbfcbd850e9a",
      "full_name": "Ezekiel Ajayjuy",
      "email": "ezekiel_a@yahoo.com",
      "phoneNumber": "08092907113"
    }
  };

  _onSubmitLogisticsRequest() async {
    // try {
    String fullname = paymentConfig['customer']['full_name'];
    String invoiceNumber = paymentConfig["bau_tx_ref"];
    print(paymentConfig["bau_tx_ref"]);
    final flutterwave = Flutterwave.forUIPayment(
        amount: widget.logisticsDetails["price"].toString(),
        currency: FlutterwaveCurrency.NGN,
        context: context,
        publicKey: paymentConfig["public_key"],
        encryptionKey: paymentConfig["encrption_key"],
        email: paymentConfig["customer"]["email"],
        fullName: paymentConfig["customer"]["full_name"],
        txRef: invoiceNumber,
        narration:
            "Payment by $fullname for  for invoice number $invoiceNumber ",
        isDebugMode: true,
        phoneNumber: paymentConfig["customer"]["phoneNumber"],
        acceptCardPayment: true,
        acceptUSSDPayment: false,
        acceptAccountPayment: false,
        acceptFrancophoneMobileMoney: false,
        acceptGhanaPayment: false,
        acceptMpesaPayment: false,
        acceptRwandaMoneyPayment: true,
        acceptUgandaPayment: false,
        acceptZambiaPayment: false);

    final response = await flutterwave.initializeForUiPayments();
    // final response = await flutterwave.initializeForUiPayments();
    if (response != null) {
      print(response.data);
      showLoading(response.data!.status.toString()).then((value) => null);
    } else {
      showLoading("No Response!");
    }
    // } catch (e) {
    //   return showDialog<Null>(
    //       context: context,
    //       builder: (_) => AlertDialog(
    //             title: Text("Error Occured"),
    //             content: Text(e.toString()),
    //             actions: [
    //               FlatButton(
    //                   onPressed: () {
    //                     Navigator.of(context).pop();
    //                     // _isLoading = false;
    //                   },
    //                   child: Text("OK"))
    //             ],
    //           ));
    // }
  }

  _hydrateRequest() async {
    // charge card
    // final response = await Provider.of<FlutterwavePaymentProvider>(context)
    //     .verifypayment(txRef, amountPayed);
    // verify payment;
    //if successfull payment post
    // send logistics post
    // redirect and replace to logistics overview page
  }

  Future<void> showLoading(String message) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
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
      return Container(
        color: Color(0xffB8DCF0),
        padding: EdgeInsets.only(
            top: 0,
            left: 0,
            right: 0,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10),
        child: Column(
          children: [
            Row(
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Icon(Icons.credit_card, size: 14),
                      ),
                      TextSpan(
                        text: formatedCurrency(context,
                            widget.logisticsDetails["price"].toString()),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              child: Text(widget.logisticsDetails["distance"].toString()),
            ),
            ElevatedButton(
                onPressed: () => _onSubmitLogisticsRequest(),
                child: Text("PRE")),
            FloatingActionButton(
              onPressed: () => null,
              child: Text("PP"),
            ),
          ],
        ),
      );
    }
  }

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    // paymentConfig =
    //     await Provider.of<FlutterwavePaymentProvider>(context, listen: false)
    //         .paymentConfig();
    // print(paymentConfig);
  }

  @override
  Widget build(BuildContext context) {
    return preview();
  }
}
