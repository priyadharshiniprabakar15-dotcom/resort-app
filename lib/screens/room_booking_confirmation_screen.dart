import 'package:flutter/material.dart';
import 'payment_screen.dart';

class RoomBookingConfirmationScreen extends StatelessWidget {
  final String resortName;
  final String price;

  const RoomBookingConfirmationScreen({
    super.key,
    required this.resortName,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F9),
      appBar: AppBar(
        title: const Text(
          "Booking Confirmation",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF0B3C49),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 40),

            const Icon(Icons.verified,
                color: Colors.green, size: 80),

            const SizedBox(height: 20),

            const Text(
              "Booking Confirmed!",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Text(
              resortName,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 6),

            Text(
              price,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.teal,
                fontWeight: FontWeight.bold,
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PaymentScreen(
                        resortName: resortName,
                        price: price,
                      ),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF2196F3),
                        Color(0xFF1F8A70),
                      ],
                    ),
                    borderRadius:
                        BorderRadius.circular(30),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "Proceed to Payment",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
