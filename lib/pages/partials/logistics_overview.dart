import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LogisticsOverView extends StatefulWidget {
  Map logisticsDetails = {};

  LogisticsOverView({Key? key, required this.logisticsDetails})
      : super(key: key);

  @override
  State<LogisticsOverView> createState() => _LogisticsOverViewState();
}

class _LogisticsOverViewState extends State<LogisticsOverView> {
  bool isLoaded = false;
// final mediaQuery = ;
  void processPayment(BuildContext context) {
    Navigator.of(context).pop();
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
                onPressed: () => processPayment(context), child: Text("PRE")),
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
  Widget build(BuildContext context) {
    return preview();
  }
}
