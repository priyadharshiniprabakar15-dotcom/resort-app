import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'dining_details_screen.dart';

class DiningMoreScreen extends StatelessWidget {
  const DiningMoreScreen({super.key});

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
          title: const Text("Dining & More"),
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
                      hintText: "Search dining options",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),

              _sectionTitle("Restaurants"),

              SizedBox(
                height: 240,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 16),
                  children: [
                    _diningCard(
                      context,
                      image: 'assets/images/dine.jpg',
                      title: "Multi-Cuisine Restaurant",
                      subtitle: "Breakfast • Lunch • Dinner",
                    ),
                    _diningCard(
                      context,
                      image: 'assets/images/dine2.jpg',
                      title: "Traditional Dining",
                      subtitle: "Authentic Local Flavours",
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              _sectionTitle("More Experiences"),

              SizedBox(
                height: 230,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 16),
                  children: [
                    _experienceCard(
                      context,
                      image: 'assets/images/dine2.jpg',
                      title: "Bar & Lounge",
                    ),
                    _experienceCard(
                      context,
                      image: 'assets/images/dine.jpg',
                      title: "Candle Light Dinner",
                    ),
                    _experienceCard(
                      context,
                      image: 'assets/images/dine2.jpg',
                      title: "Buffet Nights",
                    ),
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

  Widget _diningCard(
    BuildContext context, {
    required String image,
    required String title,
    required String subtitle,
  }) {
    return Container(
      width: 210,
      margin: const EdgeInsets.only(right: 12),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.asset(
                image,
                height: 120,
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
                      style: const TextStyle(
                          fontSize: 12, color: Colors.grey)),
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

  Widget _experienceCard(
    BuildContext context, {
    required String image,
    required String title,
  }) {
    return Container(
      width: 180,
      margin: const EdgeInsets.only(right: 12),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 4,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
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
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 600),
              pageBuilder: (_, animation, __) {
                return FadeTransition(
                  opacity: animation,
                  child: DiningDetailsScreen(
                    title: title,
                    image: image,
                  ),
                );
              },
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1F8A70),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        child: const Text(
          "Explore",
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
      ),
    );
  }
}
