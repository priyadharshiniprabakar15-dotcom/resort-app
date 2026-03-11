import 'package:flutter/material.dart';

class StaffDepartmentDetailScreen
    extends StatefulWidget {
  final String title;
  final String subtitle;
  final String count;
  final Color color;

  const StaffDepartmentDetailScreen({
    super.key,
    required this.title,
    required this.subtitle,
    required this.count,
    required this.color,
  });

  @override
  State<StaffDepartmentDetailScreen>
      createState() =>
          _StaffDepartmentDetailScreenState();
}

class _StaffDepartmentDetailScreenState
    extends State<StaffDepartmentDetailScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fade;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration:
            const Duration(milliseconds: 600));

    _fade = CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn);

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
      backgroundColor:
          const Color(0xFFF4F7FB),
      appBar: AppBar(
        backgroundColor: widget.color,
        elevation: 0,
        iconTheme:
            const IconThemeData(
                color: Colors.white),
        title: Text(
          widget.title,
          style: const TextStyle(
              color: Colors.white),
        ),
      ),
      body: FadeTransition(
        opacity: _fade,
        child: ListView(
          padding:
              const EdgeInsets.all(20),
          children: [

            /// STAFF COUNT CARD
            Container(
              padding:
                  const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: widget.color
                    .withOpacity(0.1),
                borderRadius:
                    BorderRadius.circular(
                        20),
              ),
              child: Row(
                children: [
                  Icon(Icons.groups,
                      size: 40,
                      color: widget.color),
                  const SizedBox(width: 16),
                  Text(
                    widget.count,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight:
                          FontWeight.bold,
                      color: widget.color,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "Department Overview",
              style: TextStyle(
                  fontWeight:
                      FontWeight.bold,
                  fontSize: 16),
            ),

            const SizedBox(height: 10),

            Text(
              "The ${widget.title} department ensures smooth resort operations. Staff handle daily responsibilities, shift management, and service quality monitoring through the admin dashboard.",
              style: const TextStyle(
                  color: Colors.grey),
            ),

            const SizedBox(height: 30),

            const Text(
              "Team Members",
              style: TextStyle(
                  fontWeight:
                      FontWeight.bold,
                  fontSize: 16),
            ),

            const SizedBox(height: 10),

            _memberTile("Arun Kumar"),
            _memberTile("Priya Nair"),
            _memberTile("Rahul Singh"),
          ],
        ),
      ),
    );
  }

  Widget _memberTile(String name) {
    return Container(
      margin:
          const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color:
                Colors.black.withOpacity(0.06),
            blurRadius: 8,
          )
        ],
      ),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor:
              Color(0xFF1F8A70),
          child: Icon(Icons.person,
              color: Colors.white),
        ),
        title: Text(name),
        subtitle:
            const Text("Active Staff"),
      ),
    );
  }
}
