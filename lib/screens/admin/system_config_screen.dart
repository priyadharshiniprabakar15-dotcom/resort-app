import 'package:flutter/material.dart';

class SystemConfigScreen extends StatelessWidget {
  const SystemConfigScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("System Configuration")),
      body: const Center(
        child: Text(
          "Resort rules, modules & permissions",
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
