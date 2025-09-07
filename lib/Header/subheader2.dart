import 'package:billing/FourTables/Finished/Controller/finishedController.dart';
import 'package:billing/FourTables/Finished/View/finishedtable.dart';
import 'package:billing/FourTables/New/Controller/newController.dart';
import 'package:billing/FourTables/New/View/newtable.dart';
import 'package:billing/FourTables/Pending/Controller/PendingController.dart';
import 'package:billing/FourTables/Pending/View/pending_table.dart';
import 'package:billing/FourTables/Shortcomings/Controller/ShortcomingsController.dart';
import 'package:billing/FourTables/Shortcomings/View/shortcomingstable.dart';
import 'package:billing/Header/dropdown3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Subheader2 extends StatelessWidget {
  final Function(List<String>) onColumnsChanged;
  final Key? pendingTableKey;
  final Key? finishedTableKey;
  final Key? newTableKey;
  final Key? shortcomingsKey;

  Subheader2({
    super.key,
    required this.onColumnsChanged,
    this.pendingTableKey,
    this.finishedTableKey,
    this.newTableKey,
    this.shortcomingsKey,
  });

  final GlobalKey _buttonKey = GlobalKey();

  // Use a controller for managing visible columns and dropdown state
  final Subheader2Controller controller = Get.put(Subheader2Controller());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Only wrap the IconButton that uses observable
              Obx(
                () => IconButton(
                  key: _buttonKey,
                  onPressed: () {
                    controller.toggleDropdown(
                      context,
                      _buttonKey,
                      onColumnsChanged,
                      pendingTableKey: pendingTableKey,
                      finishedTableKey: finishedTableKey,
                      newTableKey: newTableKey,
                      shortcomingsKey: shortcomingsKey,
                    );
                  },
                  icon: SvgPicture.asset(
                    'Images/filter.svg',
                    width: 16,
                    height: 17,
                    color: controller.isDropdownOpen.value
                        ? Color(0xFF1E7CB4)
                        : null,
                  ),
                ),
              ),

              SizedBox(width: MediaQuery.of(context).size.width / 2),

              // TextField doesn't need Obx - it's static
              Flexible(
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 12,
                    ),
                    suffixIcon: const Icon(
                      Icons.search,
                      color: Color(0xFF8DA5B5),
                      size: 20,
                    ),
                    hintTextDirection: TextDirection.rtl,
                    hintText: 'ابحث حسب اسم العميل أو رقم الفاتورة',
                    hintStyle: GoogleFonts.cairo(
                      fontSize: 16,
                      color: const Color(0xFF8DA5B5),
                      fontWeight: FontWeight.w400,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFDDEBF4)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// Controller class for Subheader2 dropdown and column state
class Subheader2Controller extends GetxController {
  var visibleColumns = <String>[].obs;
  var isDropdownOpen = false.obs;
  OverlayEntry? _overlayEntry;

  @override
  void onInit() {
    super.onInit();
    // Initialize with all columns visible
    visibleColumns.assignAll([
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
    ]);
  }

  void toggleDropdown(
    BuildContext context,
    GlobalKey buttonKey,
    Function(List<String>) onColumnsChanged, {
    Key? pendingTableKey,
    Key? finishedTableKey,
    Key? newTableKey,
    Key? shortcomingsKey,
  }) {
    if (isDropdownOpen.value) {
      closeDropdown();
    } else {
      openDropdown(
        context,
        buttonKey,
        onColumnsChanged,
        pendingTableKey: pendingTableKey,
        finishedTableKey: finishedTableKey,
        newTableKey: newTableKey,
        shortcomingsKey: shortcomingsKey,
      );
    }
  }

  void openDropdown(
    BuildContext context,
    GlobalKey buttonKey,
    Function(List<String>) onColumnsChanged, {
    Key? pendingTableKey,
    Key? finishedTableKey,
    Key? newTableKey,
    Key? shortcomingsKey,
  }) {
    final RenderBox? renderBox =
        buttonKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    final Offset offset = renderBox.localToGlobal(Offset.zero);
    final Size size = renderBox.size;
    final screenSize = MediaQuery.of(context).size;

    double left = offset.dx - 250; // Position to the left
    double top = offset.dy + size.height + 8;

    if (left < 16) left = 16;
    if (left + 280 > screenSize.width) left = screenSize.width - 280 - 16;
    if (top + 400 > screenSize.height) top = offset.dy - 400 - 8;

    _overlayEntry = OverlayEntry(
      builder: (context) {
        return StatefulBuilder(
          builder: (context, overlaySetState) {
            return GestureDetector(
              onTap: closeDropdown,
              behavior: HitTestBehavior.translucent,
              child: Stack(
                children: [
                  Positioned(
                    left: left,
                    top: top,
                    child: GestureDetector(
                      onTap: () {}, // Prevent close on tap inside
                      child: Material(
                        elevation: 8,
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          width: 280,
                          constraints: BoxConstraints(maxHeight: 400),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Color(0xFFD9EBF4)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.24),
                                spreadRadius: 0,
                                blurRadius: 8,
                                offset: Offset(0, 1),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Header with close button and title
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 12,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: closeDropdown,
                                      child: Icon(
                                        Icons.close,
                                        size: 18,
                                        color: Color(0xFF8DA5B5),
                                      ),
                                    ),
                                    Text(
                                      'اختر الأعمدة التي تريد إظهارها',
                                      style: GoogleFonts.cairo(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF505050),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // Column list
                              Flexible(
                                child: SingleChildScrollView(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 8),
                                    child: Column(
                                      children: _getAllColumns().map((column) {
                                        final isSelected = visibleColumns
                                            .contains(column);
                                        return GestureDetector(
                                          onTap: () {
                                            if (isSelected) {
                                              visibleColumns.remove(column);
                                            } else {
                                              visibleColumns.add(column);
                                            }
                                            overlaySetState(() {});
                                            onColumnsChanged(visibleColumns);
                                            _updateTableColumns(
                                              pendingTableKey: pendingTableKey,
                                              finishedTableKey:
                                                  finishedTableKey,
                                              newTableKey: newTableKey,
                                              shortcomingsKey: shortcomingsKey,
                                            );
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 16,
                                              vertical: 8,
                                            ),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    column,
                                                    style: GoogleFonts.cairo(
                                                      fontSize: 16,
                                                      color: Color(0xFF505050),
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                    textAlign: TextAlign.right,
                                                  ),
                                                ),
                                                SizedBox(width: 12),
                                                Container(
                                                  width: 16,
                                                  height: 16,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          4,
                                                        ),
                                                    border: Border.all(
                                                      color: isSelected
                                                          ? Color(0xFF0077B6)
                                                          : Color(0xFFD1D5DB),
                                                      width: isSelected ? 2 : 1,
                                                    ),
                                                    color: isSelected
                                                        ? Color(0xFF0077B6)
                                                        : Colors.white,
                                                  ),
                                                  child: isSelected
                                                      ? Icon(
                                                          Icons.check,
                                                          size: 12,
                                                          color: Colors.white,
                                                        )
                                                      : null,
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );

    Overlay.of(context).insert(_overlayEntry!);
    isDropdownOpen.value = true;
  }

  void closeDropdown() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    isDropdownOpen.value = false;
  }

  List<String> _getAllColumns() {
    return [
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
  }

  void _updateTableColumns({
    Key? pendingTableKey,
    Key? finishedTableKey,
    Key? newTableKey,
    Key? shortcomingsKey,
  }) {
    // Get each controller instance and call updateVisibleColumns directly
    try {
      final pendingController = Get.find<Pendingcontroller>();
      pendingController.updateVisibleColumns(visibleColumns);
    } catch (e) {
      // Controller not found or not yet initialized
    }

    try {
      final finishedController = Get.find<Finishedcontroller>();
      finishedController.updateVisibleColumns(visibleColumns);
    } catch (e) {
      // Controller not found or not yet initialized
    }

    try {
      final newController = Get.find<Newcontroller>();
      newController.updateVisibleColumns(visibleColumns);
    } catch (e) {
      // Controller not found or not yet initialized
    }

    try {
      final shortcomingsController = Get.find<ShortcomingsController>();
      shortcomingsController.updateVisibleColumns(visibleColumns);
    } catch (e) {
      // Controller not found or not yet initialized
    }
  }
}
