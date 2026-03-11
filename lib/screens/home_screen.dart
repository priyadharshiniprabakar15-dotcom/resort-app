import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import 'room_details_screen.dart';
import 'guest_selector_sheet.dart';
import 'profile_screen.dart';
import 'search_screen.dart';
import 'compare_rooms_screen.dart';
import 'help_screen.dart';
import 'call_screen.dart';
import 'whatsapp_screen.dart';
import 'location_screen.dart';
import 'app_drawer.dart';
import 'login_screen.dart';
import 'favourites_screen.dart';
import 'offer_details1_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _showFabMenu = false;
  int _currentIndex = 0;

  DateTimeRange? selectedDateRange;
  int adults = 2;
  int children = 1;

  String get dateText =>
      selectedDateRange == null ? "Select Date" : "Date Selected";

  String get guestText => "$adults Adults, $children Child";

  Future<void> _pickDateRange() async {
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 2),
    );
    if (picked != null) setState(() => selectedDateRange = picked);
  }

  Future<void> _openGuestSelector() async {
    final result = await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => GuestSelectorSheet(
        initialAdults: adults,
        initialChildren: children,
      ),
    );
    if (result != null) {
      setState(() {
        adults = result["adults"];
        children = result["children"];
      });
    }
  }

  void _onBottomNavTap(int index) {
    if (index == 1) {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const SearchScreen()));
      return;
    }
    if (index == 3) {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const FavouritesScreen()));
      return;
    }
    if (index == 4) {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const ProfileScreen()));
      return;
    }
    setState(() => _currentIndex = index);
  }
@override
Widget build(BuildContext context) {
  return WillPopScope(
    onWillPop: () async {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const LoginScreen()));
      return false;
    },
    child: Stack(
      children: [

        /// 🔹 MAIN SCREEN
        Scaffold(
          key: _scaffoldKey,
          drawer: const AppDrawer(),
          backgroundColor: const Color(0xFFF2F7F7),
            resizeToAvoidBottomInset: false,
        body: SafeArea(
  child: SingleChildScrollView(
    physics: const ClampingScrollPhysics(), // smooth scroll
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _header(),
        const SizedBox(height: 20),
        _roomsSection(),
        const SizedBox(height: 12),
        _compareButton(),
        const SizedBox(height: 16),
        _offersSection(),
        const SizedBox(height: 20),
      ],
    ),
  ),
),



          bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 8,
            child: SizedBox(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _bottomItem(Icons.home, "Home", 0),
                  _bottomItem(Icons.search, "Search", 1),
                  const SizedBox(width: 40),
                  _bottomItem(Icons.favorite_border, "Favourite", 3),
                  _bottomItem(Icons.person, "Profile", 4),
                ],
              ),
            ),
          ),

          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,

        floatingActionButton: FloatingActionButton(
  backgroundColor: const Color(0xFF1F8A70),
  child: Icon(
    _showFabMenu ? Icons.close : Icons.add,
    color: const Color.fromARGB(255, 255, 255, 255),   // 👈 THIS MAKES + WHITE
    size: 28,
  ),
  onPressed: () =>
      setState(() => _showFabMenu = !_showFabMenu),
),

        ),

        /// 🔹 GREY OVERLAY (NOW ABOVE SCAFFOLD ✅)
        if (_showFabMenu)
          Positioned.fill(
            child: GestureDetector(
              onTap: _closeFab,
              child: Container(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ),

        /// 🔹 FAB MENU
        if (_showFabMenu)
          Positioned(
            bottom: 90,
            left: MediaQuery.of(context).size.width / 2 - 120,
            child: SizedBox(
              width: 240,
              height: 140,
              child: Stack(
                children: [
                  _fabItem(0, Icons.call, () {
                    _closeFab();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const CallScreen()));
                  }),
                  _fabItem(45, FontAwesomeIcons.whatsapp, () {
  _closeFab();
  Navigator.push(
    context,
    MaterialPageRoute(builder: (_) => const WhatsAppScreen()),
  );
}, top: true),

                  _fabItem(45, Icons.location_on, () {
                    _closeFab();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const LocationScreen()));
                  }, top: true, right: true),
                  _fabItem(0, Icons.help_outline, () {
                    _closeFab();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const HelpScreen()));
                  }, right: true),
                ],
              ),
            ),
          ),
      ],
    ),
  );
}


  void _closeFab() => setState(() => _showFabMenu = false);

  /// ================= GLASS COMPARE BUTTON =================
  Widget _compareButton() {
    return Center(
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => const CompareRoomsScreen()),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.35),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: const Text(
                "Compare Rooms",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0B3C49),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// ================= HEADER =================
  Widget _header() {
  return Container(
    padding: const EdgeInsets.fromLTRB(12, 50, 20, 25),
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xFF0B3C49), Color(0xFF1F8A70)],
      ),
    ),
    child: Column(
      children: [

        /// 🔹 TOP ROW
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            /// MENU
            IconButton(
  padding: EdgeInsets.zero,          // 👈 removes default padding
  constraints: const BoxConstraints(), // 👈 removes extra space
  icon: const Icon(Icons.menu, color: Colors.white),
  onPressed: () =>
      _scaffoldKey.currentState?.openDrawer(),
),


            /// LOGO
            Image.asset(
              'assets/images/logo.png',
              height: 56,
            ),

            /// PROFILE CLICKABLE
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const ProfileScreen()),
                );
              },
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person),
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        /// 🔹 SEARCH BAR
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: const TextField(
            decoration: InputDecoration(
              icon: Icon(Icons.search),
              hintText: "Search for Rooms",
              border: InputBorder.none,
            ),
          ),
        ),

        const SizedBox(height: 10),

        /// 🔹 DATE + GUEST + BUTTON
        Row(
          children: [
            GestureDetector(
                onTap: _pickDateRange,
                child: _chip(dateText)),
            const SizedBox(width: 8),
            GestureDetector(
                onTap: _openGuestSelector,
                child: _chip(guestText)),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const SearchScreen())),
              child: const Text("Search",
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ],
    ),
  );
}


  /// ================= ROOMS =================
  Widget _roomsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text("Explore Rooms & Villas",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 320,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 16),
            itemCount: 4,
            itemBuilder: (_, __) => _roomCard(),
          ),
        ),
      ],
    );
  }

  Widget _roomCard() {
    return Container(
      width: 220,
      margin: const EdgeInsets.only(right: 14),
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        child: Column(
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(18)),
              child: Image.asset(
                'assets/images/rooms.jpg',
                height: 140,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  height: 140,
                  color: Colors.grey.shade300,
                  child: const Icon(Icons.image, size: 40),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Premium Suite",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  const Text("Ooty • Mountain View",
                      style:
                          TextStyle(fontSize: 12, color: Colors.grey)),
                  const SizedBox(height: 6),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("⭐ 4.8"),
                      Text("₹3,000 / night",
                          style: TextStyle(
                              color: Colors.teal,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    height: 36,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1F8A70),
                        elevation: 6,
                        shadowColor: Colors.black54,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const RoomDetailsScreen())),
                      child: const Text("View Details",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// ================= OFFERS =================
  Widget _offersSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text("Exclusive Offers",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 290,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 16),
            children: [
              _offerCard("Summer Special",
                  "Stay 2 nights & get 1 free", "Flat 30% OFF"),
              _offerCard("Honeymoon Deal",
                  "Candle light dinner included", "Save ₹5,000"),
              _offerCard("Family Package",
                  "Kids stay free", "Up to 25% OFF"),
            ],
          ),
        ),
      ],
    );
  }

  Widget _offerCard(String title, String desc, String discount) {
  return Container(
    width: 220,
    margin: const EdgeInsets.only(right: 14),
    child: Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 🔹 IMAGE WITH OVERLAY
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(18)),
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/off.jpg',
                  height: 130,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),

                Container(
                  height: 130,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.5),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),

                Positioned(
                  bottom: 10,
                  left: 12,
                  child: Text(
                    discount,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// 🔹 TEXT + BUTTON
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  desc,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 12),

                SizedBox(
                  width: double.infinity,
                  height: 34,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1F8A70),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => OfferDetails1Screen(
                            title: title,
                            desc: desc,
                            discount: discount,
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      "View Details",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}


  /// ================= SMALL =================
  static Widget _chip(String text) => Container(
        padding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)),
        child: Text(text, style: const TextStyle(fontSize: 12)),
      );

  Widget _bottomItem(IconData icon, String label, int index) {
    return InkWell(
      onTap: () => _onBottomNavTap(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon,
              color: _currentIndex == index
                  ? const Color(0xFF1F8A70)
                  : Colors.grey),
          Text(label, style: const TextStyle(fontSize: 11)),
        ],
      ),
    );
  }

  Widget _fabItem(double offset, IconData icon, VoidCallback onTap,
      {bool top = false, bool right = false}) {
    return Positioned(
      left: right ? null : offset,
      right: right ? offset : null,
      bottom: top ? 80 : 20,
      child: GestureDetector(
        onTap: onTap,
        child: CircleAvatar(
          radius: 22,
          backgroundColor: Colors.white,
          child: Icon(icon, color: const Color(0xFF1F8A70)),
        ),
      ),
    );
  }
}
