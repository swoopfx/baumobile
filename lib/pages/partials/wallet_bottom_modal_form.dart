import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/flutterwave_payment_provider.dart';
import 'package:flutterwave/flutterwave.dart';
import '../../provider/wallet_provider.dart';

class WalletBottomModalForm extends StatefulWidget {
  const WalletBottomModalForm({Key? key}) : super(key: key);

  @override
  State<WalletBottomModalForm> createState() => _WalletBottomModalFormState();
}

class _WalletBottomModalFormState extends State<WalletBottomModalForm> {
  final formKey = GlobalKey<FormState>();
  final amountController = TextEditingController();

  _onPressed() async {
    if (this.formKey.currentState!.validate()) {
      var paymentConfig =
          await Provider.of<FlutterwavePaymentProvider>(context, listen: false)
              .paymentConfig();

      var walletProvider = Provider.of<Walletprovider>(context, listen: false);
      String fullname = paymentConfig['customer']['full_name'];
      String invoiceNumber = paymentConfig["bau_tx_ref"];

      final flutterwave = Flutterwave.forUIPayment(
          amount: amountController.text.toString().trim(),
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
      if (response != null) {
        // print(response.data);
        Map data = {};
        var walletResponse = await walletProvider.fundwallet(data);
        Navigator.of(context).pop();
        // showLoading(response.data!.status.toString()).then((value) => null);
      } else {
        // showLoading("No Response!");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
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
