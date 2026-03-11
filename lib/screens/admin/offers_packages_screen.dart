import 'package:flutter/material.dart';

class OffersPackagesScreen extends StatefulWidget {
  const OffersPackagesScreen({super.key});

  @override
  State<OffersPackagesScreen> createState() =>
      _OffersPackagesScreenState();
}

class _OffersPackagesScreenState
    extends State<OffersPackagesScreen>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _fadeAnim;
  late Animation<Offset> _slideAnim;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _fadeAnim =
        CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _slideAnim = Tween<Offset>(
      begin: const Offset(0, 0.05),
      end: Offset.zero,
    ).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeOut));

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
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF5E17EB),
              Color(0xFF1F8A70),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [

              /// 🔹 HEADER
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back,
                          color: Colors.white),
                      onPressed: () =>
                          Navigator.pop(context),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      "Offers & Packages",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              /// 🔹 WHITE CONTENT AREA
              Expanded(
                child: FadeTransition(
                  opacity: _fadeAnim,
                  child: SlideTransition(
                    position: _slideAnim,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                        color: Color(0xFFF4F7FB),
                        borderRadius:
                            BorderRadius.vertical(
                          top: Radius.circular(30),
                        ),
                      ),
                      child: ListView(
                        children: [

                          _offerCard(
                            imagePath: "assets/images/off.jpg",
                            title: "Summer Escape",
                            subtitle:
                                "Flat 25% OFF on luxury stays",
                            tag: "Seasonal Offer",
                            color: Colors.orange,
                          ),

                          _offerCard(
                            imagePath: "assets/images/act1.jpg",
                            title: "Honeymoon Bliss",
                            subtitle:
                                "Candlelight dinner + Spa + Décor",
                            tag: "Couple Package",
                            color: Colors.pink,
                          ),

                          _offerCard(
                            imagePath: "assets/images/off.jpg",
                            title: "Family Fun Pack",
                            subtitle:
                                "Kids stay FREE + Activities",
                            tag: "Family Special",
                            color: Colors.green,
                          ),

                          _offerCard(
                            imagePath: "assets/images/off.jpg",
                            title: "Weekend Getaway",
                            subtitle:
                                "Save ₹2000 on 2-night stays",
                            tag: "Limited Deal",
                            color: Colors.blue,
                          ),
                        ],
                      ),
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

  /// 🔥 OFFER CARD (INSTANT IMAGE LOAD)
  Widget _offerCard({
    required String imagePath,
    required String title,
    required String subtitle,
    required String tag,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// 🚀 INSTANT ASSET IMAGE
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(
              top: Radius.circular(22),
            ),
            child: Stack(
              children: [

                Image.asset(
                  imagePath,
                  height: 170,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),

                Positioned(
                  top: 12,
                  left: 12,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5),
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius:
                          BorderRadius.circular(12),
                    ),
                    child: Text(
                      tag,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding:
                const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [

                Text(
                  title,
                  style:
                      const TextStyle(
                    fontSize: 17,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  subtitle,
                  style:
                      const TextStyle(
                    fontSize: 13,
                    color:
                        Colors.grey,
                  ),
                ),

                const SizedBox(height: 12),

                const Text(
                  "Offer Active • Visible to Users",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
