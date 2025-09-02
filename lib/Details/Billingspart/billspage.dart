import 'package:billing/Details/Billingspart/billscard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Billspage extends StatefulWidget {
  const Billspage({super.key, this.maxVisibleCards = 5});
  final int maxVisibleCards;

  @override
  State<Billspage> createState() => _BillspageState();
}

class _BillspageState extends State<Billspage> {
  @override
  Widget build(BuildContext context) {
    final bills = [
      'فاتورة مبيعات رقم 1234',
      'فاتورة مبيعات رقم 1235',
      'فاتورة مبيعات رقم 1236',
      'فاتورة مبيعات رقم 1237',
      'فاتورة مبيعات رقم 1238',
      'فاتورة مبيعات رقم 1239',
      'فاتورة مبيعات رقم 1240',
      'فاتورة مبيعات رقم 1241',
      'فاتورة مبيعات رقم 1242',
      'فاتورة مبيعات رقم 1243',
      'فاتورة مبيعات رقم 1244',
    ];

    final visibleBills = bills.take(widget.maxVisibleCards).toList();

    final containerHeight =
        visibleBills.length * 100.0 + (visibleBills.length - 1) * 16.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header part
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

        Container(
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
                children: bills
                    .map(
                      (b) => Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Billscard(b, '12-03-2025'),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
