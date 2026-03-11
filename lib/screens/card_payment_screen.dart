import 'package:flutter/material.dart';
import 'payment_common_widgets.dart';

class CardPaymentScreen extends StatelessWidget {
  const CardPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return paymentScaffold(
      context,
      title: "Card Payment",
      child: Column(
        children: [
          PaymentInput(hint: "Card Number"),
          PaymentInput(hint: "Expiry Date"),
          PaymentInput(hint: "CVV"),
        ],
      ),
    );
  }
}
