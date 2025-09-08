import 'package:billing/Details/Detailspart.dart/Controller/rowsController.dart';
import 'package:billing/Details/Detailspart.dart/View/Row5.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Row4 extends StatelessWidget {
  const Row4({super.key});

  @override
  Widget build(BuildContext context) {
    final RowsController controller = Get.put(RowsController());

    return Column(
      children: [
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (controller.itspressed.value) ...[
                Expanded(
                  child: buildField(
                    controller,
                    'ملاحظات (سبب تغيير التاريخ)',
                    'اكتب ملاحظاتك هنا',
                    true,
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: buildDateField(
                    controller: controller,
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
                    value: controller.selectedOfferDate.value,
                    onChanged: (DateTime? value) {
                      controller.selectedOfferDate.value = value;
                    },
                  ),
                ),
                SizedBox(width: 15),
              ],

              // Original date field - now with fixed width when alone, expanded when with others
              controller.itspressed.value
                  ? Expanded(
                      child: buildDateField(
                        controller: controller,
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
                        value: controller.selectedOfferDate.value,
                        onChanged: (DateTime? value) {
                          controller.selectedOfferDate.value = value;
                        },
                      ),
                    )
                  : Container(
                      width: 230, // Fixed width when alone
                      child: buildDateField(
                        controller: controller,
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
                        value: controller.selectedOfferDate.value,
                        onChanged: (DateTime? value) {
                          controller.selectedOfferDate.value = value;
                        },
                      ),
                    ),
            ],
          ),
        ),

        Transform.translate(
          offset: Offset(10, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Obx(
                () => TextButton(
                  onPressed: () {
                    controller.itspressed.value = !controller.itspressed.value;
                  },
                  style: ButtonStyle(
                    overlayColor: WidgetStateProperty.all(Colors.transparent),
                    splashFactory: NoSplash.splashFactory,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Color(0xFF0077B6), width: 1),
                      ),
                    ),
                    padding: EdgeInsets.only(bottom: 0.5),
                    child: Text(
                      controller.itspressed.value
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
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildField(
    RowsController controller,
    String label,
    String hint,
    bool enabled,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          label,
          style: GoogleFonts.cairo(
            color: const Color(0xFF505050),
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          enabled: enabled,
          textAlign: TextAlign.right,
          onChanged: (value) => controller.comments.value = value,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.cairo(
              color: const Color(0xFF8DA5B5),
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
            filled: true,
            fillColor: enabled ? Colors.white : Color(0xFFF3F6F9),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Color(0xFFD9EBF4)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Color(0xFFD9EBF4)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Color(0xFF0077B6)),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          ),
        ),
      ],
    );
  }
}

Widget buildDateField({
  required RowsController controller,
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
  final textController = TextEditingController(
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
              textController.text = DateFormat('yyyy-MM-dd').format(picked);
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
                  textController.text.isNotEmpty ? textController.text : hint,
                  textAlign: TextAlign.right,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.cairo(
                    color: textController.text.isEmpty
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
