import 'package:flutter/material.dart';

class GuestSupportScreen extends StatefulWidget {
  const GuestSupportScreen({super.key});

  @override
  State<GuestSupportScreen> createState() =>
      _GuestSupportScreenState();
}

class _GuestSupportScreenState
    extends State<GuestSupportScreen>
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

      /// 🔥 APPBAR
      appBar: AppBar(
        backgroundColor: const Color(0xFF5E17EB),
        elevation: 0,
        iconTheme:
            const IconThemeData(color: Colors.white),
        title: const Text(
          "Guest Support",
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

              /// 🔹 HEADER CARD
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF5E17EB),
                      Color(0xFF1F8A70),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Row(
                  children: const [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.support_agent,
                        size: 32,
                        color: Color(0xFF5E17EB),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        "Handle guest queries,\ncomplaints & service tickets",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              /// 🔥 SOFT PROFESSIONAL STAT CARDS
              Row(
                children: [
                  _gradientStatCard(
                    title: "Open Tickets",
                    value: "8",
                    icon: Icons.mark_email_unread,
                    gradientColors: const [
                      Color(0xFF4A90E2),
                      Color(0xFF5DADE2),
                    ],
                  ),
                  const SizedBox(width: 16),
                  _gradientStatCard(
                    title: "Resolved Today",
                    value: "14",
                    icon: Icons.check_circle,
                    gradientColors: const [
                      Color(0xFF1F8A70),
                      Color(0xFF48C9B0),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 30),

              const Text(
                "Recent Support Requests",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              _ticketCard(
                guest: "Aarav Mehta",
                issue: "AC not cooling",
                status: "Open",
                statusColor: const Color(0xFF4A90E2),
              ),

              _ticketCard(
                guest: "Sophia Williams",
                issue: "Late room service",
                status: "In Progress",
                statusColor: Colors.orange,
              ),

              _ticketCard(
                guest: "Rohit Kumar",
                issue: "Wi-Fi connectivity issue",
                status: "Resolved",
                statusColor: const Color(0xFF1F8A70),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔹 GRADIENT STAT CARD
  Widget _gradientStatCard({
    required String title,
    required String value,
    required IconData icon,
    required List<Color> gradientColors,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: gradientColors.last.withOpacity(0.3),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(height: 12),
            Text(
              value,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 🔹 SUPPORT TICKET CARD
  Widget _ticketCard({
    required String guest,
    required String issue,
    required String status,
    required Color statusColor,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: CircleAvatar(
          radius: 26,
          backgroundColor: statusColor.withOpacity(0.15),
          child: Icon(Icons.person,
              color: statusColor),
        ),
        title: Text(
          guest,
          style:
              const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(issue),
        trailing: Container(
          padding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: statusColor.withOpacity(0.15),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            status,
            style: TextStyle(
              color: statusColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
