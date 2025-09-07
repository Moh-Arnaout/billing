import 'package:billing/Details/Billingspart/Controller/billingsController.dart';
import 'package:billing/Details/Billingspart/View/billscard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Billspage extends StatelessWidget {
  final int maxVisibleCards;

  Billspage({Key? key, this.maxVisibleCards = 10}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get or create controller instance
    final controller = Get.put(BillsController());

    // Set max visible cards from parameter
    controller.maxVisible.value = maxVisibleCards;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header section (static)
        Padding(
          padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'الفواتير',
                style: GoogleFonts.cairo(
                  color: Color(0xFF1E7CB4),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        Divider(height: 32, thickness: 2, color: Color(0xFF1E7CB4)),
        const SizedBox(height: 16),

        // Reactive bills container
        Obx(() {
          final visibleBills = controller.visibleBills;
          final containerHeight =
              visibleBills.length * 65.0 + (visibleBills.length - 1);

          return Container(
            height: containerHeight,
            decoration: const BoxDecoration(
              color: Colors.transparent,
              border: Border(
                right: BorderSide(color: Color(0xFFB9D6E8), width: 4),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: SingleChildScrollView(
                child: Column(
                  children: visibleBills
                      .map(
                        (bill) => Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Billscard(bill, '12-03-2025'),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          );
        }),
      ],
    );
  }
}
