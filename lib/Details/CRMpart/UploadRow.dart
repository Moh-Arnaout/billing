import 'package:billing/FourTables/Finished/finishedtable.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Uploadrow extends StatefulWidget {
  const Uploadrow({
    super.key,
    this.onFilePicked,
    this.onValidationChanged,
    this.onFilesReady,
  });

  final VoidCallback? onFilePicked;
  final Function(bool)? onValidationChanged;
  final Function(List<PlatformFile>)? onFilesReady;

  @override
  State<Uploadrow> createState() => UploadrowState(); // Changed name here
}

class UploadrowState extends State<Uploadrow> {
  // Changed name here
  String? selectedConsultant;
  String? selectedOfferNumber;
  DateTime? selectedOfferDate;
  List<PlatformFile> selectedFiles = [];
  String notesText = "";

  bool showMoreInfoConsultant = false;
  bool showMoreInfoOfferNumber = false;
  bool showMoreInfoOfferDate = false;

  final TextEditingController notesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    notesController.addListener(_validateFields);
  }

  @override
  void dispose() {
    notesController.dispose();
    super.dispose();
  }

  void _validateFields() {
    bool isValid =
        selectedFiles.isNotEmpty &&
        selectedConsultant != null &&
        notesController.text.trim().isNotEmpty;

    widget.onValidationChanged?.call(isValid);
  }

  List<PlatformFile> getSelectedFiles() {
    return selectedFiles;
  }

  void clearFiles() {
    setState(() {
      selectedFiles.clear();
    });
    _validateFields();
  }

  Future<void> _pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
    );

    if (result != null) {
      setState(() {
        selectedFiles.addAll(result.files);
      });
      _validateFields();
      widget.onFilePicked?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: buildField('ملاحظات', 'اكتب ملاحظاتك هنا', true)),
            const SizedBox(width: 12),
            Expanded(
              child: buildField1(
                additionalText: '',
                label: Text(
                  'نوع الملف',
                  style: GoogleFonts.cairo(
                    color: const Color(0xFF505050),
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                hint: 'اختر من القائمة',
                value: selectedConsultant,
                onChanged: (value) {
                  setState(() => selectedConsultant = value);
                  _validateFields();
                },
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: buildField2(
                'إرفاق الملف',
                selectedFiles.isEmpty
                    ? 'قم برفع الملف'
                    : '${selectedFiles.length} files selected',
                true,
                const Icon(
                  Icons.file_upload_outlined,
                  color: Color(0xFF1E7CB4),
                ),
              ),
            ),
          ],
        ),
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
            controller: notesController,
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
                fontWeight: FontWeight.w500,
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

  Widget buildField2(String label, String hint, bool enabled, Icon icons) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
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
          GestureDetector(
            onTap: _pickFiles,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: enabled ? Colors.white : const Color(0xFFF3F6F9),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Color(0xFFDDEBF4)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.file_upload_outlined, color: Color(0xFF1E7CB4)),
                  Expanded(
                    child: Text(
                      hint,
                      textAlign: TextAlign.end,
                      style: GoogleFonts.cairo(
                        fontSize: 16,
                        color: const Color(0xFF8DA5B5),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
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
              onChanged: onChanged,
              iconStyleData: const IconStyleData(icon: SizedBox.shrink()),
              menuItemStyleData: MenuItemStyleData(
                overlayColor: WidgetStatePropertyAll(Color(0xFFE9F2F8)),
              ),
              customButton: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
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
