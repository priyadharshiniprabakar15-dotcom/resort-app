import 'package:flutter/material.dart';

class GuestProfileScreen extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String room;
  final String date;
  final String status;

  const GuestProfileScreen({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.room,
    required this.date,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final Color statusColor = status == "Confirmed"
        ? Colors.green
        : status == "Pending"
            ? Colors.orange
            : Colors.red;

    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FB),
      body: SingleChildScrollView(
        child: Column(
          children: [

            /// 🔥 HEADER SECTION
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [

                Container(
                  height: 220,
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

                Positioned(
                  top: 40,
                  left: 10,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back,
                        color: Colors.white),
                    onPressed: () =>
                        Navigator.pop(context),
                  ),
                ),

                const Positioned(
                  top: 40,
                  child: Text(
                    "Guest Profile",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                Positioned(
                  bottom: -60,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: Colors.white,
                          width: 4),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black
                              .withOpacity(0.25),
                          blurRadius: 12,
                          offset:
                              const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 65,
                      backgroundImage:
                          NetworkImage(imageUrl),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 80),

            /// 👤 NAME
            Text(
              name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            Text(
              "$name@email.com",
              style: const TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 4),

            const Text(
              "+91 9876543210",
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 30),

            /// 📄 BOOKING CARD
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 16),
              padding:
                  const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black
                        .withOpacity(0.08),
                    blurRadius: 12,
                    offset:
                        const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [

                  const Text(
                    "Booking Information",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  _infoRow(Icons.hotel, "Room", room),

                  const SizedBox(height: 16),

                  _infoRow(Icons.date_range, "Stay Duration", date),

                  const SizedBox(height: 16),

                  Row(
                    children: [
                      const Icon(
                        Icons.info_outline,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        "Status",
                        style: TextStyle(
                            fontWeight:
                                FontWeight.w500),
                      ),
                      const Spacer(),
                      Container(
                        padding:
                            const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 6),
                        decoration:
                            BoxDecoration(
                          color:
                              statusColor
                                  .withOpacity(
                                      0.15),
                          borderRadius:
                              BorderRadius
                                  .circular(
                                      20),
                        ),
                        child: Text(
                          status,
                          style:
                              TextStyle(
                            color:
                                statusColor,
                            fontWeight:
                                FontWeight
                                    .w600,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  /// 🔘 CONTACT BUTTON (WHITE TEXT FIXED)
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style:
                          ElevatedButton
                              .styleFrom(
                        backgroundColor:
                            const Color(
                                0xFF1F8A70),
                        foregroundColor:
                            Colors.white, // ✅ ensures white text
                        padding:
                            const EdgeInsets
                                .symmetric(
                                    vertical:
                                        14),
                        shape:
                            RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius
                                  .circular(
                                      16),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Contact Guest",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white, // ✅ explicitly white
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(
      IconData icon,
      String label,
      String value) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey),
        const SizedBox(width: 12),
        Text(
          label,
          style: const TextStyle(
              fontWeight:
                  FontWeight.w500),
        ),
        const Spacer(),
        Text(value),
      ],
    );
  }
}
