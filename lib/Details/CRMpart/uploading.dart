import 'dart:typed_data';

import 'package:billing/Details/CRMpart/UploadRow.dart';
import 'package:billing/Details/CRMpart/buttons2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:file_picker/file_picker.dart';
import 'dart:io';

class Uploading extends StatefulWidget {
  const Uploading({super.key, this.onFilePicked});
  final VoidCallback? onFilePicked;

  @override
  State<Uploading> createState() => _UploadingState();
}

class _UploadingState extends State<Uploading> {
  bool isButtonEnabled = false;
  List<PlatformFile> displayedFiles = [];
  final GlobalKey<UploadrowState> uploadrowKey = GlobalKey<UploadrowState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Buttons2(
              'إرفاق ملف',
              isEnabled: isButtonEnabled,
              onToggle: (pressed) {
                if (isButtonEnabled && uploadrowKey.currentState != null) {
                  final selectedFiles = uploadrowKey.currentState!
                      .getSelectedFiles();
                  setState(() {
                    displayedFiles.addAll(selectedFiles);
                  });

                  uploadrowKey.currentState!.clearFiles();

                  print(
                    'Button pressed, files displayed: ${displayedFiles.length}',
                  );
                }
              },
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Uploadrow(
                key: uploadrowKey,
                onValidationChanged: (isValid) {
                  setState(() {
                    isButtonEnabled = isValid;
                  });
                },
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),
        if (displayedFiles.isNotEmpty)
          SizedBox(
            height: 50,
            child: ListView.builder(
              reverse: true,
              scrollDirection: Axis.horizontal,
              itemCount: displayedFiles.length,
              itemBuilder: (context, index) {
                final file = displayedFiles[index];
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
                            setState(() {
                              displayedFiles.removeAt(index);
                            });
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
          ),
      ],
    );
  }
}
