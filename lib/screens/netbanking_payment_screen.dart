import 'package:flutter/material.dart';
import 'payment_common_widgets.dart';

class NetBankingPaymentScreen extends StatelessWidget {
  const NetBankingPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return paymentScaffold(
      context,
      title: "Net Banking",
      child: Column(
        children: [
          PaymentInput(hint: "Bank Name"),
        ],
      ),
    );
  }
}
