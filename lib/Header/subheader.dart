import 'package:billing/Sidepanel/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Subheader extends StatelessWidget {
  const Subheader({super.key, required this.counter});
  final int counter;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ToggleButton(
                'إضافة',
                onToggle: (p0) {
                  if (counter == 0) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'قم بإرفاق الملفات في المكان المخصص لها',
                              style: GoogleFonts.cairo(
                                color: Color(0xFF505050),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.right,
                            ),
                            SizedBox(width: 8),
                            SvgPicture.asset(
                              'Images/warning.svg',
                              width: 16,
                              height: 14,
                            ),
                          ],
                        ),
                        backgroundColor: Color(0xFFFFC107),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'تمام',
                          style: GoogleFonts.cairo(
                            color: Color(0xFF505050),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.right,
                        ),
                        backgroundColor: Color(0xFFFFC107),
                      ),
                    );
                  }
                },
              ),
              SizedBox(width: 16),
              ToggleButton('إلغاء'),
            ],
          ),
          Row(
            children: [
              Text(
                'عملاء الفوترة',
                style: GoogleFonts.cairo(
                  color: Color(0xFF505050),
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(width: 16),
              SvgPicture.asset('Images/arrow.svg', width: 10, height: 18.18),
              SizedBox(width: 16),
              Text(
                'الفوترة',
                style: GoogleFonts.cairo(
                  color: Color(0xFF1E7CB4),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(width: 16),
              SvgPicture.asset('Images/arrow.svg', width: 10, height: 18.18),
              SizedBox(width: 16),
              SvgPicture.asset('Images/main.svg', width: 24, height: 21),
            ],
          ),
        ],
      ),
    );
  }
}
