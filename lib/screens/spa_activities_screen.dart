import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'spa_activity_details_screen.dart'; // ✅ NEW SCREEN

class SpaActivitiesScreen extends StatelessWidget {
  const SpaActivitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomeScreen()),
        );
        return false;
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFF2F7F7),

        appBar: AppBar(
          backgroundColor: const Color(0xFF1F8A70),
          title: const Text("Spa & Activities"),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const HomeScreen()),
              );
            },
          ),
        ),

        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // 🔍 SEARCH BAR
              Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.search),
                      hintText: "Search for spa & activities",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),

              _sectionTitle("Wellness & Spa"),

              SizedBox(
                height: 245,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 16),
                  children: [
                    _spaCard(
                      context,
                      image: 'assets/images/onboard 3.jpg',
                      title: "Luxury Spa",
                      subtitle: "Relax & Rejuvenate",
                    ),
                    _spaCard(
                      context,
                      image: 'assets/images/rooms.jpg',
                      title: "Ayurvedic Therapy",
                      subtitle: "Traditional Healing",
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              _sectionTitle("Resort Activities"),

              SizedBox(
                height: 240,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 16),
                  children: [
                    _activityCard(context,
                        image: 'assets/images/act1.jpg',
                        title: "Indoor Games"),
                    _activityCard(context,
                        image: 'assets/images/dine2.jpg',
                        title: "Peaceful Rides"),
                    _activityCard(context,
                        image: 'assets/images/onboard 1.jpg',
                        title: "Adventures"),
                  ],
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _spaCard(BuildContext context,
      {required String image,
      required String title,
      required String subtitle}) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 12),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 4,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.asset(
                image,
                height: 110,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14)),
                  const SizedBox(height: 4),
                  Text(subtitle,
                      style:
                          const TextStyle(fontSize: 12, color: Colors.grey)),
                  const SizedBox(height: 10),
                  _exploreButton(context, title, image),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _activityCard(BuildContext context,
      {required String image, required String title}) {
    return Container(
      width: 180,
      margin: const EdgeInsets.only(right: 12),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 4,
        child: Column(
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.asset(
                image,
                height: 115,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 13)),
                  const SizedBox(height: 8),
                  _exploreButton(context, title, image),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _exploreButton(
      BuildContext context, String title, String image) {
    return SizedBox(
      height: 32,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => SpaActivityDetailsScreen(
                title: title,
                image: image,
              ),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1F8A70),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        child:
            const Text("Explore", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
