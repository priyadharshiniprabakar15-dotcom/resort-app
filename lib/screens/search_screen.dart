import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'profile_screen.dart';
import 'favourites_screen.dart'; // ✅ ADD THIS

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  int _currentIndex = 1; // Search tab active

  final List<String> recentSearches = [
    "Mountain View Room",
    "Luxury Villa",
    "Spa Resort",
  ];

  final List<String> suggestedSearches = [
    "Premium Suite",
    "Family Room",
    "Beach Villa",
    "Honeymoon Package",
  ];

  void _onBottomNavTap(int index) {

    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
      return;
    }

    if (index == 2) {   // ✅ FIXED HERE
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const FavouritesScreen()),
      );
      return;
    }

    if (index == 3) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const ProfileScreen()),
      );
      return;
    }

    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F7F7),

      appBar: AppBar(
        backgroundColor: const Color(0xFF1F8A70),
        title: const Text("Search"),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // 🔍 SEARCH BAR
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextField(
                controller: _searchController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.search),
                  hintText: "Search rooms, villas, resorts...",
                  border: InputBorder.none,
                ),
                onSubmitted: (value) {
                  if (value.isNotEmpty && !recentSearches.contains(value)) {
                    setState(() {
                      recentSearches.insert(0, value);
                    });
                  }
                },
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              "Recent Searches",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: recentSearches.map(_searchChip).toList(),
            ),

            const SizedBox(height: 24),

            const Text(
              "Suggested",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: suggestedSearches.map(_searchChip).toList(),
            ),
          ],
        ),
      ),

      // 🔹 BOTTOM NAVIGATION
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(14),
          topRight: Radius.circular(14),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 10,
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color(0xFF1F8A70),
          unselectedItemColor: Colors.grey,
          onTap: _onBottomNavTap,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "Favourite"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
    );
  }

  Widget _searchChip(String text) {
    return GestureDetector(
      onTap: () {
        _searchController.text = text;
      },
      child: Chip(
        label: Text(text),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
