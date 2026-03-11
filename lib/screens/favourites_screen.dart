import 'package:flutter/material.dart';
import 'resort_details_screen.dart';
import 'home_screen.dart';
import 'search_screen.dart';
import 'profile_screen.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {

  int _currentIndex = 2; // Favourite selected

  void _onBottomNavTap(int index) {

    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    }

    if (index == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const SearchScreen()),
      );
    }

    if (index == 3) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const ProfileScreen()),
      );
    }

    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F9),

      appBar: AppBar(
        backgroundColor: const Color(0xFF0B3C49),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Favourites",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          FavouriteCard(
            imageUrl:
                "https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?w=800",
            resortName: "Ocean View Resort",
            location: "Goa",
            rating: "4.8 ★",
            price: "₹6,500 / night",
            description:
                "Luxury beachside resort with ocean-facing rooms, infinity pool, spa, and private beach access.",
          ),
          SizedBox(height: 20),
          FavouriteCard(
            imageUrl:
                "https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800",
            resortName: "Hilltop Paradise",
            location: "Ooty",
            rating: "4.6 ★",
            price: "₹5,200 / night",
            description:
                "Peaceful hill resort surrounded by tea gardens, perfect for a relaxing mountain getaway.",
          ),
        ],
      ),

      /// 🔹 EQUAL SPACE BOTTOM NAVIGATION
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 60,
          child: Row(
            children: [
              Expanded(child: _bottomItem(Icons.home, "Home", 0)),
              Expanded(child: _bottomItem(Icons.search, "Search", 1)),
              Expanded(child: _bottomItem(Icons.favorite, "Favourite", 2)),
              Expanded(child: _bottomItem(Icons.person, "Profile", 3)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bottomItem(IconData icon, String label, int index) {
    return InkWell(
      onTap: () => _onBottomNavTap(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: _currentIndex == index
                ? const Color(0xFF1F8A70) // Green selected
                : Colors.grey,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: _currentIndex == index
                  ? const Color(0xFF1F8A70)
                  : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

/* ==================================================
   FAVOURITE CARD WIDGET
   ================================================== */

class FavouriteCard extends StatelessWidget {
  final String imageUrl;
  final String resortName;
  final String location;
  final String rating;
  final String price;
  final String description;

  const FavouriteCard({
    super.key,
    required this.imageUrl,
    required this.resortName,
    required this.location,
    required this.rating,
    required this.price,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(18)),
            child: Image.network(
              imageUrl,
              height: 190,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  resortName,
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  location,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),

                const SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      rating,
                      style: const TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      price,
                      style: const TextStyle(
                        color: Color(0xFF1F8A70),
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    height: 1.4,
                  ),
                ),

                const SizedBox(height: 16),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ResortDetailsScreen(
                              imageUrl: imageUrl,
                              resortName: resortName,
                              location: location,
                              rating: rating,
                              price: price,
                              description: description,
                            ),
                          ),
                        );
                      },
                      icon: const Icon(Icons.visibility, color: Colors.white),
                      label: const Text(
                        "View Details",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1F8A70),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),

                    const Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 28,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
