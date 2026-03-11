import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'profile_screen.dart';
import 'my_bookings_screen.dart';
import 'favourites_screen.dart';
import 'login_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [

          /// 🔹 HEADER
          Container(
            height: 180,
            padding: const EdgeInsets.only(left: 16, bottom: 16),
            alignment: Alignment.bottomLeft,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF0B3C49),
                  Color(0xFF1F8A70),
                ],
              ),
            ),
            child: const Text(
              "Welcome User",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),

          _drawerItem(context, Icons.home, "Home", const HomeScreen()),
          _drawerItem(
              context, Icons.book_online, "My Bookings",
              const MyBookingsScreen()),
          _drawerItem(
              context, Icons.favorite, "Favourites",
              const FavouritesScreen()),
          _drawerItem(
              context, Icons.person, "Profile",
              const ProfileScreen()),

          const Spacer(),

          /// 🔴 LOGOUT
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text(
              "Logout",
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: () {
              Navigator.pop(context); // close drawer
              _logout(context);
            },
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _drawerItem(
      BuildContext context, IconData icon, String title, Widget screen) {
    return ListTile(
      leading: Icon(icon, color: Colors.teal),
      title: Text(title),
      onTap: () {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => screen),
        );
      },
    );
  }

  /// ✅ CLEAN LOGOUT (NO SNACKBAR, NO MOVEMENT)
  void _logout(BuildContext context) async {

    // Small delay so drawer closes smoothly
    await Future.delayed(const Duration(milliseconds: 250));

    // Navigate directly to LoginScreen
    Navigator.of(context).pushAndRemoveUntil(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 400),
        pageBuilder: (_, animation, __) => const LoginScreen(),
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
      (route) => false,
    );
  }
}
