import 'package:flutter/material.dart';
import 'guest_profile_screen.dart';

class AdminBookingsScreen extends StatelessWidget {
  const AdminBookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          /// ✅ FIXED HEADER HEIGHT (Responsive)
          Container(
            height: 340, // 🔥 increased height
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF1F8A70),
                  Color(0xFF136A8A),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(40),
              ),
            ),
          ),

          SafeArea(
            child: Column(
              children: [

                /// HEADER
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back,
                            color: Colors.white),
                        onPressed: () =>
                            Navigator.pop(context),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        "Bookings Overview",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                /// STATS
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Expanded(
                            child: _StatCard(
                                title: "Total Bookings",
                                value: "128"),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: _StatCard(
                                title: "Upcoming",
                                value: "34"),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: const [
                          Expanded(
                            child: _StatCard(
                                title: "Cancelled",
                                value: "6"),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: _StatCard(
                                title: "Completed",
                                value: "88"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30), // 🔥 more spacing

                /// WHITE SECTION
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      color: Color(0xFFF5F7FA),
                      borderRadius:
                          BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                    ),
                    child: ListView(
                      children: [

                        const Text(
                          "Recent Bookings",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 16),

                        _bookingTile(
                          context,
                          "https://randomuser.me/api/portraits/men/32.jpg",
                          "Rahul Sharma",
                          "Premium Suite",
                          "12 Jan – 16 Jan",
                          "Confirmed",
                          Colors.green,
                        ),

                        _bookingTile(
                          context,
                          "https://randomuser.me/api/portraits/women/44.jpg",
                          "Ananya Patel",
                          "Garden Villa",
                          "18 Jan – 20 Jan",
                          "Pending",
                          Colors.orange,
                        ),

                        _bookingTile(
                          context,
                          "https://randomuser.me/api/portraits/men/65.jpg",
                          "John Williams",
                          "Mountain View",
                          "05 Feb – 08 Feb",
                          "Cancelled",
                          Colors.red,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// BOOKING TILE
  Widget _bookingTile(
    BuildContext context,
    String imageUrl,
    String guest,
    String room,
    String date,
    String status,
    Color statusColor,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) =>
                GuestProfileScreen(
              imageUrl: imageUrl,
              name: guest,
              room: room,
              date: date,
              status: status,
            ),
          ),
        );
      },
      child: Container(
        margin:
            const EdgeInsets.only(bottom: 14),
        padding:
            const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black
                  .withOpacity(0.08),
              blurRadius: 8,
              offset:
                  const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundImage:
                  NetworkImage(imageUrl),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(guest,
                      style: const TextStyle(
                          fontWeight:
                              FontWeight.bold)),
                  Text(
                    "$room • $date",
                    style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey),
                  ),
                ],
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6),
              decoration:
                  BoxDecoration(
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
                  fontWeight:
                      FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;

  const _StatCard({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white
            .withOpacity(0.2),
        borderRadius:
            BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style:
                const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight:
                  FontWeight.bold,
            ),
          ),
          Text(
            title,
            style:
                const TextStyle(
              color:
                  Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}
