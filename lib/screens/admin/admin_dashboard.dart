import 'dart:ui';
import 'package:flutter/material.dart';
import '../login_screen.dart';

// 🔹 ADMIN MODULE SCREENS
import 'bookings1screen.dart';
import 'rooms_inventory_screen.dart';
import 'offers_packages_screen.dart';
import 'staff_management_screen.dart';
import 'guest_support_screen.dart';
import 'weddings_events_screen.dart';
import 'payments_reports_screen.dart';
import 'admin_settings_screen.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
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
                Color(0xFF5F2C82),
                Color(0xFF4A00E0),
                Color(0xFF0F2027),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// ================= HEADER =================
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon:
                            const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const LoginScreen()),
                          );
                        },
                      ),
                      const Text(
                        "Admin Dashboard",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.admin_panel_settings,
                          color: Color(0xFF4A00E0),
                        ),
                      ),
                    ],
                  ),
                ),

                /// ================= PREMIUM GLASS STATS =================
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: const [
                      Row(
                        children: [
                          Expanded(
                            child: _GlassStatBox(
                              title: "Bookings",
                              value: "128",
                              icon: Icons.calendar_today,
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: _GlassStatBox(
                              title: "Revenue",
                              value: "₹4.6L",
                              icon: Icons.currency_rupee,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: _GlassStatBox(
                              title: "Occupancy",
                              value: "82%",
                              icon: Icons.hotel,
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: _GlassStatBox(
                              title: "Events",
                              value: "12",
                              icon: Icons.celebration,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                /// ================= MAIN WHITE SECTION =================
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [

                          _sectionTitle("Administration"),
                          _grid([
                            _adminTile(
                              context,
                              "Bookings",
                              "assets/images/boo.jpg",
                              const AdminBookingsScreen(),
                            ),
                            _adminTile(
                              context,
                              "Rooms & Inventory",
                              "assets/images/room&villa.jpg",
                              const RoomsInventoryScreen(),
                            ),
                            _adminTile(
                              context,
                              "Offers & Packages",
                              "assets/images/off.jpg",
                              const OffersPackagesScreen(),
                            ),
                            _adminTile(
                              context,
                              "Staff Management",
                              "assets/images/staff.jpg",
                              const StaffManagementScreen(),
                            ),
                          ]),

                          const SizedBox(height: 24),

                          _sectionTitle("Operations & Support"),
                          _grid([
                            _adminTile(
                              context,
                              "Guest Support",
                              "assets/images/act2.jpg",
                              const GuestSupportScreen(),
                            ),
                            _adminTile(
                              context,
                              "Weddings & Events",
                              "assets/images/wed.jpg",
                              const WeddingsEventsScreen(),
                            ),
                            _adminTile(
                              context,
                              "Payments & Reports",
                              "assets/images/pay.jpg",
                              const PaymentsReportsScreen(),
                            ),
                            _adminTile(
                              context,
                              "Settings",
                              "assets/images/act1.jpg",
                              const AdminSettingsScreen(),
                            ),
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

  /// ================= SECTION TITLE =================
  static Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  /// ================= GRID =================
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

  /// ================= ADMIN TILE =================
  static Widget _adminTile(
    BuildContext context,
    String title,
    String imagePath,
    Widget screen,
  ) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => screen),
        );
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [
              Color(0xFFEDE7F6),
              Color(0xFFE3F2FD),
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
              backgroundImage: AssetImage(imagePath),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// ================= PREMIUM GLASS STAT BOX =================
class _GlassStatBox extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const _GlassStatBox({
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.white.withOpacity(0.3),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              Icon(
                icon,
                color: Colors.white.withOpacity(0.8),
                size: 28,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
