import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Row1 extends StatelessWidget {
  const Row1({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildField('اسم العميل', 'شركة الشروق للطباعة والتغليف', false),
      ],
    );
  }
}

Widget buildField(String label, String hint, bool enabled) {
  return Expanded(
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              label,
              style: GoogleFonts.cairo(
                color: const Color(0xFF505050),
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        TextField(
          enabled: enabled,
          textAlign: TextAlign.end,
          decoration: InputDecoration(
            hoverColor: Colors.transparent,
            filled: true,
            fillColor: const Color(0xFFF3F6F9),
            hintText: hint,
            hintStyle: GoogleFonts.cairo(
              fontSize: 16,
              color: const Color(0xFF8DA5B5),
              fontWeight: FontWeight.w500,
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFDDEBF4)),
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFDDEBF4)),
              borderRadius: BorderRadius.circular(8),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFDDEBF4)),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFDDEBF4)),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    ),
  );
}
