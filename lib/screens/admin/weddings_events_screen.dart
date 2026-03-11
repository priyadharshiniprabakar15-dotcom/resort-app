import 'dart:ui';
import 'package:flutter/material.dart';

class WeddingsEventsScreen extends StatefulWidget {
  const WeddingsEventsScreen({super.key});

  @override
  State<WeddingsEventsScreen> createState() =>
      _WeddingsEventsScreenState();
}

class _WeddingsEventsScreenState
    extends State<WeddingsEventsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnim;
  late Animation<Offset> _slideAnim;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
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

      /// 🔥 APPBAR FIXED
      appBar: AppBar(
        backgroundColor: const Color(0xFF764BA2),
        elevation: 0,
        iconTheme:
            const IconThemeData(color: Colors.white),
        title: const Text(
          "Weddings & Events",
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

              /// 🔹 HEADER
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF764BA2),
                      Color(0xFF667EEA),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 32,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.celebration,
                        color: Color(0xFF764BA2),
                        size: 30,
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Expanded(
                      child: Text(
                        "Plan, manage & monitor\nweddings and resort events",
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

              /// 🔥 GLASS STAT CARDS
              Row(
                children: [
                  _glassStatCard(
                      "Upcoming Weddings", "3"),
                  const SizedBox(width: 16),
                  _glassStatCard(
                      "Corporate Events", "2"),
                ],
              ),

              const SizedBox(height: 16),

              Row(
                children: [
                  _glassStatCard(
                      "Private Functions", "4"),
                  const SizedBox(width: 16),
                  _glassStatCard(
                      "New Inquiries", "9"),
                ],
              ),

              const SizedBox(height: 30),

              const Text(
                "Upcoming Event Schedule",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              _eventTile(
                title: "Ananya & Rahul Wedding",
                subtitle: "Beach Lawn • 12–14 Feb",
                status: "Confirmed",
                statusColor: Colors.green,
              ),

              _eventTile(
                title: "TechCorp Annual Meet",
                subtitle: "Grand Ballroom • 22 Feb",
                status: "Preparation",
                statusColor: Colors.orange,
              ),

              _eventTile(
                title: "Birthday Celebration",
                subtitle: "Poolside Deck • 05 Mar",
                status: "Inquiry",
                statusColor: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 💎 GLASS CARD
  Widget _glassStatCard(String title, String value) {
    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter:
              ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius:
                  BorderRadius.circular(20),
              border: Border.all(
                color: Colors.white
                    .withOpacity(0.3),
              ),
            ),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// 🔹 EVENT TILE
  Widget _eventTile({
    required String title,
    required String subtitle,
    required String status,
    required Color statusColor,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color:
                Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 26,
            backgroundColor:
                Color(0xFF764BA2),
            child: Icon(Icons.event,
                color: Colors.white),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight:
                          FontWeight.bold),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6),
            decoration: BoxDecoration(
              color: statusColor
                  .withOpacity(0.15),
              borderRadius:
                  BorderRadius.circular(
                      12),
            ),
            child: Text(
              status,
              style: TextStyle(
                color: statusColor,
                fontSize: 12,
                fontWeight:
                    FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
