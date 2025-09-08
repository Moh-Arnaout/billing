import 'package:billing/Details/Detailspart.dart/Controller/rowsController.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class Row2 extends StatelessWidget {
  const Row2({super.key});

  @override
  Widget build(BuildContext context) {
    final RowsController controller = Get.put(RowsController());

    return Row(
      children: [
        buildField(
          controller: controller,
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
          fieldType: 'offerNumber',
        ),
        const SizedBox(width: 40),
        buildField(
          controller: controller,
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
          fieldType: 'consultant',
        ),
      ],
    );
  }

  Widget buildField({
    required RowsController controller,
    required bool enabled,
    required Widget label,
    required String hint,
    required String fieldType,
    bool moreinfo = false,
    String? additionalText,
    TextStyle? additionalTextStyle,
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
                Obx(() {
                  bool showInfo = fieldType == 'offerNumber'
                      ? controller.showMoreInfoOfferNumber.value
                      : fieldType == 'consultant'
                      ? controller.showMoreInfoConsultant.value
                      : controller.showMoreInfoOfferDate.value;

                  return showInfo
                      ? Text(
                          additionalText,
                          style:
                              additionalTextStyle ??
                              GoogleFonts.cairo(
                                color: const Color(0xFFDC3545),
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                        )
                      : const SizedBox.shrink();
                }),
              label,
            ],
          ),
          const SizedBox(height: 8),
          DropdownButtonHideUnderline(
            child: Obx(() {
              String? currentValue;
              if (fieldType == 'consultant') {
                currentValue = controller.selectedConsultant.value;
              } else if (fieldType == 'offerNumber') {
                currentValue = controller.selectedOfferNumber.value;
              } else {
                currentValue = controller.selectedOfferDate2.value;
              }

              return DropdownButton2<String>(
                isExpanded: true,
                value: currentValue,
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
                onChanged: enabled
                    ? (value) {
                        if (fieldType == 'consultant') {
                          controller.selectedConsultant.value = value;
                        } else if (fieldType == 'offerNumber') {
                          controller.selectedOfferNumber.value = value;
                          controller.showMoreInfoOfferNumber.value =
                              value != null;
                        } else {
                          controller.selectedOfferDate2.value = value;
                          controller.showMoreInfoOfferDate.value =
                              value != null;
                        }
                      }
                    : null,
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
                          currentValue ?? hint,
                          textAlign: TextAlign.right,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.cairo(
                            color: currentValue == null
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
              );
            }),
          ),
        ],
      ),
    );
  }
}
