import 'package:flutter/material.dart';

class IssueTrackingScreen extends StatelessWidget {
  const IssueTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Issue Tracking"),
        backgroundColor: Colors.redAccent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ListTile(
            leading: Icon(Icons.bug_report, color: Colors.red),
            title: Text("Water Leakage"),
            subtitle: Text("Bathroom – Room 402"),
          ),
          ListTile(
            leading: Icon(Icons.bug_report, color: Colors.orange),
            title: Text("Power Issue"),
            subtitle: Text("Conference Hall"),
          ),
        ],
      ),
    );
  }
}
