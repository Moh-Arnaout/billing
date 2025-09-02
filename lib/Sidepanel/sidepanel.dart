import 'package:billing/Sidepanel/buttons.dart';
import 'package:billing/Sidepanel/options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Sidepanel extends StatefulWidget {
  final VoidCallback? onToggle;

  const Sidepanel({super.key, this.onToggle});

  @override
  State<Sidepanel> createState() => _SidepanelState();
}

class _SidepanelState extends State<Sidepanel> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width / 5,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(color: Colors.grey.shade300, width: 1),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 32, right: 32, top: 32),
                  child: Image.asset(
                    'Images/Awael.png',
                    width: 176,
                    height: 63.3,
                  ),
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16),
                  child: TextField(
                    textAlign: TextAlign.end,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search, color: Color(0xFF8DA5B5)),
                      hintText: 'ابحث عن القائمة',
                      hintStyle: GoogleFonts.cairo(
                        fontSize: 12,
                        color: Color(0xFF8DA5B5),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFDDEBF4)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue.shade300),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: ToggleButton('جميع القوائم')),
                      SizedBox(width: 12),
                      Expanded(child: ToggleButton('قائمتي الخاصة')),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 32),
                  child: Column(
                    children: [
                      Options('الصفحة الرئيسية', 'main.svg', 'star.svg'),
                      SizedBox(height: 12),
                      Options(
                        'التسويق',
                        'marketing.svg',
                        'dropdown.svg',
                        children: [
                          ChildOption('لوحة التحكم', 'star.svg', 'control.svg'),
                          ChildOption(
                            'العملاء',
                            'star.svg',
                            'clients.svg',
                            children: [
                              ChildOption2('المعلومات الأساسية', 'star.svg'),
                              ChildOption2('معلومات التواصل', 'star.svg'),
                              ChildOption2('المتابعات', 'star.svg'),
                              ChildOption2('العروض', 'star.svg'),
                              ChildOption2('الزيارات', 'star.svg'),
                            ],
                          ),
                          ChildOption(
                            '-خدمة العملاء \n الرسائل النصية',
                            'star.svg',
                            'customerservice.svg',
                            children: [
                              ChildOption2('تصنيف العملاء', 'star.svg'),
                              ChildOption2('العملاء', 'star.svg'),
                              ChildOption2('إرسال رسالة', 'star.svg'),
                            ],
                          ),
                          ChildOption('التقارير', 'star.svg', 'reports.svg'),
                          ChildOption('التقييم', 'star.svg', 'rating.svg'),
                        ],
                      ),
                      SizedBox(height: 12),
                      GestureDetector(
                        onTap: () {
                          if (widget.onToggle != null) {
                            widget.onToggle!();
                          }
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height / 2,
                          alignment: Alignment.bottomLeft,
                          child: SvgPicture.asset(
                            'Images/panel.svg',
                            height: 24,
                            width: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
