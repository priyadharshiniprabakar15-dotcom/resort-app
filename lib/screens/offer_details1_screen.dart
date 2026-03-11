import 'package:flutter/material.dart';

class OfferDetails1Screen extends StatefulWidget {
  final String title;
  final String desc;
  final String discount;

  const OfferDetails1Screen({
    super.key,
    required this.title,
    required this.desc,
    required this.discount,
  });

  @override
  State<OfferDetails1Screen> createState() => _OfferDetails1ScreenState();
}

class _OfferDetails1ScreenState extends State<OfferDetails1Screen>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  bool isFavourite = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _fadeAnimation =
        Tween<double>(begin: 0, end: 1).animate(_controller);

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.2), end: Offset.zero)
            .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [

          /// 🔹 TOP IMAGE
          SizedBox(
            height: 380, // 👈 Increased height
            width: double.infinity,
            child: Stack(
              children: [
                Hero(
                  tag: widget.title,
                  child: Image.asset(
                    "assets/images/off.jpg",
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),

                /// Gradient
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black54,
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),

                Positioned(
                  top: 45,
                  left: 15,
                  child: CircleAvatar(
                    backgroundColor: Colors.black45,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),

                Positioned(
                  bottom: 25,
                  left: 20,
                  child: Text(
                    widget.discount,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// 🔹 ANIMATED CONTENT
          SlideTransition(
            position: _slideAnimation,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: DraggableScrollableSheet(
                initialChildSize: 0.55,   // 👈 Not covering image
                minChildSize: 0.55,
                maxChildSize: 0.9,
                builder: (_, controller) {
                  return Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                        )
                      ],
                    ),
                    child: SingleChildScrollView(
                      controller: controller,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          /// Title
                          Text(
                            widget.title,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 6),

                          Text(
                            widget.desc,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),

                          const SizedBox(height: 20),

                          /// Highlights
                          const Text(
                            "Offer Highlights",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 12),

                          _highlight(Icons.hotel, "Luxury Stay"),
                          _highlight(Icons.restaurant, "Free Dinner"),
                          _highlight(Icons.spa, "Spa Access Included"),
                          _highlight(Icons.pool, "Infinity Pool Access"),

                          const SizedBox(height: 25),

                          const Text(
                            "About this Offer",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 10),

                          const Text(
                            "Experience a premium luxury escape with world-class hospitality, "
                            "beautiful poolside views, romantic ambience, and unforgettable family moments. "
                            "This limited-time offer includes exclusive benefits crafted specially for our guests.",
                            style: TextStyle(
                              fontSize: 14,
                              height: 1.6,
                              color: Colors.black87,
                            ),
                          ),

                          const SizedBox(height: 30),

                          /// Buttons
                          Row(
                            children: [

                              Expanded(
                                child: OutlinedButton.icon(
                                  style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(vertical: 14),
                                    side: const BorderSide(color: Colors.teal),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      isFavourite = !isFavourite;
                                    });
                                  },
                                  icon: Icon(
                                    isFavourite
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: Colors.red,
                                  ),
                                  label: const Text(
                                    "Favourite",
                                    style: TextStyle(color: Colors.teal),
                                  ),
                                ),
                              ),

                              const SizedBox(width: 12),

                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF1F8A70),
                                    padding: const EdgeInsets.symmetric(vertical: 14),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("Booking Confirmed 🎉"),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    "Book Now",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _highlight(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF1F8A70)),
          const SizedBox(width: 10),
          Text(text),
        ],
      ),
    );
  }
}
