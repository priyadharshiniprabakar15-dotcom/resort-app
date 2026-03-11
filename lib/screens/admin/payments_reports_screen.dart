import 'package:flutter/material.dart';

class PaymentsReportsScreen extends StatefulWidget {
  const PaymentsReportsScreen({super.key});

  @override
  State<PaymentsReportsScreen> createState() => _PaymentsReportsScreenState();
}

class _PaymentsReportsScreenState extends State<PaymentsReportsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnim;
  late Animation<Offset> _slideAnim;

  final List<Map<String, dynamic>> monthlyRevenue = [
    {"month": "Jan", "value": 60.0},
    {"month": "Feb", "value": 80.0},
    {"month": "Mar", "value": 50.0},
    {"month": "Apr", "value": 90.0},
    {"month": "May", "value": 70.0},
    {"month": "Jun", "value": 100.0},
  ];

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _fadeAnim = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _slideAnim = Tween<Offset>(
      begin: const Offset(0, 0.08),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

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
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        title: const Text("Payments & Reports"),
        elevation: 0,
        backgroundColor: const Color(0xFF4A00E0),
      ),
      body: FadeTransition(
        opacity: _fadeAnim,
        child: SlideTransition(
          position: _slideAnim,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [

              // 🔹 HEADER CARD
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF4A00E0),
                      Color(0xFF0F2027),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.18),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Row(
                  children: const [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.payments,
                        size: 32,
                        color: Color(0xFF4A00E0),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        "Track resort revenue,\npayments & financial reports",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // 🔹 QUICK STATS
              Row(
                children: [
                  _statCard("Today's Revenue", "₹1.2L"),
                  _statCard("Monthly Revenue", "₹4.6L"),
                ],
              ),

              const SizedBox(height: 16),

              Row(
                children: [
                  _statCard("Pending Payments", "₹86K"),
                  _statCard("Refunds", "₹24K"),
                ],
              ),

              const SizedBox(height: 30),

              // 🔹 GRAPH TITLE
              const Text(
                "Monthly Revenue Report",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 14),

              // 🔹 MONTH-WISE BAR GRAPH (HORIZONTAL SCROLL)
              _monthlyBarChart(),

              const SizedBox(height: 30),

              // 🔹 RECENT TRANSACTIONS
              const Text(
                "Recent Transactions",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              _transactionTile(
                "Room Booking – Villa",
                "₹42,000",
                "Success",
                Colors.green,
              ),
              _transactionTile(
                "Wedding Advance",
                "₹1,20,000",
                "Pending",
                Colors.orange,
              ),
              _transactionTile(
                "Refund – Cancelled Stay",
                "₹18,000",
                "Refunded",
                Colors.redAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 🔹 STAT CARD
  Widget _statCard(String title, String value) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xFFEDE7F6),
              Color(0xFFE3F2FD),
            ],
          ),
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.12),
              blurRadius: 10,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(value,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(title, style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  // 🔹 MONTHLY BAR CHART
  Widget _monthlyBarChart() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: monthlyRevenue.map((data) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 800),
                    width: 26,
                    height: data["value"],
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF4A00E0),
                          Color(0xFF8E2DE2),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    data["month"],
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  // 🔹 TRANSACTION TILE
  Widget _transactionTile(
      String title, String amount, String status, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: color.withOpacity(0.15),
            child: Icon(Icons.receipt_long, color: color),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(
                  status,
                  style: TextStyle(fontSize: 12, color: color),
                ),
              ],
            ),
          ),
          Text(amount,
              style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
