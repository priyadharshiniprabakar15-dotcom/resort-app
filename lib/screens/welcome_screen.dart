import 'package:flutter/material.dart';
import 'onboarding_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🔹 FULL SCREEN BACKGROUND IMAGE
          Positioned.fill(
            child: Image.asset(
              'assets/images/wel.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // 🔹 TITLE AT TOP
          Positioned(
            top: 90,
            left: 0,
            right: 0,
            child: Column(
              children: const [
                Text(
                  "WELCOME TO",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  "OXY VALLEY RESORT",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),

          // 🔹 DARKER GLASS CARD
          Positioned(
            left: 0,
            right: 0,
            bottom: 80,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.fromLTRB(24, 28, 24, 28),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xAA0B3C49), // deep blue
                    Color(0xCC1F8A70), // green-teal
                  ],
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // 🔹 BULLET POINTS
                  SizedBox(
                    width: 260,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        BulletItem(text: "Luxurious Villas & Suites"),
                        SizedBox(height: 10),
                        BulletItem(text: "Spa & Adventure Activities"),
                        SizedBox(height: 10),
                        BulletItem(text: "Fine Dining & More"),
                      ],
                    ),
                  ),

                  const SizedBox(height: 22),

                  // 🔹 EXPLORE BUTTON (WITH WHITE STROKE)
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const OnboardingScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1F8A70),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        side: BorderSide( // ✅ WHITE STROKE
                          color: Colors.white.withOpacity(0.8),
                          width: 1.2,
                        ),
                        elevation: 6,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Explore",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 18,
                          ),
                        ],
                      ),
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
}

/* ================= BULLET ITEM ================= */

class BulletItem extends StatelessWidget {
  final String text;
  const BulletItem({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "•",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            height: 1.4,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }
}
