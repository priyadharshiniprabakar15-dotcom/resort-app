import 'package:flutter/material.dart';
import 'payment_common_widgets.dart';

class UpiPaymentScreen extends StatelessWidget {
  const UpiPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return paymentScaffold(
      context,
      title: "UPI Payment",
      child: Column(
        children: [
          PaymentInput(hint: "Enter UPI ID"),
        ],
      ),
    );
  }
}
