import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatelessWidget {
  final bool isSidebarOpen;

  const Header({super.key, required this.isSidebarOpen});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final hour = now.hour.toString().padLeft(2, '0');
    final minute = now.minute.toString().padLeft(2, '0');
    final period = now.hour < 12 ? 'صباحاً' : 'مساءً';

    final formattedTime = ' $hour:$minute $period';

    return Container(
      // Remove fixed width, let it expand
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 18,
          bottom: 18,
          right: 12,
          left: 12,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left side - User info and notifications
            Row(
              children: [
                Container(
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('Images/guy.png'),
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'أحمد محمد',
                            style: GoogleFonts.cairo(
                              color: Color(0xFF505050),
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'اسم الوظيفة',
                            style: GoogleFonts.cairo(
                              color: Color(0xFF8DA5B5),
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 22),
                Container(
                  height: 42,
                  child: VerticalDivider(
                    width: 20,
                    thickness: 1.5,
                    color: Color(0xFFE9F2F8),
                  ),
                ),
                SizedBox(width: 22),
                SvgPicture.asset('Images/noti.svg', width: 42, height: 42),
              ],
            ),
            // Right side - Time
            Container(
              width: 112,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Color(0xFFB9D6E8)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    formattedTime,
                    style: GoogleFonts.cairo(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Color(0xFF8DA5B5),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
