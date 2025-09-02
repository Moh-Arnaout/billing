import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ColumnFilter extends StatefulWidget {
  final Function(List<String>) onSelectionChanged;
  final List<String> initialSelectedColumns;

  const ColumnFilter({
    super.key,
    required this.onSelectionChanged,
    this.initialSelectedColumns = const [],
  });

  @override
  State<ColumnFilter> createState() => _ColumnFilterState();
}

class _ColumnFilterState extends State<ColumnFilter> {
  List<String> selectedColumns = [];

  final List<String> availableColumns = [
    'اسم العميل',
    'حالة الفحص',
    'قسم البرمجة',
    'المبرمج المسؤول',
    'تاريخ التسليم المتوقع',
    'ملاحظات عامة',
    'تاريخ الفحص',
    'حالة تسليم العميل',
    'تاريخ التسليم الفعلي',
    'Scan',
    'إرسال إيميل ل رنا',
    'رفع الملفات على CRM',
    'قيمة الاشتراك',
    'قيمة التعديلات',
    'المجموع',
    'قيمة الفاتورة',
    'رقم الفاتورة',
    'حالة الفاتورة',
    'مجانية',
    'حافز مبرمج',
    'ملاحظات الفاتورة',
  ];

  @override
  void initState() {
    super.initState();

    selectedColumns = widget.initialSelectedColumns.isNotEmpty
        ? List.from(widget.initialSelectedColumns)
        : List.from(availableColumns);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          children: [
            TextButton(
              onPressed: () {
                setState(() {
                  selectedColumns = List.from(availableColumns);
                  widget.onSelectionChanged(selectedColumns);
                });
                widget.onSelectionChanged(selectedColumns);
              },
              child: Text(
                'تحديد الكل',
                style: GoogleFonts.cairo(
                  fontSize: 12,
                  color: Color(0xFF1E7CB4),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Text(
              ' | ',
              style: GoogleFonts.cairo(fontSize: 12, color: Color(0xFF505050)),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  selectedColumns.clear();
                  widget.onSelectionChanged(selectedColumns);
                });
              },
              child: Text(
                'إلغاء الكل',
                style: GoogleFonts.cairo(
                  fontSize: 12,
                  color: Color(0xFF1E7CB4),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        SizedBox(width: 16),

        Container(
          alignment: Alignment.centerRight,
          width: MediaQuery.of(context).size.width / 4,
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              isExpanded: true,
              hint: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.filter_list, size: 18, color: Color(0xFF1E7CB4)),
                  Text(
                    'فلترة الأعمدة (${selectedColumns.length})',
                    style: GoogleFonts.cairo(
                      fontSize: 14,
                      color: Color(0xFF505050),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              items: availableColumns.map((column) {
                return DropdownMenuItem<String>(
                  value: column,
                  child: StatefulBuilder(
                    builder: (context, menuSetState) {
                      final isSelected = selectedColumns.contains(column);
                      return InkWell(
                        borderRadius: BorderRadius.circular(8),
                        onTap: () {
                          setState(() {
                            if (isSelected) {
                              selectedColumns.remove(column);
                            } else {
                              selectedColumns.add(column);
                            }
                            widget.onSelectionChanged(selectedColumns);
                          });
                          menuSetState(() {});
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 8,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Checkbox(
                                value: isSelected,
                                onChanged: (checked) {
                                  setState(() {
                                    if (checked!) {
                                      selectedColumns.add(column);
                                    } else {
                                      selectedColumns.remove(column);
                                    }
                                    widget.onSelectionChanged(selectedColumns);
                                  });
                                  menuSetState(() {});
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                side: BorderSide(
                                  color: Color(0xFF8DA5B5),
                                  width: 1.2,
                                ),
                                activeColor: Color(0xFF1E7CB4),
                                checkColor: Colors.white,
                              ),
                              Expanded(
                                child: Text(
                                  column,
                                  style: GoogleFonts.cairo(
                                    fontSize: 14,
                                    color: isSelected
                                        ? Color(0xFF1E7CB4)
                                        : Color(0xFF505050),
                                    fontWeight: isSelected
                                        ? FontWeight.w600
                                        : FontWeight.w400,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }).toList(),
              onChanged: (_) {},

              // Button style
              buttonStyleData: ButtonStyleData(
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFDDEBF4)),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),

              dropdownStyleData: DropdownStyleData(
                maxHeight: 400,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFDDEBF4)),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 0,
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
              ),

              // Menu item style
              menuItemStyleData: MenuItemStyleData(
                height: 48,
                padding: EdgeInsets.zero,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
