import 'dart:ui';
import 'package:flutter/material.dart';

class RoomsInventoryScreen extends StatefulWidget {
  const RoomsInventoryScreen({super.key});

  @override
  State<RoomsInventoryScreen> createState() => _RoomsInventoryScreenState();
}

class _RoomsInventoryScreenState extends State<RoomsInventoryScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnim;
  late Animation<Offset> _slideAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));

    _fadeAnim =
        CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _slideAnim = Tween<Offset>(
      begin: const Offset(0, 0.08),
      end: Offset.zero,
    ).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeOut));

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
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF1F8A70),
              Color(0xFF136A8A),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [

              /// 🔥 HEADER
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back,
                          color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      "Rooms & Inventory",
                      style: TextStyle(
                        color: Colors.white,   // ✅ WHITE TITLE
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              /// 🔥 GLASS STYLE STATS (LIKE BOOKINGS SCREEN)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: const [
                    Row(
                      children: [
                        Expanded(
                          child: _GlassStatCard(
                            title: "Available",
                            value: "42",
                            icon: Icons.check_circle,
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: _GlassStatCard(
                            title: "Occupied",
                            value: "76",
                            icon: Icons.hotel,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: _GlassStatCard(
                            title: "Maintenance",
                            value: "4",
                            icon: Icons.build,
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: _GlassStatCard(
                            title: "Total Rooms",
                            value: "122",
                            icon: Icons.apartment,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              /// 🔥 WHITE CONTENT SECTION
              Expanded(
                child: FadeTransition(
                  opacity: _fadeAnim,
                  child: SlideTransition(
                    position: _slideAnim,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                        color: Color(0xFFF4F7FB),
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(30),
                        ),
                      ),
                      child: ListView(
                        children: [

                          const Text(
                            "Room Category Status",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),

                          const SizedBox(height: 16),

                          _roomTile(
                            title: "Premium Suites",
                            available: "12",
                            occupied: "28",
                          ),
                          _roomTile(
                            title: "Garden Villas",
                            available: "8",
                            occupied: "14",
                          ),
                          _roomTile(
                            title: "Mountain View Rooms",
                            available: "10",
                            occupied: "22",
                          ),
                          _roomTile(
                            title: "Family Rooms",
                            available: "12",
                            occupied: "16",
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔹 ROOM CATEGORY TILE
  Widget _roomTile({
    required String title,
    required String available,
    required String occupied,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: Color(0xFF1F8A70),
            child: Icon(Icons.hotel, color: Colors.white),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                Text(
                  "Available: $available  |  Occupied: $occupied",
                  style: const TextStyle(
                      fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// 🔥 GLASS STAT CARD (MATCH BOOKINGS SCREEN STYLE)
class _GlassStatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const _GlassStatCard({
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.12),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.white.withOpacity(0.3),
            ),
          ),
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    value,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Icon(
                icon,
                color: Colors.white70,
                size: 26,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
