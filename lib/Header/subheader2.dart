import 'package:billing/FourTables/Finished/finishedtable.dart';
import 'package:billing/FourTables/New/newtable.dart';
import 'package:billing/FourTables/Pending/pending_table.dart';
import 'package:billing/FourTables/Shortcomings/shortcomingstable.dart';
import 'package:billing/Header/dropdown3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class Subheader2 extends StatefulWidget {
  final Function(List<String>) onColumnsChanged;
  final GlobalKey<PendingTableState>? pendingTableKey;
  final GlobalKey<FinishedtableState>? finishedTableKey;
  final GlobalKey<NewtableState>? newTableKey;
  final GlobalKey<ShortcomingsState>? shortcomingsKey;

  const Subheader2({
    super.key,
    required this.onColumnsChanged,
    this.pendingTableKey,
    this.finishedTableKey,
    this.newTableKey,
    this.shortcomingsKey,
  });

  @override
  State<Subheader2> createState() => _Subheader2State();
}

class _Subheader2State extends State<Subheader2> {
  List<String> visibleColumns = [];
  bool _isDropdownOpen = false;
  OverlayEntry? _overlayEntry;
  final GlobalKey _buttonKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    // Initialize with all columns visible by default
    visibleColumns = [
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

    // Schedule the callback for the next frame to avoid setState during build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onColumnsChanged(visibleColumns);
    });
  }

  @override
  void dispose() {
    _closeDropdown();
    super.dispose();
  }

  void _toggleDropdown() {
    if (_isDropdownOpen) {
      _closeDropdown();
    } else {
      _openDropdown();
    }
  }

  void _openDropdown() {
    final RenderBox? renderBox =
        _buttonKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    final Offset offset = renderBox.localToGlobal(Offset.zero);
    final Size size = renderBox.size;
    final screenSize = MediaQuery.of(context).size;

    // Calculate position to keep dropdown within screen bounds
    double left = offset.dx - 250; // Position to the left of button
    double top = offset.dy + size.height + 8;

    // Ensure dropdown doesn't go off screen
    if (left < 16) left = 16;
    if (left + 280 > screenSize.width) left = screenSize.width - 280 - 16;
    if (top + 400 > screenSize.height) top = offset.dy - 400 - 8;

    _overlayEntry = OverlayEntry(
      builder: (context) => StatefulBuilder(
        builder: (context, overlaySetState) {
          return GestureDetector(
            onTap: _closeDropdown,
            behavior: HitTestBehavior.translucent,
            child: Stack(
              children: [
                Positioned(
                  left: left,
                  top: top,
                  child: GestureDetector(
                    onTap: () {}, // Prevent closing when tapping inside
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
                            // Header
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
                                    onTap: _closeDropdown,
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
                                          setState(() {
                                            if (isSelected) {
                                              visibleColumns.remove(column);
                                            } else {
                                              visibleColumns.add(column);
                                            }
                                          });
                                          overlaySetState(() {});
                                          // Notify parent component
                                          widget.onColumnsChanged(
                                            visibleColumns,
                                          );

                                          // Update table immediately
                                          _updateTableColumns();
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
                                                    fontWeight: FontWeight.w400,
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
                                                      BorderRadius.circular(4),
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
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
    setState(() {
      _isDropdownOpen = true;
    });
  }

  void _closeDropdown() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    setState(() {
      _isDropdownOpen = false;
    });
  }

  void _updateTableColumns() {
    // PendingTable
    if (widget.pendingTableKey?.currentState != null) {
      final tableState = widget.pendingTableKey!.currentState!;
      if (tableState.mounted) tableState.updateVisibleColumns(visibleColumns);
    }

    // Finishedtable
    if (widget.finishedTableKey?.currentState != null) {
      final tableState = widget.finishedTableKey!.currentState!;
      if (tableState.mounted) tableState.updateVisibleColumns(visibleColumns);
    }

    // Newtable
    if (widget.newTableKey?.currentState != null) {
      final tableState = widget.newTableKey!.currentState!;
      if (tableState.mounted) tableState.updateVisibleColumns(visibleColumns);
    }

    // Shortcomings
    if (widget.shortcomingsKey?.currentState != null) {
      final tableState = widget.shortcomingsKey!.currentState!;
      if (tableState.mounted) tableState.updateVisibleColumns(visibleColumns);
    }
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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final availableWidth = constraints.maxWidth;
          final isCompact = availableWidth < 700;
          final isVeryCompact = availableWidth < 500;

          return _buildFullLayout();
        },
      ),
    );
  }

  Widget _buildFullLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          key: _buttonKey,
          onPressed: _toggleDropdown,
          icon: SvgPicture.asset(
            'Images/filter.svg',
            width: 16,
            height: 17,
            color: _isDropdownOpen ? Color(0xFF1E7CB4) : null,
          ),
        ),

        SizedBox(width: MediaQuery.of(context).size.width / 2),
        Flexible(
          child: TextField(
            // controller: _searchController,
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
  }
}
