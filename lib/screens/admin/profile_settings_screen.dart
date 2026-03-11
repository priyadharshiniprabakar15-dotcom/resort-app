import 'package:flutter/material.dart';

class ProfileSettingsScreen extends StatelessWidget {
  const ProfileSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile Settings")),
      body: const Center(
        child: Text(
          "Admin profile details will be managed here",
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
