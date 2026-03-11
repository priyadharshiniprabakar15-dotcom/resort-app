import 'package:flutter/material.dart';
import 'staff_department_detail_screen.dart';

class StaffManagementScreen extends StatefulWidget {
  const StaffManagementScreen({super.key});

  @override
  State<StaffManagementScreen> createState() =>
      _StaffManagementScreenState();
}

class _StaffManagementScreenState
    extends State<StaffManagementScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnim;
  late Animation<Offset> _slideAnim;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _fadeAnim =
        CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _slideAnim = Tween<Offset>(
      begin: const Offset(0, 0.08),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

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
      backgroundColor: const Color(0xFFF4F7FB),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F8A70),
        elevation: 0,
        iconTheme:
            const IconThemeData(color: Colors.white),
        title: const Text(
          "Staff Management",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FadeTransition(
        opacity: _fadeAnim,
        child: SlideTransition(
          position: _slideAnim,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [

              _staffCard(
                icon: Icons.cleaning_services,
                title: "Housekeeping",
                subtitle: "Room cleaning & laundry",
                count: "12 Staff",
                color: Colors.green,
              ),

              _staffCard(
                icon: Icons.support_agent,
                title: "Front Desk",
                subtitle: "Guest check-in & support",
                count: "6 Staff",
                color: Colors.blue,
              ),

              _staffCard(
                icon: Icons.build,
                title: "Maintenance",
                subtitle: "Electrical & plumbing",
                count: "4 Staff",
                color: Colors.orange,
              ),

              _staffCard(
                icon: Icons.security,
                title: "Security",
                subtitle: "Safety & surveillance",
                count: "8 Staff",
                color: Colors.red,
              ),

              _staffCard(
                icon: Icons.restaurant,
                title: "Restaurant & Kitchen",
                subtitle: "Chefs & service crew",
                count: "10 Staff",
                color: Colors.purple,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _staffCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required String count,
    required Color color,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => StaffDepartmentDetailScreen(
              title: title,
              subtitle: subtitle,
              count: count,
              color: color,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [

            CircleAvatar(
              radius: 28,
              backgroundColor:
                  color.withOpacity(0.15),
              child: Icon(icon,
                  size: 28, color: color),
            ),

            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontWeight:
                            FontWeight.bold,
                        fontSize: 16),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                        color: Colors.grey),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    count,
                    style: TextStyle(
                        color: color,
                        fontWeight:
                            FontWeight.w600),
                  ),
                ],
              ),
            ),

            const Icon(Icons.arrow_forward_ios,
                size: 14, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
