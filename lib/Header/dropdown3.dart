import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDropdown3 extends StatefulWidget {
  const CustomDropdown3({
    super.key,
    required this.hint,
    required this.items,
    required this.value,
    required this.onChanged,
    this.label,
    this.isRequired = false,
    this.flex = 1,
    this.width,
    this.maxHeight = 200,
    this.showDropdownIcon = true,
    this.dropdownIconPath = 'Images/dropdown.svg',
    this.borderRadius = 8.0,
    this.backgroundColor = Colors.white,
  });

  final String hint;
  final List<String> items;
  final String? value;
  final ValueChanged<String?> onChanged;
  final Widget? label;
  final bool isRequired;
  final int flex;
  final double? width;
  final double maxHeight;
  final bool showDropdownIcon;
  final String dropdownIconPath;
  final double borderRadius;
  final Color backgroundColor;

  @override
  State<CustomDropdown3> createState() => _CustomDropdown3State();
}

class _CustomDropdown3State extends State<CustomDropdown3> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget dropdownWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (widget.label != null) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.isRequired)
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    'مطلوب',
                    style: GoogleFonts.cairo(
                      color: const Color(0xFFDC3545),
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ),
              Flexible(child: widget.label!),
            ],
          ),
          const SizedBox(height: 8),
        ],
        DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            isExpanded: true,
            value: widget.value,
            items: widget.items
                .map(
                  (item) => DropdownMenuItem<String>(
                    value: item,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        item,
                        style: GoogleFonts.cairo(
                          fontSize: 16,
                          color: const Color(0xFF505050),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
            onChanged: widget.onChanged,
            iconStyleData: const IconStyleData(icon: SizedBox.shrink()),
            customButton: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              decoration: BoxDecoration(
                color: widget.backgroundColor,
                borderRadius: BorderRadius.circular(widget.borderRadius),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    widget.dropdownIconPath,
                    width: 12,
                    height: 7,
                  ),
                  const SizedBox(width: 4),
                  Flexible(
                    fit: FlexFit.loose,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerRight,
                      child: Text(
                        widget.value ?? widget.hint,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.cairo(
                          color: widget.value == null
                              ? const Color(0xFF8DA5B5)
                              : const Color(0xFF505050),
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: widget.maxHeight,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFDDEBF4)),
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 0,
                    blurRadius: 8,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
            ),
            dropdownSearchData: DropdownSearchData(
              searchController: _searchController,
              searchInnerWidgetHeight: 50,
              searchInnerWidget: Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 8,
                    ),
                    suffixIcon: const Icon(
                      Icons.search,
                      color: Color(0xFF8DA5B5),
                      size: 16,
                    ),
                    hintTextDirection: TextDirection.rtl,
                    hintText: 'ابحث عن طريق الاسم',
                    hintStyle: GoogleFonts.cairo(
                      fontSize: 14,
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
              searchMatchFn: (item, searchValue) {
                return item.value.toString().toLowerCase().contains(
                  searchValue.toLowerCase(),
                );
              },
            ),
            onMenuStateChange: (isOpen) {
              if (!isOpen) {
                _searchController.clear(); // reset search when closing
              }
            },
          ),
        ),
      ],
    );

    if (widget.width != null) {
      return SizedBox(width: widget.width, child: dropdownWidget);
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth != double.infinity) {
          return dropdownWidget;
        }
        return IntrinsicWidth(child: dropdownWidget);
      },
    );
  }
}
