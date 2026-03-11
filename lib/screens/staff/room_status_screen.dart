import 'package:flutter/material.dart';

class RoomStatusScreen extends StatelessWidget {
  const RoomStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Room Status")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _statusCard("Available Rooms", "42", Colors.green),
          _statusCard("Occupied Rooms", "76", Colors.red),
          _statusCard("Under Maintenance", "4", Colors.orange),
        ],
      ),
    );
  }

  Widget _statusCard(String title, String value, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFE3F2FD), Color(0xFFE8F5E9)],
        ),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: color.withOpacity(0.2),
            child: Icon(Icons.hotel, color: color),
          ),
          const SizedBox(width: 14),
          Expanded(child: Text(title)),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
