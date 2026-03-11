import 'package:flutter/material.dart';
import 'app_drawer.dart';

class MyBookingsScreen extends StatelessWidget {
  const MyBookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Bookings"),
        backgroundColor: const Color(0xFF0B3C49),
      ),
      drawer: const AppDrawer(),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          BookingCard(
            imageUrl:
                 "https://images.unsplash.com/photo-1566073771259-6a8506099945",
            resortName: "Ocean View Resort",
            location: "Goa",
            bookingDate: "12 Feb - 15 Feb 2026",
            guests: "2 Adults",
            roomType: "Deluxe Room",
            price: "₹18,000",
            status: "Confirmed",
          ),
          SizedBox(height: 16),
          BookingCard(
            imageUrl:
                "https://images.unsplash.com/photo-1566073771259-6a8506099945",
            resortName: "Hilltop Paradise",
            location: "Ooty",
            bookingDate: "20 Mar - 22 Mar 2026",
            guests: "3 Adults",
            roomType: "Premium Villa",
            price: "₹12,500",
            status: "Completed",
          ),
        ],
      ),
    );
  }
}

/* =======================
   BOOKING CARD WIDGET
   ======================= */

class BookingCard extends StatelessWidget {
  final String imageUrl;
  final String resortName;
  final String location;
  final String bookingDate;
  final String guests;
  final String roomType;
  final String price;
  final String status;

  const BookingCard({
    super.key,
    required this.imageUrl,
    required this.resortName,
    required this.location,
    required this.bookingDate,
    required this.guests,
    required this.roomType,
    required this.price,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Resort Image
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(
              imageUrl,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          /// Booking Details
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  resortName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  location,
                  style: const TextStyle(color: Colors.grey),
                ),

                const Divider(height: 24),

                _infoRow(Icons.calendar_month, bookingDate),
                _infoRow(Icons.people, guests),
                _infoRow(Icons.bed, roomType),

                const SizedBox(height: 12),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                    _statusChip(status),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Reusable info row
  Widget _infoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.teal),
          const SizedBox(width: 8),
          Text(text),
        ],
      ),
    );
  }

  /// Booking status chip
  Widget _statusChip(String status) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: status == "Confirmed"
            ? Colors.green
            : Colors.grey.shade600,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
