import 'package:flutter/material.dart';

class SupportTicketsScreen extends StatefulWidget {
  @override
  State<SupportTicketsScreen> createState() => _SupportTicketsScreenState();
}

class _SupportTicketsScreenState extends State<SupportTicketsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fade;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 700));
    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        title: const Text("Support Tickets"),
        backgroundColor: const Color(0xFF764BA2),
      ),
      body: FadeTransition(
        opacity: _fade,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: const [
            ListTile(
              leading: Icon(Icons.confirmation_number, color: Colors.deepPurple),
              title: Text("Ticket #1023"),
              subtitle: Text("AC issue – Room 201"),
              trailing: Text("Open",
                  style: TextStyle(color: Colors.red)),
            ),
            ListTile(
              leading: Icon(Icons.confirmation_number, color: Colors.deepPurple),
              title: Text("Ticket #1024"),
              subtitle: Text("WiFi not working"),
              trailing: Text("In Progress",
                  style: TextStyle(color: Colors.orange)),
            ),
            ListTile(
              leading: Icon(Icons.confirmation_number, color: Colors.deepPurple),
              title: Text("Ticket #1025"),
              subtitle: Text("TV repaired"),
              trailing:
                  Text("Closed", style: TextStyle(color: Colors.green)),
            ),
          ],
        ),
      ),
    );
  }
}
