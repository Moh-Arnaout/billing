import 'package:billing/Details/Offerpart/Controller/offercardController.dart';
import 'package:billing/Details/Offerpart/Controller/offerpageController.dart';
import 'package:billing/Details/Offerpart/View/offercard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class Offerpage extends StatelessWidget {
  Offerpage({super.key});

  final OfferpageController offerpageController = Get.put(
    OfferpageController(),
  );
  final OffercardController offercardController = Get.put(
    OffercardController(),
  );

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'العروض',
                    style: GoogleFonts.cairo(
                      color: const Color(0xFF1E7CB4),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Divider(height: 32, thickness: 2, color: const Color(0xFF1E7CB4)),
            const SizedBox(height: 16),

            Container(
              height: MediaQuery.of(context).size.height / 1.8,
              decoration: const BoxDecoration(
                color: Colors.transparent,
                border: Border(
                  right: BorderSide(color: Color(0xFFB9D6E8), width: 4),
                ),
              ),
              padding: const EdgeInsets.only(right: 8),
              child: SingleChildScrollView(
                child: Column(
                  children: offerpageController.offers
                      .map(
                        (o) => Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Offercard(
                            o[0] as String,
                            o[1] as String,
                            o[2] as String,
                            pdfs: List<String>.from(o[3]),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
