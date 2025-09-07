import 'package:billing/FourTables/Pending/Controller/PendingController.dart';
import 'package:billing/alldetailspage2.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'dart:math' as math;

import 'package:google_fonts/google_fonts.dart';

class PendingTable extends StatelessWidget {
  final bool initialValue;
  final Function(bool?)? onChanged;
  final controller3 = Get.find<Pendingcontroller>();
  final ScrollController _horizontalController = ScrollController();
  final ScrollController _verticalController = ScrollController();

  PendingTable({Key? key, this.initialValue = false, this.onChanged})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Pendingcontroller());

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Table container with horizontal scroll
          LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                width: constraints.maxWidth,
                height: math.min(
                  controller.tableRows.length * 80.0,
                  constraints.maxHeight,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Obx(
                    () => Column(
                      children: [
                        // Header
                        Container(
                          decoration: BoxDecoration(color: Color(0xFFE9F2F8)),
                          child: Row(
                            children: [
                              if (controller.visibleColumns.contains(
                                'اسم العميل',
                              ))
                                _buildHeaderCell('اسم العميل'),
                              if (controller.visibleColumns.contains(
                                'حالة الفحص',
                              ))
                                _buildHeaderCell('حالة الفحص'),
                              if (controller.visibleColumns.contains(
                                'قسم البرمجة',
                              ))
                                _buildHeaderCell('قسم البرمجة'),
                              if (controller.visibleColumns.contains(
                                'المبرمج المسؤول',
                              ))
                                _buildHeaderCell('المبرمج المسؤول'),
                              if (controller.visibleColumns.contains(
                                'تاريخ التسليم المتوقع',
                              ))
                                _buildSortableHeaderCell(
                                  'تاريخ التسليم المتوقع',
                                  controller3,
                                ),
                              if (controller.visibleColumns.contains(
                                'ملاحظات عامة',
                              ))
                                _buildHeaderCell('ملاحظات عامة'),
                              if (controller.visibleColumns.contains(
                                'تاريخ الفحص',
                              ))
                                _buildHeaderCell('تاريخ الفحص'),
                              if (controller.visibleColumns.contains(
                                'حالة تسليم العميل',
                              ))
                                _buildHeaderCell('حالة تسليم العميل'),
                              if (controller.visibleColumns.contains(
                                'تاريخ التسليم الفعلي',
                              ))
                                _buildHeaderCell('تاريخ التسليم الفعلي'),
                              if (controller.visibleColumns.contains('Scan'))
                                _buildHeaderCell('Scan'),
                              if (controller.visibleColumns.contains(
                                'إرسال إيميل ل رنا',
                              ))
                                _buildHeaderCell('إرسال إيميل ل رنا'),
                              if (controller.visibleColumns.contains(
                                'رفع الملفات على CRM',
                              ))
                                _buildHeaderCell('رفع الملفات على CRM'),
                              if (controller.visibleColumns.contains(
                                'قيمة الاشتراك',
                              ))
                                _buildHeaderCell('قيمة الاشتراك'),
                              if (controller.visibleColumns.contains(
                                'قيمة التعديلات',
                              ))
                                _buildHeaderCell('قيمة التعديلات'),
                              if (controller.visibleColumns.contains('المجموع'))
                                _buildHeaderCell('المجموع'),
                              if (controller.visibleColumns.contains(
                                'قيمة الفاتورة',
                              ))
                                _buildHeaderCell('قيمة الفاتورة'),
                              if (controller.visibleColumns.contains(
                                'رقم الفاتورة',
                              ))
                                _buildHeaderCell('رقم الفاتورة'),
                              if (controller.visibleColumns.contains(
                                'حالة الفاتورة',
                              ))
                                _buildHeaderCell('حالة الفاتورة'),
                              if (controller.visibleColumns.contains('مجانية'))
                                _buildHeaderCell('مجانية'),
                              if (controller.visibleColumns.contains(
                                'حافز مبرمج',
                              ))
                                _buildHeaderCell('حافز مبرمج'),
                              if (controller.visibleColumns.contains(
                                'ملاحظات الفاتورة',
                              ))
                                _buildHeaderCell('ملاحظات الفاتورة'),
                            ],
                          ),
                        ),
                        // Rows
                        Expanded(
                          child: SingleChildScrollView(
                            controller: _verticalController,
                            scrollDirection: Axis.vertical,
                            child: GestureDetector(
                              onTap: () {
                                Get.to(() => Alldetailspage2());
                              },
                              child: SingleChildScrollView(
                                controller: _horizontalController,
                                scrollDirection: Axis.horizontal,
                                child: Column(
                                  children: controller.tableRows.asMap().entries.map((
                                    entry,
                                  ) {
                                    TableRowData rowData = entry.value;
                                    bool isLate = controller.isDeliveryLate(
                                      rowData.expectedDeliveryDate,
                                    );

                                    return Container(
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: Color(0xFFE9F2F8),
                                          ),
                                        ),
                                        color: Colors.white,
                                      ),
                                      child: Row(
                                        children: [
                                          // Client Name
                                          if (controller.visibleColumns
                                              .contains('اسم العميل'))
                                            SizedBox(
                                              width: _getColumnWidth(
                                                'اسم العميل',
                                              ),
                                              child: Row(
                                                children: [
                                                  Positioned(
                                                    left: 0,
                                                    top: 0,
                                                    bottom: 0,
                                                    child: Container(
                                                      height:
                                                          MediaQuery.of(
                                                            context,
                                                          ).size.height /
                                                          12,
                                                      decoration: BoxDecoration(
                                                        color: isLate
                                                            ? Colors.red
                                                            : Colors
                                                                  .transparent, // Only change this line
                                                      ),
                                                      child: Center(
                                                        child: RotatedBox(
                                                          quarterTurns: 1,
                                                          child: Text(
                                                            isLate
                                                                ? 'متأخرة'
                                                                : '', // Only change this line
                                                            style: GoogleFonts.cairo(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: isLate
                                                                  ? Colors.white
                                                                  : Colors
                                                                        .transparent, // Only change this line
                                                            ),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  _TextTableCell(
                                                    text: rowData.clientName,
                                                  ),
                                                ],
                                              ),
                                            ),

                                          // Test Status
                                          if (controller.visibleColumns
                                              .contains('حالة الفحص'))
                                            SizedBox(
                                              width: _getColumnWidth(
                                                'حالة الفحص',
                                              ),
                                              child: _StatusTableCell(
                                                text: rowData.testStatus,
                                                colors: _getStatusColor(
                                                  rowData.testStatus,
                                                ),
                                              ),
                                            ),

                                          // Programming Department
                                          if (controller.visibleColumns
                                              .contains('قسم البرمجة'))
                                            SizedBox(
                                              width: _getColumnWidth(
                                                'قسم البرمجة',
                                              ),
                                              child: _TextTableCell(
                                                text: rowData
                                                    .programmingDepartment,
                                              ),
                                            ),

                                          // Responsible Programmer
                                          if (controller.visibleColumns
                                              .contains('المبرمج المسؤول'))
                                            SizedBox(
                                              width: _getColumnWidth(
                                                'المبرمج المسؤول',
                                              ),
                                              child: _ProfileTableCell(
                                                name: rowData
                                                    .responsibleProgrammer,
                                              ),
                                            ),

                                          // Expected Delivery Date
                                          if (controller.visibleColumns
                                              .contains(
                                                'تاريخ التسليم المتوقع',
                                              ))
                                            SizedBox(
                                              width: _getColumnWidth(
                                                'تاريخ التسليم المتوقع',
                                              ),
                                              child: _TextTableCell(
                                                text: rowData
                                                    .expectedDeliveryDate,
                                              ),
                                            ),

                                          // General Notes
                                          if (controller.visibleColumns
                                              .contains('ملاحظات عامة'))
                                            SizedBox(
                                              width: _getColumnWidth(
                                                'ملاحظات عامة',
                                              ),
                                              child: _TextTableCell(
                                                text: rowData.generalNotes,
                                              ),
                                            ),

                                          // Test Date
                                          if (controller.visibleColumns
                                              .contains('تاريخ الفحص'))
                                            SizedBox(
                                              width: _getColumnWidth(
                                                'تاريخ الفحص',
                                              ),
                                              child: _TextTableCell(
                                                text: rowData.testDate,
                                              ),
                                            ),

                                          // Client Delivery Status
                                          if (controller.visibleColumns
                                              .contains('حالة تسليم العميل'))
                                            SizedBox(
                                              width: _getColumnWidth(
                                                'حالة تسليم العميل',
                                              ),
                                              child: _StatusTableCell(
                                                text: rowData
                                                    .clientDeliveryStatus,
                                                colors: _getStatusColor(
                                                  rowData.clientDeliveryStatus,
                                                ),
                                              ),
                                            ),

                                          // Actual Delivery Date
                                          if (controller.visibleColumns
                                              .contains('تاريخ التسليم الفعلي'))
                                            SizedBox(
                                              width: _getColumnWidth(
                                                'تاريخ التسليم الفعلي',
                                              ),
                                              child: _TextTableCell(
                                                text:
                                                    rowData.actualDeliveryDate,
                                              ),
                                            ),

                                          // SCAN
                                          if (controller.visibleColumns
                                              .contains('Scan'))
                                            SizedBox(
                                              width: _getColumnWidth('Scan'),
                                              child: _CheckTableCell(
                                                value: rowData.scanValue.value,
                                                onChanged: (val) {
                                                  rowData.scanValue.value =
                                                      val ?? false;
                                                },
                                              ),
                                            ),

                                          // Send Email to Rana Checkbox
                                          if (controller.visibleColumns
                                              .contains('إرسال إيميل ل رنا'))
                                            SizedBox(
                                              width: _getColumnWidth(
                                                'إرسال إيميل ل رنا',
                                              ),
                                              child: _CheckTableCell(
                                                value: rowData.emailValue.value,
                                                onChanged: (val) {
                                                  rowData.emailValue.value =
                                                      val ?? false;
                                                },
                                              ),
                                            ),

                                          // Upload Files to CRM Checkbox
                                          if (controller.visibleColumns
                                              .contains('رفع الملفات على CRM'))
                                            SizedBox(
                                              width: _getColumnWidth(
                                                'رفع الملفات على CRM',
                                              ),
                                              child: _CheckTableCell(
                                                value: rowData.crmValue.value,
                                                onChanged: (val) {
                                                  rowData.crmValue.value =
                                                      val ?? false;
                                                },
                                              ),
                                            ),

                                          // Subscription Value
                                          if (controller.visibleColumns
                                              .contains('قيمة الاشتراك'))
                                            SizedBox(
                                              width: _getColumnWidth(
                                                'قيمة الاشتراك',
                                              ),
                                              child: _TextTableCell(
                                                text: rowData.subscriptionValue,
                                              ),
                                            ),

                                          // Modifications Value
                                          if (controller.visibleColumns
                                              .contains('قيمة التعديلات'))
                                            SizedBox(
                                              width: _getColumnWidth(
                                                'قيمة التعديلات',
                                              ),
                                              child: _TextTableCell(
                                                text:
                                                    rowData.modificationsValue,
                                              ),
                                            ),

                                          // Total
                                          if (controller.visibleColumns
                                              .contains('المجموع'))
                                            SizedBox(
                                              width: _getColumnWidth('المجموع'),
                                              child: _TextTableCell(
                                                text: rowData.total,
                                              ),
                                            ),

                                          // Invoice Value
                                          if (controller.visibleColumns
                                              .contains('قيمة الفاتورة'))
                                            SizedBox(
                                              width: _getColumnWidth(
                                                'قيمة الفاتورة',
                                              ),
                                              child: _TextTableCell(
                                                text: rowData.invoiceValue,
                                              ),
                                            ),

                                          // Invoice Number
                                          if (controller.visibleColumns
                                              .contains('رقم الفاتورة'))
                                            SizedBox(
                                              width: _getColumnWidth(
                                                'رقم الفاتورة',
                                              ),
                                              child: _TextTableCell(
                                                text: rowData.invoiceNumber,
                                              ),
                                            ),

                                          // Invoice Status
                                          if (controller.visibleColumns
                                              .contains('حالة الفاتورة'))
                                            SizedBox(
                                              width: _getColumnWidth(
                                                'حالة الفاتورة',
                                              ),
                                              child: _StatusTableCell(
                                                text: rowData.invoiceStatus,
                                                colors: _getStatusColor(
                                                  rowData.invoiceStatus,
                                                ),
                                              ),
                                            ),

                                          // Is Free Checkbox
                                          if (controller.visibleColumns
                                              .contains('مجانية'))
                                            SizedBox(
                                              width: _getColumnWidth('مجانية'),
                                              child: _CheckTableCell(
                                                value: rowData.isFree.value,
                                                onChanged: (val) {
                                                  rowData.isFree.value =
                                                      val ?? false;
                                                },
                                              ),
                                            ),

                                          // Programmer Incentive
                                          if (controller.visibleColumns
                                              .contains('حافز مبرمج'))
                                            SizedBox(
                                              width: _getColumnWidth(
                                                'حافز مبرمج',
                                              ),
                                              child: _TextTableCell(
                                                text:
                                                    rowData.programmerIncentive,
                                              ),
                                            ),

                                          // Invoice Notes
                                          if (controller.visibleColumns
                                              .contains('ملاحظات الفاتورة'))
                                            SizedBox(
                                              width: _getColumnWidth(
                                                'ملاحظات الفاتورة',
                                              ),
                                              child: _TextTableCell(
                                                text: rowData.invoiceNotes,
                                              ),
                                            ),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

// Helper method to get status colors
Color _getStatusColor(String status) {
  switch (status) {
    case 'لم يتم الفحص':
      return Color(0xFFFF2D55);
    case 'لم يتم الانتهاء من الفحص':
      return Color(0xFFFFC107);
    case 'تم الفحص':
      return Color(0xFF198754);
    case 'تم التسليم':
      return Color(0xFF198754);
    case 'موقعة':
      return Color(0xFF198754);
    case 'التأكد من الفاتورة':
      return Color(0xFFFFC107);
    case 'لم توقع بعد':
      return Color(0xFFF2557E);
    case 'لم تصدر':
      return Color(0xFFFF2D55);
    case 'لم يتم التسليم':
      return Color(0xFFFF2D55);
    default:
      return Color(0xFF2196F3);
  }
}

Widget _buildHeaderCell(String title) {
  return Container(
    width: _getColumnWidth(title),
    height: 60,
    padding: const EdgeInsets.all(8),
    alignment: Alignment.centerRight,
    child: Text(
      title,
      style: GoogleFonts.cairo(
        fontWeight: FontWeight.w700,
        fontSize: 14,
        color: const Color(0xFF505050),
      ),
      textAlign: TextAlign.center,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    ),
  );
}

Widget _buildSortableHeaderCell(String title, Pendingcontroller controller) {
  return Container(
    width: _getColumnWidth(title),
    height: 60,
    padding: const EdgeInsets.all(8),
    alignment: Alignment.centerRight,
    child: InkWell(
      onTap: controller.sortByDeliveryDate,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset('Images/sorting.svg', width: 16, height: 17.78),
          SizedBox(width: 8),
          Flexible(
            child: Text(
              title,
              style: GoogleFonts.cairo(
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: const Color(0xFF505050),
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    ),
  );
}

double _getColumnWidth(String columnName) {
  switch (columnName) {
    case 'اسم العميل':
      return 244.0;
    case 'المبرمج المسؤول':
      return 220.0;
    case 'تاريخ التسليم المتوقع':
      return 220.0;
    case 'تاريخ التسليم الفعلي':
      return 220.0;
    case 'ملاحظات الفاتورة':
      return 220.0;
    case 'حالة تسليم العميل':
      return 220.0;
    case 'ملاحظات عامة':
      return 220.0;
    case 'حالة الفحص':
      return 220.0;
    case 'إرسال إيميل ل رنا':
      return 220.0;
    case 'رفع الملفات على CRM':
      return 220.0;
    case 'Scan':
      return 220.0;
    case 'تاريخ الفحص':
      return 220.0;
    case 'قيمة الاشتراك':
      return 220.0;
    case 'قيمة التعديلات':
      return 220.0;
    case 'قيمة الفاتورة':
      return 220.0;
    case 'رقم الفاتورة':
      return 220.0;
    case 'حالة الفاتورة':
      return 220.0;
    case 'حافز مبرمج':
      return 220.0;
    case 'قسم البرمجة':
      return 220.0;
    case 'المجموع':
      return 220.0;
    case 'مجانية':
      return 220.0;
    default:
      return 120.0;
  }
}

Widget _TextTableCell({required String text}) {
  return Container(
    padding: const EdgeInsets.all(8),
    alignment: Alignment.centerRight,
    child: Text(
      text,
      style: GoogleFonts.cairo(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Color(0xFF505050),
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    ),
  );
}

Widget _StatusTableCell({required String text, required Color colors}) {
  // Check if background is the yellow color 0xFFFFC107
  final bool isYellowBackground = colors.value == 0xFFFFC107;

  return Container(
    padding: const EdgeInsets.all(8),
    alignment: Alignment.centerRight,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: colors,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: Text(
          text,
          style: GoogleFonts.cairo(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: isYellowBackground ? Color(0xFF505050) : Colors.white,
          ),
          textAlign: TextAlign.right,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          softWrap: true,
        ),
      ),
    ),
  );
}

Widget _CheckTableCell({
  required bool value,
  required Function(bool?) onChanged,
}) {
  return Container(
    padding: const EdgeInsets.all(8),
    alignment: Alignment.centerRight, // Ensures checkbox aligns right for RTL
    child: Transform.translate(
      offset: Offset(12, 0),
      child: Checkbox(
        value: value,
        onChanged: null, // disables checkbox
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        activeColor: const Color(0xFF8DA5B5), // for the check icon
        checkColor: Colors.white,
        fillColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.selected)) {
            // Checked state
            return Color(0xFF8DA5B5);
          }
          // Unchecked/disabled state
          return Color(0xFFD4DFEA);
        }),
        side: WidgetStateBorderSide.resolveWith((Set<WidgetState> states) {
          return const BorderSide(color: Colors.transparent, width: 0);
        }),
      ),
    ),
  );
}

Widget _ProfileTableCell({required String name}) {
  return Container(
    padding: const EdgeInsets.all(8),
    alignment: Alignment.centerRight,
    child: Row(
      children: [
        CircleAvatar(
          radius: 16,
          backgroundImage: AssetImage('Images/man2.jpg'),
        ),
        SizedBox(width: 8),
        Expanded(
          child: Text(
            name,
            style: GoogleFonts.cairo(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xFF505050),
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ],
    ),
  );
}

Widget iconButton(
  String asset,
  String tooltip,
  VoidCallback onTap, {
  Color? color,
}) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(4),
    child: Padding(
      padding: const EdgeInsets.all(4),
      child: Tooltip(
        message: tooltip,
        child: SvgPicture.asset(
          asset,
          width: 16,
          height: 16,
          colorFilter: color != null
              ? ColorFilter.mode(color, BlendMode.srcIn)
              : null,
        ),
      ),
    ),
  );
}
