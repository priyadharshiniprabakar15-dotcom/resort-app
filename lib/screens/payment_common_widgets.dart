import 'package:flutter/material.dart';

Widget paymentScaffold(
  BuildContext context, {
  required String title,
  required Widget child,
}) {
  return Scaffold(
    appBar: AppBar(
      title: Text(title),
      backgroundColor: const Color(0xFF1F8A70),
      centerTitle: true,
    ),
    body: Padding(
      padding: const EdgeInsets.all(20),
      child: child,
    ),
  );
}

class PaymentInput extends StatelessWidget {
  final String hint;
  const PaymentInput({super.key, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
