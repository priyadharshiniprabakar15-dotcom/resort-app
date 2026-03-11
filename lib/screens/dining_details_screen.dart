import 'package:flutter/material.dart';

class DiningDetailsScreen extends StatelessWidget {
  final String title;
  final String image;

  const DiningDetailsScreen({
    super.key,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F7F7),

      body: Column(
        children: [

          // 🔹 HERO IMAGE
          Stack(
            children: [
              Hero(
                tag: image,
                child: Image.asset(
                  image,
                  height: 260,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 40,
                left: 16,
                child: CircleAvatar(
                  backgroundColor: Colors.black54,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
            ],
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "Enjoy an unforgettable dining experience with premium "
                    "ambience, curated menus, and world-class hospitality. "
                    "Perfect for family dinners, romantic evenings, and celebrations.",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        height: 1.5),
                  ),

                  const SizedBox(height: 20),

                  _infoTile(Icons.restaurant, "Cuisine",
                      "Multi-Cuisine & Local Specialties"),
                  _infoTile(Icons.schedule, "Timings",
                      "7:00 AM – 11:00 PM"),
                  _infoTile(Icons.star, "Ambience",
                      "Luxury • Family Friendly"),

                  const SizedBox(height: 20),

                  const Text(
                    "Gallery",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 12),

                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: [
                      _gallery(image),
                      _gallery(image),
                      _gallery(image),
                      _gallery(image),
                    ],
                  ),

                  const SizedBox(height: 30),

                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1F8A70),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      child: const Text("Reserve Table"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoTile(IconData icon, String title, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF1F8A70)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 12, color: Colors.grey)),
                Text(value,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _gallery(String img) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(img, fit: BoxFit.cover),
    );
  }
}
