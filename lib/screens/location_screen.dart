import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnim;

  final String hotelName = "Oxy Valley Resort";
  final String hotelAddress =
      "Kurumbapalayam, Sathy Main Road, Coimbatore, Tamil Nadu";

  /// ✅ GOOGLE MAPS INTENT
  final Uri geoUri = Uri.parse(
    "geo:0,0?q=Oxy+Valley+Resort+Coimbatore",
  );

  /// ✅ FALLBACK WEB MAP
  final Uri webMapUri = Uri.parse(
    "https://www.google.com/maps/search/?api=1&query=Oxy+Valley+Resort+Coimbatore",
  );

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);

    _scaleAnim = Tween<double>(begin: 1.0, end: 1.15).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  Future<void> _openMap() async {
    try {
      await launchUrl(
        geoUri,
        mode: LaunchMode.externalApplication,
      );
    } catch (e) {
      await launchUrl(
        webMapUri,
        mode: LaunchMode.externalApplication,
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryGreen = Color(0xFF1F8A70);

    return Scaffold(
      backgroundColor: const Color(0xFFF2F7F7),
      appBar: AppBar(
        title: const Text("Resort Location"),
        backgroundColor: primaryGreen,
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.12),
                blurRadius: 14,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              /// 🔹 ANIMATED LOCATION ICON (GREEN)
              ScaleTransition(
                scale: _scaleAnim,
                child: const Icon(
                  Icons.location_on,
                  size: 90,
                  color: primaryGreen,
                ),
              ),

              const SizedBox(height: 16),

              /// 🔹 HOTEL NAME
              Text(
                hotelName,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              /// 🔹 CLICKABLE ADDRESS (GREEN)
              GestureDetector(
                onTap: _openMap,
                child: const Text(
                  "Kurumbapalayam, Sathy Main Road, Coimbatore, Tamil Nadu",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: primaryGreen,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Tap the address or button below to open Google Maps.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 24),

              /// 🔹 GREEN BUTTON
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton.icon(
                  onPressed: _openMap,
                  icon: const Icon(Icons.map, color: Colors.white),
                  label: const Text(
                    "Open in Google Maps",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
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
}
