import 'package:billing/Details/Detailspart.dart/Row5.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Row4 extends StatefulWidget {
  const Row4({super.key});

  @override
  State<Row4> createState() => _ConsultantrowState();
}

class _ConsultantrowState extends State<Row4> {
  String? selectedConsultant;
  String? selectedOfferNumber;
  DateTime? selectedOfferDate;
  bool itspressed = false;
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
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (itspressed) ...[
              Expanded(
                child: buildField(
                  'ملاحظات (سبب تغيير التاريخ)',
                  'اكتب ملاحظاتك هنا',

                  true,
                ),
              ),
              SizedBox(width: 15),
              Expanded(
                child: buildDateField(
                  enabled: true,
                  additionalText: '',
                  context: context,
                  label: Text(
                    'تاريخ التسليم المتوقع الجديد',
                    style: GoogleFonts.cairo(
                      color: const Color(0xFF505050),
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  hint: 'حدد التاريخ',
                  value: selectedOfferDate,
                  onChanged: (DateTime? value) =>
                      setState(() => selectedOfferDate = value),
                ),
              ),
              SizedBox(width: 15),
            ],

            // Original date field - now with fixed width when alone, expanded when with others
            itspressed
                ? Expanded(
                    child: buildDateField(
                      enabled: false,
                      additionalText: '',
                      context: context,
                      label: Text(
                        'تاريخ التسليم المتوقع',
                        style: GoogleFonts.cairo(
                          color: const Color(0xFF505050),
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                      hint: '25-07-2025',
                      value: selectedOfferDate,
                      onChanged: (DateTime? value) =>
                          setState(() => selectedOfferDate = value),
                    ),
                  )
                : Container(
                    width:
                        230, // Fixed width when alone - adjust this value as needed
                    child: buildDateField(
                      enabled: false,
                      additionalText: '',
                      context: context,
                      label: Text(
                        'تاريخ التسليم المتوقع',
                        style: GoogleFonts.cairo(
                          color: const Color(0xFF505050),
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                      hint: '25-07-2025',
                      value: selectedOfferDate,
                      onChanged: (DateTime? value) =>
                          setState(() => selectedOfferDate = value),
                    ),
                  ),
          ],
        ),

        Transform.translate(
          offset: Offset(10, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    itspressed =
                        !itspressed; // Toggle instead of just setting to true
                  });
                },
                style: ButtonStyle(
                  overlayColor: WidgetStateProperty.all(
                    Colors.transparent,
                  ), // Removes hover color
                  splashFactory: NoSplash
                      .splashFactory, // Removes ripple effect (optional)
                ),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Color(0xFF0077B6), width: 1),
                    ),
                  ),
                  padding: EdgeInsets.only(
                    bottom: 0.5,
                  ), // Adjust this value to increase space
                  child: Text(
                    itspressed
                        ? 'إخفاء التواريخ الإضافية'
                        : 'تغيير تاريخ التسليم المتوقع',
                    style: GoogleFonts.cairo(
                      color: Color(0xFF0077B6),
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Widget buildDateField({
  required bool enabled,
  required BuildContext context,
  required Widget label,
  required String hint,
  required DateTime? value,
  required ValueChanged<DateTime?> onChanged,
  bool moreinfo = false,
  String? additionalText,
  TextStyle? additionalTextStyle,
  bool showMoreInfo = false,
}) {
  final controller = TextEditingController(
    text: value != null ? DateFormat('yyyy-MM-dd').format(value) : null,
  );

  return Column(
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
      GestureDetector(
        onTap: () async {
          if (enabled) {
            DateTime initialDate = value ?? DateTime.now();
            final DateTime? picked = await showDatePicker(
              context: context,
              initialDate: initialDate,
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
              builder: (context, child) {
                return Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: ColorScheme.light(
                      primary: Color(0xFF1E7CB4),
                      onPrimary: Colors.white,
                      onSurface: Colors.black,
                    ),
                  ),
                  child: child!,
                );
              },
            );
            if (picked != null && picked != value) {
              onChanged(picked);
              controller.text = DateFormat('yyyy-MM-dd').format(picked);
            }
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          decoration: BoxDecoration(
            color: enabled ? Colors.white : Color(0xFFF3F6F9),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Color(0xFFD9EBF4)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                'Images/calender.svg',
                width: 20,
                height: 20,
                color: enabled ? Color(0xFF0077B6) : null,
              ),
              Flexible(
                child: Text(
                  controller.text.isNotEmpty ? controller.text : hint,
                  textAlign: TextAlign.right,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.cairo(
                    color: controller.text.isEmpty
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
      ),
    ],
  );
}
