import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Row2 extends StatefulWidget {
  const Row2({super.key});

  @override
  State<Row2> createState() => _ConsultantrowState();
}

class _ConsultantrowState extends State<Row2> {
  String? selectedConsultant;
  String? selectedOfferNumber;
  String? selectedOfferDate;

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
        buildField(
          enabled: false,
          moreinfo: true,
          additionalText: '',
          label: Text(
            'المبرمج المسؤول',
            style: GoogleFonts.cairo(
              color: const Color(0xFF505050),
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          hint: 'وائل',
          value: selectedOfferNumber,
          onChanged: (value) => setState(() {
            selectedOfferNumber = value;
            showMoreInfoOfferNumber = value != null;
          }),
          showMoreInfo: showMoreInfoOfferNumber,
        ),

        const SizedBox(width: 40),
        buildField(
          enabled: false,
          additionalText: '',
          label: Text(
            ' البرمجة',
            style: GoogleFonts.cairo(
              color: const Color(0xFF505050),
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          hint: 'Access',
          value: selectedConsultant,
          onChanged: (value) => setState(() => selectedConsultant = value),
        ),
      ],
    );
  }

  Widget buildField({
    required bool enabled,
    required Widget label,
    required String hint,
    required String? value,
    required ValueChanged<String?> onChanged,
    bool moreinfo = false,
    String? additionalText,
    TextStyle? additionalTextStyle,
    bool showMoreInfo = false,
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
              onChanged: enabled ? onChanged : null,
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
                  color: Color(0xFFF3F6F9),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Color(0xFFD9EBF4)),
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
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 0,
                      blurRadius: 8,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
