import 'package:billing/Details/CRMpart/Controller/uploadrowController.dart';
import 'package:billing/FourTables/Finished/View/finishedtable.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class Uploadrow extends StatelessWidget {
  const Uploadrow({
    super.key,
    this.onFilePicked,
    this.onValidationChanged,
    this.onFilesReady,
    this.tag, // ADD THIS LINE
  });
  final String? tag;
  final VoidCallback? onFilePicked;
  final Function(bool)? onValidationChanged;
  final Function(List<PlatformFile>)? onFilesReady;

  @override
  Widget build(BuildContext context) {
    final UploadrowController controller = Get.put(
      UploadrowController(),
      tag: tag, // Use the tag parameter
    );

    // Set the validation callback
    controller.setValidationCallback(onValidationChanged);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: buildField(
                controller: controller,
                label: 'ملاحظات',
                hint: 'اكتب ملاحظاتك هنا',
                enabled: true,
              ),
            ),
            const SizedBox(width: 12),
            Obx(
              () => Expanded(
                child: buildField1(
                  controller: controller,
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
                  value: controller.selectedConsultant.value,
                  onChanged: (value) {
                    controller.setConsultant(value);
                  },
                ),
              ),
            ),
            const SizedBox(width: 12),
            Obx(
              () => Expanded(
                child: buildField2(
                  controller: controller,
                  label: 'إرفاق الملف',
                  hint: controller.selectedFiles.isEmpty
                      ? 'قم برفع الملف'
                      : '${controller.selectedFiles.length} files selected',
                  enabled: true,
                  icons: const Icon(
                    Icons.file_upload_outlined,
                    color: Color(0xFF1E7CB4),
                  ),
                  onFilePicked: onFilePicked,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildField({
    required UploadrowController controller,
    required String label,
    required String hint,
    required bool enabled,
  }) {
    return Column(
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
          controller: controller.notesController,
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
    );
  }

  Widget buildField2({
    required UploadrowController controller,
    required String label,
    required String hint,
    required bool enabled,
    required Icon icons,
    VoidCallback? onFilePicked,
  }) {
    return Column(
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
          onTap: () async {
            FilePickerResult? result = await FilePicker.platform.pickFiles(
              allowMultiple: true,
            );

            if (result != null) {
              controller.addFiles(result.files);
              onFilePicked?.call();
            }
          },
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
    );
  }

  Widget buildField1({
    required UploadrowController controller,
    required Widget label,
    required String hint,
    required String? value,
    required ValueChanged<String?> onChanged,
    bool moreinfo = false,
    String? additionalText,
    TextStyle? additionalTextStyle,
    bool showMoreInfo = false,
  }) {
    const List<String> list = <String>['PDF', 'صورة', 'Excel', 'Word', 'أخرى'];

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
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Color(0xFFDDEBF4)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset('Images/dropdown.svg', width: 12, height: 7),
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
    );
  }
}

// Create UploadrowState as an extension to maintain compatibility
class UploadrowState {
  final UploadrowController _controller;

  UploadrowState(this._controller);

  List<PlatformFile> getSelectedFiles() {
    return _controller.getSelectedFiles();
  }

  void clearFiles() {
    _controller.clearFiles();
  }
}
