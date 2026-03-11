import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'room_booking_confirmation_screen.dart';

class CompareRoomsScreen extends StatefulWidget {
  const CompareRoomsScreen({super.key});

  @override
  State<CompareRoomsScreen> createState() => _CompareRoomsScreenState();
}

class _CompareRoomsScreenState extends State<CompareRoomsScreen> {
  int? selectedIndex;

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

        /// 🔹 APP BAR
        appBar: AppBar(
          backgroundColor: const Color(0xFF1F8A70),
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text(
            "Compare Rooms",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        /// 🔹 BODY
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [

              Row(
                children: [

                  Expanded(
                    child: _RoomCompareCard(
                      index: 0,
                      selectedIndex: selectedIndex,
                      onTap: () {
                        setState(() {
                          selectedIndex = 0;
                        });
                      },
                      image: 'assets/images/compare.jpg',
                      title: "Premium Suite",
                      price: "₹3,000 / night",
                      view: "Mountain View",
                      wifi: "Available",
                      breakfast: "Included",
                      rating: "4 ★",
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: _RoomCompareCard(
                      index: 1,
                      selectedIndex: selectedIndex,
                      onTap: () {
                        setState(() {
                          selectedIndex = 1;
                        });
                      },
                      image: 'assets/images/onboard 1.jpg',
                      title: "Luxury Villa",
                      price: "₹4,500 / night",
                      view: "Garden View",
                      wifi: "Available",
                      breakfast: "Included",
                      rating: "5 ★",
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              /// 🔹 BOOK BUTTON
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: selectedIndex == null
                      ? null
                      : () {

                          String selectedRoomName =
                              selectedIndex == 0
                                  ? "Premium Suite"
                                  : "Luxury Villa";

                          String selectedPrice =
                              selectedIndex == 0
                                  ? "₹3,000 / night"
                                  : "₹4,500 / night";

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  RoomBookingConfirmationScreen(
                                resortName: selectedRoomName,
                                price: selectedPrice,
                              ),
                            ),
                          );
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedIndex == null
                        ? Colors.grey
                        : const Color(0xFF1F8A70),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 6,
                  ),
                  child: const Text(
                    "Book Selected Room",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
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

/// 🔹 ROOM CARD
class _RoomCompareCard extends StatelessWidget {
  final int index;
  final int? selectedIndex;
  final VoidCallback onTap;

  final String image;
  final String title;
  final String price;
  final String view;
  final String wifi;
  final String breakfast;
  final String rating;

  const _RoomCompareCard({
    required this.index,
    required this.selectedIndex,
    required this.onTap,
    required this.image,
    required this.title,
    required this.price,
    required this.view,
    required this.wifi,
    required this.breakfast,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: isSelected
                ? const Color(0xFF1F8A70)
                : Colors.transparent,
            width: 2,
          ),
        ),
        elevation: isSelected ? 8 : 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(16)),
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

                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),

                  const SizedBox(height: 10),

                  _compareRow(Icons.currency_rupee, "Price", price),
                  _compareRow(Icons.landscape, "View", view),
                  _compareRow(Icons.wifi, "Wi-Fi", wifi),
                  _compareRow(Icons.free_breakfast, "Breakfast", breakfast),
                  _compareRow(Icons.star, "Rating", rating),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _compareRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, size: 16, color: Colors.teal),
          const SizedBox(width: 6),
          Text(
            "$label:",
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black54,
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
