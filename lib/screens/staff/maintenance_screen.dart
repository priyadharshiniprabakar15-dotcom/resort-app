import 'package:flutter/material.dart';

class MaintenanceScreen extends StatelessWidget {
  const MaintenanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Maintenance")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _issueTile("AC Repair", "Room 203", Colors.red),
          _issueTile("Water Leakage", "Room 108", Colors.orange),
          _issueTile("Light Issue", "Lobby", Colors.blue),
        ],
      ),
    );
  }

  Widget _issueTile(String issue, String location, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.build, color: color),
          const SizedBox(width: 14),
          Expanded(child: Text("$issue – $location")),
          const Text("Pending"),
        ],
      ),
    );
  }
}
