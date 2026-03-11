import 'package:flutter/material.dart';
import 'payment_success_screen.dart';
import 'upi_payment_screen.dart';
import 'card_payment_screen.dart';
import 'netbanking_payment_screen.dart';

class PaymentScreen extends StatefulWidget {
  final String resortName;
  final String price;

  const PaymentScreen({
    super.key,
    required this.resortName,
    required this.price,
  });

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String? _selectedMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F7F7),

      appBar: AppBar(
        title: const Text(
          "Payment",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF1F8A70),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              widget.resortName,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 4),

            Text(
              widget.price,
              style: const TextStyle(
                color: Colors.teal,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Choose Payment Method",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            _paymentCard(Icons.credit_card, "Credit / Debit Card", "card"),
            _paymentCard(Icons.account_balance_wallet, "UPI", "upi"),
            _paymentCard(Icons.account_balance, "Net Banking", "netbanking"),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: GestureDetector(
                onTap: _selectedMethod == null ? null : _handlePayment,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: _selectedMethod == null
                        ? const LinearGradient(
                            colors: [Colors.grey, Colors.grey],
                          )
                        : const LinearGradient(
                            colors: [
                              Color(0xFF2196F3),
                              Color(0xFF1F8A70),
                            ],
                          ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "Pay Now",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _paymentCard(IconData icon, String title, String value) {
    final bool isSelected = _selectedMethod == value;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedMethod = value;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: isSelected ? Colors.teal.shade100 : Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Icon(icon, size: 28, color: const Color(0xFF1F8A70)),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            if (isSelected)
              const Icon(Icons.check_circle, color: Colors.green),
          ],
        ),
      ),
    );
  }

  void _handlePayment() {
    Widget screen;

    switch (_selectedMethod) {
      case "card":
        screen = const CardPaymentScreen();
        break;
      case "upi":
        screen = const UpiPaymentScreen();
        break;
      case "netbanking":
        screen = const NetBankingPaymentScreen();
        break;
      default:
        return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }
}
