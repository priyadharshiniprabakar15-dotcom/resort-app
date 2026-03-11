import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'payment_screen.dart';

class BookingScreen extends StatefulWidget {
  final String resortName;
  final String price;

  const BookingScreen({
    super.key,
    required this.resortName,
    required this.price,
  });

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _guestController = TextEditingController();

  /// OPEN CALENDAR
  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 2),
    );

    if (picked != null) {
      _dateController.text =
          DateFormat('dd / MM / yyyy').format(picked);
    }
  }

  void _confirmBooking() {
    if (_dateController.text.isEmpty ||
        _guestController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please select date and enter guests"),
        ),
      );
      return;
    }

    /// ✅ GO TO PAYMENT SCREEN
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => PaymentScreen(
          resortName: widget.resortName,
          price: widget.price,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _dateController.dispose();
    _guestController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F9),

      appBar: AppBar(
        title: const Text(
          "Book Resort",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF0B3C49),
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
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            Text(
              widget.price,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),

            const SizedBox(height: 24),

            const Text("Select Date"),
            const SizedBox(height: 8),

            TextField(
              controller: _dateController,
              readOnly: true,
              onTap: _selectDate,
              decoration: InputDecoration(
                hintText: "Select booking date",
                suffixIcon: const Icon(Icons.calendar_today),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text("Number of Guests"),
            const SizedBox(height: 8),

            TextField(
              controller: _guestController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Enter guests",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 40),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: GestureDetector(
                onTap: _confirmBooking,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF2196F3), // Blue
                        Color(0xFF1F8A70), // Green
                      ],
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "Confirm Booking",
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
}
