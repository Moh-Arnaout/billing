import 'dart:typed_data';
import 'package:billing/Details/CRMpart/Controller/uploadingController.dart';
import 'package:billing/Details/CRMpart/Controller/uploadrowController.dart';
import 'package:billing/Details/CRMpart/View/UploadRow.dart';
import 'package:billing/Details/CRMpart/View/buttons2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class Uploading extends StatelessWidget {
  final VoidCallback? onFilePicked;

  const Uploading({super.key, this.onFilePicked});

  @override
  Widget build(BuildContext context) {
    final UploadingController controller = Get.put(UploadingController());
    // Create a unique tag for the Uploadrow controller instance
    final String uploadrowTag = 'uploadrow_${UniqueKey().toString()}';

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Obx(
              () => Buttons2(
                'إرفاق ملف',
                isEnabled: controller.isButtonEnabled.value,
                onToggle: (pressed) {
                  if (controller.isButtonEnabled.value) {
                    // Get the Uploadrow controller by tag
                    final uploadrowController = Get.find<UploadrowController>(
                      tag: uploadrowTag,
                    );
                    controller.storeCurrentEntry(uploadrowTag);
                    final selectedFiles = uploadrowController
                        .getSelectedFiles();
                    controller.addFiles(selectedFiles);
                    uploadrowController.clearFiles();

                    print(
                      'Button pressed, files displayed: ${controller.displayedFiles.length}',
                    );

                    if (onFilePicked != null) {
                      onFilePicked!();
                    }
                  }
                },
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Uploadrow(
                tag:
                    uploadrowTag, // Pass the tag to create a unique controller instance
                onValidationChanged: (isValid) {
                  controller.setButtonEnabled(isValid);
                },
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        Obx(
          () => controller.displayedFiles.isNotEmpty
              ? SizedBox(
                  height: 50,
                  child: ListView.builder(
                    reverse: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.displayedFiles.length,
                    itemBuilder: (context, index) {
                      final file = controller.displayedFiles[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 11.5,
                            horizontal: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Color(0xFFDDEBF4)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  controller.removeFileAt(index);
                                },
                                child: SvgPicture.asset(
                                  'Images/bin.svg',
                                  width: 14,
                                  height: 16,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Text(
                                file.name,
                                style: GoogleFonts.cairo(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF1E7CB4),
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                textAlign: TextAlign.right,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
