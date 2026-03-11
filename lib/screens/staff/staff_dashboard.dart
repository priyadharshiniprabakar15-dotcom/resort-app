import 'package:flutter/material.dart';
import '../login_screen.dart';

// DAILY OPS
import 'housekeeping_screen.dart';
import 'room_status_screen.dart';
import 'maintenance_screen.dart';
import 'laundry_screen.dart';

// GUEST SERVICES
import 'guest_requests_screen.dart';
import 'guest_assistance_screen.dart';
import 'lost_found_screen.dart';
import 'emergency_screen.dart';

class StaffDashboard extends StatelessWidget {
  const StaffDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // 🔙 DEVICE BACK → LOGIN
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const LoginScreen()),
        );
        return false;
      },
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF43CEA2),
                Color(0xFF56CCF2),
                Color(0xFF2F80ED),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [

                // 🔹 HEADER WITH BACK ICON
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      // 🔙 BACK ICON
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const LoginScreen(),
                            ),
                          );
                        },
                      ),

                      const Text(
                        "Staff Dashboard",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.badge, color: Color(0xFF2F80ED)),
                      ),
                    ],
                  ),
                ),

                // 🔹 MAIN CONTENT
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(30)),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [

                          _title("Daily Operations"),
                          _grid([
                            _tile(context, "Housekeeping",
                                "assets/images/service.jpg",
                                HousekeepingScreen()),
                            _tile(context, "Room Status",
                                "assets/images/rooms.jpg",
                                RoomStatusScreen()),
                            _tile(context, "Maintenance",
                                "assets/images/staff.jpg",
                                MaintenanceScreen()),
                            _tile(context, "Laundry",
                                "assets/images/pay.jpg",
                                LaundryScreen()),
                          ]),

                          const SizedBox(height: 24),

                          _title("Guest Services"),
                          _grid([
                            _tile(context, "Guest Requests",
                                "assets/images/onboard 3.jpg",
                                GuestRequestsScreen()),
                            _tile(context, "Guest Assistance",
                                "assets/images/onboard 1.jpg",
                                GuestAssistanceScreen()),
                            _tile(context, "Lost & Found",
                                "assets/images/wed.jpg",
                                LostFoundScreen()),
                            _tile(context, "Emergency",
                                "assets/images/room&villa.jpg",
                                EmergencyScreen()),
                          ]),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 🔹 SECTION TITLE
  static Widget _title(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Text(
          text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  // 🔹 GRID
  static Widget _grid(List<Widget> children) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      children: children,
    );
  }

  // 🔹 TILE WITH NAVIGATION
  static Widget _tile(
    BuildContext context,
    String title,
    String image,
    Widget screen,
  ) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => screen),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [
              Color(0xFFE3F2FD),
              Color(0xFFE8F5E9),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 10,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 32,
              backgroundImage: AssetImage(image),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
