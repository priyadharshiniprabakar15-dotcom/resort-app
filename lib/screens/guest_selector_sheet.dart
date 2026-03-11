import 'package:flutter/material.dart';

class GuestSelectorSheet extends StatefulWidget {
  final int initialAdults;
  final int initialChildren;

  const GuestSelectorSheet({
    super.key,
    required this.initialAdults,
    required this.initialChildren,
  });

  @override
  State<GuestSelectorSheet> createState() => _GuestSelectorSheetState();
}

class _GuestSelectorSheetState extends State<GuestSelectorSheet> {
  late int adults;
  late int children;

  @override
  void initState() {
    super.initState();
    adults = widget.initialAdults;
    children = widget.initialChildren;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      // 🔹 PUSH SHEET UP FROM BOTTOM
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        height: 360, // ✅ FIXED HEIGHT (RAISED)
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        child: Column(
          children: [
            // 🔹 DRAG HANDLE
            Container(
              width: 40,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
            ),

            const SizedBox(height: 16),

            // 🔹 HEADER
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Guest",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // 🔹 ADULTS
            _guestRow(
              icon: Icons.person,
              label: "Adults",
              value: adults,
              onMinus: () {
                if (adults > 1) {
                  setState(() => adults--);
                }
              },
              onPlus: () {
                setState(() => adults++);
              },
            ),

            const SizedBox(height: 24),

            // 🔹 CHILDREN
            _guestRow(
              icon: Icons.child_care,
              label: "Children",
              value: children,
              onMinus: () {
                if (children > 0) {
                  setState(() => children--);
                }
              },
              onPlus: () {
                setState(() => children++);
              },
            ),

            const Spacer(),

            // 🔹 APPLY BUTTON (RAISED)
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(
                    context,
                    {
                      "adults": adults,
                      "children": children,
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1F8A70),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 6,
                ),
                child: const Text(
                  "Apply",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 GUEST ROW
  Widget _guestRow({
    required IconData icon,
    required String label,
    required int value,
    required VoidCallback onMinus,
    required VoidCallback onPlus,
  }) {
    return Row(
      children: [
        Icon(icon, color: Colors.teal),
        const SizedBox(width: 12),
        Text(label, style: const TextStyle(fontSize: 16)),
        const Spacer(),
        _counterButton(Icons.remove, onMinus),
        const SizedBox(width: 14),
        Text(
          value.toString(),
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 14),
        _counterButton(Icons.add, onPlus),
      ],
    );
  }

  // 🔹 COUNTER BUTTON
  Widget _counterButton(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: Colors.teal.withOpacity(0.15),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, size: 18, color: Colors.teal),
      ),
    );
  }
}
