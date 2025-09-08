import 'package:billing/Details/Offerpart/Controller/offercardController.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:get/get.dart';

class Offercard extends StatelessWidget {
  const Offercard(
    this.number,
    this.text,
    this.date, {
    super.key,
    required this.pdfs,
  });

  final String number;
  final String text;
  final String date;
  final List<String> pdfs;

  Future<bool> _checkAssetExists(String assetPath) async {
    try {
      await rootBundle.load(assetPath);
      return true;
    } catch (e) {
      print('Asset not found: $assetPath - Error: $e');
      return false;
    }
  }

  void showPdfPopup(String pdfPath) {
    print('Attempting to load PDF: $pdfPath');

    Get.dialog(_buildPerformantDialog(pdfPath), barrierDismissible: true);
  }

  Widget _buildPerformantDialog(String pdfPath) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final screenHeight = constraints.maxHeight;

        final isSmallScreen = screenWidth < 600;
        final dialogWidth = isSmallScreen
            ? screenWidth * 0.95
            : screenWidth * 0.8;
        final dialogHeight = isSmallScreen
            ? screenHeight * 0.95
            : screenHeight * 0.8;

        return Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: dialogWidth,
              height: dialogHeight,
              margin: EdgeInsets.all(isSmallScreen ? 8 : 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Lightweight Header
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () => Get.back(),
                          icon: const Icon(Icons.close, size: 20),
                          color: const Color(0xFF8DA5B5),
                          splashRadius: 20,
                        ),
                        Expanded(
                          child: Transform.translate(
                            offset: Offset(33, 0),
                            child: Text(
                              pdfPath.split('/').last,
                              style: GoogleFonts.cairo(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.right,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        const SizedBox(width: 40), // Balance the layout
                      ],
                    ),
                  ),

                  // Optimized PDF Viewer
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: FutureBuilder<bool>(
                        future: _checkAssetExists(pdfPath),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    width: 40,
                                    height: 40,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 3,
                                      color: Color(0xFF0077B6),
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    'Loading PDF...',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }

                          if (snapshot.hasError || !snapshot.data!) {
                            return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.error_outline,
                                    size: 48,
                                    color: Colors.red,
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    'ملف PDF غير موجود',
                                    style: GoogleFonts.cairo(
                                      fontSize: 16,
                                      color: Colors.red,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    pdfPath.split('/').last,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            );
                          }

                          // PERFORMANCE-OPTIMIZED PDF VIEWER
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: SfPdfViewer.asset(
                              pdfPath,
                              // CRITICAL PERFORMANCE SETTINGS
                              canShowPaginationDialog: false,
                              canShowPasswordDialog: false,
                              canShowTextSelectionMenu: false,
                              canShowScrollHead: false,
                              canShowScrollStatus: false,
                              enableTextSelection: false,
                              enableDocumentLinkAnnotation: false,
                              enableHyperlinkNavigation: false,

                              // Optimize for web
                              enableDoubleTapZooming: kIsWeb ? false : true,

                              // Performance callbacks
                              onDocumentLoaded: (details) {
                                print(
                                  '✅ PDF loaded: ${details.document.pages.count} pages',
                                );
                              },
                              onDocumentLoadFailed: (details) {
                                print('❌ PDF failed: ${details.error}');
                                Get.back();
                                Get.snackbar(
                                  'Error',
                                  'Failed to load PDF',
                                  snackPosition: SnackPosition.TOP,
                                  backgroundColor: Colors.red,
                                  colorText: Colors.white,
                                  duration: const Duration(seconds: 2),
                                );
                              },

                              // Disable heavy features for web performance
                              pageLayoutMode: kIsWeb
                                  ? PdfPageLayoutMode.single
                                  : PdfPageLayoutMode.continuous,
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  // Lightweight Footer
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        child: SizedBox(
                          width: 160,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () => Get.back(),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF0077B6),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              elevation: 2,
                            ),
                            child: Text(
                              'إغلاق',
                              style: GoogleFonts.cairo(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final OffercardController controller = Get.find<OffercardController>();

    return Column(
      children: [
        GestureDetector(
          onTap: () => controller.toggleExpanded(number),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFFD9EBF4)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset('Images/dropdown.svg', width: 12, height: 7),
                  Text(
                    date,
                    style: GoogleFonts.cairo(
                      color: const Color(0xFF505050),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    text,
                    style: GoogleFonts.cairo(
                      color: const Color(0xFF505050),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    number,
                    style: GoogleFonts.cairo(
                      color: const Color(0xFF505050),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Obx(
          () => controller.isExpanded(number)
              ? Column(
                  children: pdfs
                      .map(
                        (pdf) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFE6F1F8),
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                color: const Color(0xFFDDEBF4),
                              ),
                            ),
                            child: ListTile(
                              dense: true,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 4,
                              ),
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    pdf.split('/').last,
                                    style: GoogleFonts.cairo(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF1E7CB4),
                                      decoration: TextDecoration.underline,
                                      decorationColor: const Color(0xFF0077B6),
                                    ),
                                  ),
                                ],
                              ),
                              onTap: () => showPdfPopup(pdf),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
