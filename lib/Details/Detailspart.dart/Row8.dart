import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Row8 extends StatefulWidget {
  const Row8({super.key});

  @override
  State<Row8> createState() => _ConsultantrowState();
}

class _ConsultantrowState extends State<Row8> {
  String? selectedConsultant;
  String? selectedOfferNumber;
  DateTime? selectedOfferDate;

  bool showMoreInfoConsultant = false;
  bool showMoreInfoOfferNumber = false;
  bool showMoreInfoOfferDate = false;

  final importantIcon = SvgPicture.asset(
    'Images/important.svg',
    width: 7,
    height: 7,
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildField1(
          additionalText: '',
          label: Text(
            'حالة الفاتورة',
            style: GoogleFonts.cairo(
              color: const Color(0xFF505050),
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          hint: 'اختر من القائمة',
          value: selectedConsultant,
          onChanged: (value) => setState(() => selectedConsultant = value),
        ),
        const SizedBox(width: 40),
        buildField('رقم الفاتورة ', 'اكتب القيمة هنا', true),
        const SizedBox(width: 40),
        buildField('قيمة الفاتورة', 'اكتب القيمة هنا', true),
      ],
    );
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
              fillColor: enabled ? Colors.white : const Color(0xFFF3F6F9),
              hintText: hint,
              hintStyle: GoogleFonts.cairo(
                fontSize: 16,
                color: const Color(0xFF8DA5B5),
                fontWeight: FontWeight.w400,
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
                borderSide: BorderSide(color: Color(0xFF0077B6)),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildField1({
    required Widget label,
    required String hint,
    required String? value,
    required ValueChanged<String?> onChanged,
    bool moreinfo = false,
    String? additionalText,
    TextStyle? additionalTextStyle,
    bool showMoreInfo = false, // individual flag for each field
  }) {
    const List<String> list = <String>['محمد', 'رامي', 'خالد', 'ارناؤوط'];

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (additionalText != null)
                Text(
                  additionalText,
                  style:
                      additionalTextStyle ??
                      GoogleFonts.cairo(
                        color: const Color(0xFFDC3545),
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                ),
              label,
            ],
          ),
          const SizedBox(height: 8),
          DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              isExpanded: true,
              value: value,
              items: list
                  .map(
                    (item) => DropdownMenuItem<String>(
                      value: item,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            textAlign: TextAlign.right,
                            item,
                            style: GoogleFonts.cairo(
                              fontSize: 16,
                              color: const Color(0xFF505050),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
              onChanged: onChanged,
              iconStyleData: const IconStyleData(icon: SizedBox.shrink()),
              menuItemStyleData: MenuItemStyleData(
                overlayColor: WidgetStatePropertyAll(Color(0xFFE9F2F8)),
              ),
              customButton: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Color(0xFFDDEBF4)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      'Images/dropdown.svg',
                      width: 12,
                      height: 7,
                    ),
                    Flexible(
                      child: Text(
                        value ?? hint,
                        textAlign: TextAlign.right,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.cairo(
                          color: value == null
                              ? const Color(0xFF8DA5B5)
                              : const Color(0xFF505050),
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              dropdownStyleData: DropdownStyleData(
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFDDEBF4)),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3), // shadow color
                      spreadRadius: 0,
                      blurRadius: 8,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          if (moreinfo && showMoreInfo)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'تفاصيل العرض',
                  style: GoogleFonts.cairo(
                    decoration: TextDecoration.underline,
                    color: const Color(0xFF2196F3),
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  softWrap: false,
                ),
                const SizedBox(width: 4),
                SvgPicture.asset('Images/question.svg', width: 16, height: 16),
              ],
            ),
        ],
      ),
    );
  }
}
