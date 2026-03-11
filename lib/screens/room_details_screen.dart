import 'package:flutter/material.dart';
import 'rooms_and_villas_screen.dart';
import 'room_booking_confirmation_screen.dart';

class RoomDetailsScreen extends StatelessWidget {
  const RoomDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const String roomName = "Premium Suite";
    const String roomPrice = "₹5,000 / night";

    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const RoomsAndVillasScreen()),
        );
        return false;
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFF2F7F7),
        appBar: AppBar(
          backgroundColor: const Color(0xFF1F8A70),
          title: const Text(
            "Room Details",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (_) => const RoomsAndVillasScreen()),
              );
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/room&villa.jpg',
                height: 240,
                width: double.infinity,
                fit: BoxFit.cover,
              ),

              const SizedBox(height: 16),

              _sectionCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Premium Suite",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 6),
                    Text(
                      "Mountain View • Private Balcony • Free Wi-Fi",
                      style:
                          TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                  ],
                ),
              ),

              _sectionCard(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Jan 12 – Jan 16"),
                    Text(
                      "₹5,000 / night",
                      style: TextStyle(
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              RoomBookingConfirmationScreen(
                            resortName: roomName,
                            price: roomPrice,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color(0xFF1F8A70),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      "Book Now",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _sectionCard({required Widget child}) {
    return Container(
      margin:
          const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }
}
