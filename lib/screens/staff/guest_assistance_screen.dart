import 'package:flutter/material.dart';

class GuestAssistanceScreen extends StatelessWidget {
  const GuestAssistanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text("Guest Assistance"), backgroundColor: Colors.indigo),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ListTile(
            leading: Icon(Icons.directions, color: Colors.indigo),
            title: Text("Resort Directions"),
          ),
          ListTile(
            leading: Icon(Icons.local_taxi, color: Colors.indigo),
            title: Text("Taxi / Transport Help"),
          ),
          ListTile(
            leading: Icon(Icons.info, color: Colors.indigo),
            title: Text("General Information"),
          ),
        ],
      ),
    );
  }
}
