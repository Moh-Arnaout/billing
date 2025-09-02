import 'package:billing/Details/Offerpart/offercard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Offerpage extends StatefulWidget {
  const Offerpage({super.key});

  @override
  State<Offerpage> createState() => _OfferpageState();
}

class _OfferpageState extends State<Offerpage> {
  final List<List<dynamic>> offers = [
    [
      '4866',
      'ناجح',
      '12-03-2025',
      [
        'pdfs/AI_Motion_Sense_Competition_Guide.pdf',
        'pdfs/Essential Principles.pdf',
      ],
    ],
    [
      '4866',
      'ناجح',
      '12-03-2025',
      ['pdfs/Business Analysis.pdf'],
    ],
    [
      '4866',
      'ناجح',
      '12-03-2025',
      ['pdfs/Business Analysis.pdf', 'pdfs/Essential Principles.pdf'],
    ],
    [
      '4866',
      'ناجح',
      '12-03-2025',
      ['pdfs/Business Analysis.pdf'],
    ],
    [
      '4866',
      'ناجح',
      '12-03-2025',
      ['pdfs/Business Analysis.pdf', 'pdfs/Essential Principles.pdf'],
    ],
    [
      '4866',
      'ناجح',
      '12-03-2025',
      ['pdfs/Business Analysis.pdf', 'pdfs/Management 1.pdf'],
    ],
    [
      '4866',
      'ناجح',
      '12-03-2025',
      ['pdfs/Business Analysis.pdf', 'pdfs/Management 1.pdf'],
    ],
    [
      '4866',
      'ناجح',
      '12-03-2025',
      ['pdfs/Business Analysis.pdf', 'pdfs/Management 1.pdf'],
    ],
  ];

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
                  children: offers
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
