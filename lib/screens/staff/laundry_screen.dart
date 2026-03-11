import 'package:flutter/material.dart';

class LaundryScreen extends StatelessWidget {
  const LaundryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Laundry")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _laundryTile("Bedsheets", "12 Sets", Colors.blue),
          _laundryTile("Towels", "24 Items", Colors.green),
          _laundryTile("Curtains", "4 Rooms", Colors.purple),
        ],
      ),
    );
  }

  Widget _laundryTile(String item, String count, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFEDE7F6), Color(0xFFE3F2FD)],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(Icons.local_laundry_service, color: color),
          const SizedBox(width: 14),
          Expanded(child: Text(item)),
          Text(count),
        ],
      ),
    );
  }
}
