import 'package:flutter/material.dart';

class LiveRequestsScreen extends StatelessWidget {
  const LiveRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Live Requests"),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ListTile(
            leading: Icon(Icons.chat, color: Colors.blue),
            title: Text("Extra Towels"),
            subtitle: Text("Room 101"),
          ),
          ListTile(
            leading: Icon(Icons.chat, color: Colors.blue),
            title: Text("Late Checkout"),
            subtitle: Text("Room 212"),
          ),
        ],
      ),
    );
  }
}
