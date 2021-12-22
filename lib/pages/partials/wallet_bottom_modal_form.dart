import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/flutterwave_payment_provider.dart';
// import 'package:monnify_flutter_sdk/monnify_flutter_sdk.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import '../../provider/wallet_provider.dart';
import '../wallet_page.dart';

class WalletBottomModalForm extends StatefulWidget {
  const WalletBottomModalForm({Key? key}) : super(key: key);

  @override
  State<WalletBottomModalForm> createState() => _WalletBottomModalFormState();
}

class _WalletBottomModalFormState extends State<WalletBottomModalForm> {
  final formKey = GlobalKey<FormState>();
  final amountController = TextEditingController();
  var paymentConfig = {};

  bool _isProcessingPayment = false;

  final plugin = PaystackPlugin();

  @override
  void initState() {
    super.initState();
  }

  void didChangeDependencies() async {
    super.didChangeDependencies();
    paymentConfig = await Provider.of<FlutterwavePaymentProvider>(context)
        .paymentConfigPaystack();
    plugin.initialize(publicKey: paymentConfig["public_key"]);
    // MonnifyFlutterSdk.initialize(paymentConfig["api_key"],
    //     paymentConfig["contract_code"], ApplicationMode.LIVE);
  }

  _onPressed() async {
    if (formKey.currentState!.validate()) {
      var paymentProvider =
          Provider.of<FlutterwavePaymentProvider>(context, listen: false);
      var paymentConfig = await paymentProvider.paymentConfig();

      var walletProvider = Provider.of<Walletprovider>(context, listen: false);
      String fullname = paymentConfig['customer']['full_name'];
      String invoiceNumber = paymentConfig["bau_tx_ref"];

      // Charge charge = Charge()
      String enteredAmount = amountController.text.toString();
      //  int.parse(enteredAmount.padRight(enteredAmount.length + 2, '0'));
      Charge charge = Charge();
      charge.amount =
          int.parse(enteredAmount.padRight(enteredAmount.length + 2, '0'));
      int.parse(enteredAmount.padRight(enteredAmount.length + 2, '0'));
      charge.reference = invoiceNumber;
      charge.email = paymentConfig["customer"]["email"];

      CheckoutResponse response = await plugin.checkout(
        context,
        method: CheckoutMethod.card, // Defaults to CheckoutMethod.selectable
        charge: charge,
      );

      setState(() {
        _isProcessingPayment = true;
      });

      // print(response);

      if (response.message == "Success" && response.reference != null) {
        Map verification = await paymentProvider
            .verifypaymentPaystack(response.reference.toString());
        if (verification['status'] == true) {
          Map data = {
            "status": "success",
            "txRef": verification["data"]["reference"],
            "amountPayed": (verification["data"]["amount"] / 100).toString()
          };

          await walletProvider.fundwallet(data);
          // print(wres);
          setState(() {
            _isProcessingPayment = false;
            Navigator.of(context).pushReplacementNamed(Wallet.routeName);
          });
        }
      }
      setState(() {
        _isProcessingPayment = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isProcessingPayment
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Form(
            key: this.formKey,
            child: Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                    child: TextFormField(
                      controller: this.amountController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(hintText: "Amount"),
                      validator: (value) =>
                          value!.isNotEmpty ? null : "Amount is required",
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                    child: RaisedButton(
                      onPressed: () => _onPressed(),
                      color: Colors.blue,
                      child: Text(
                        "Make Payment",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
  }
}
