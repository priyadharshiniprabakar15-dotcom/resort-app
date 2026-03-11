import 'package:flutter/material.dart';

class EscalationsScreen extends StatelessWidget {
  const EscalationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Escalations"),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ListTile(
            leading: Icon(Icons.trending_up, color: Colors.red),
            title: Text("Repeated AC Complaint"),
            subtitle: Text("Room 210"),
          ),
          ListTile(
            leading: Icon(Icons.trending_up, color: Colors.red),
            title: Text("Payment Issue"),
            subtitle: Text("Front Desk"),
          ),
        ],
      ),
    );
  }
}
