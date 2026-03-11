import 'package:flutter/material.dart';

class LostFoundScreen extends StatelessWidget {
  const LostFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text("Lost & Found"), backgroundColor: Colors.brown),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ListTile(
            leading: Icon(Icons.watch, color: Colors.brown),
            title: Text("Watch"),
            subtitle: Text("Found near pool"),
          ),
          ListTile(
            leading: Icon(Icons.phone_android, color: Colors.brown),
            title: Text("Mobile Phone"),
            subtitle: Text("Found in lobby"),
          ),
        ],
      ),
    );
  }
}
