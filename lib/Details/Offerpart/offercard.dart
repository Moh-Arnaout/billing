import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Offercard extends StatefulWidget {
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
  final List<String> pdfs; // List of PDF asset paths

  @override
  State<Offercard> createState() => _OffercardWithDropdownState();
}

class _OffercardWithDropdownState extends State<Offercard> {
  bool isExpanded = false;

  void showPdfPopup(String pdfPath) {
    showDialog(
      context: context,
      builder: (_) => Center(
        child: Dialog(
          insetPadding: EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            decoration: BoxDecoration(color: Colors.white),
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.height * 0.7,
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // File name at the top
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Icon(
                        Icons.close,
                        color: Color(0xFF8DA5B5),
                        size: 16,
                      ),
                    ),
                    Text(
                      pdfPath.split('/').last,
                      style: GoogleFonts.cairo(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                // PDF viewer in the middle
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: SfPdfViewer.asset(pdfPath),
                  ),
                ),
                const SizedBox(height: 12),
                // Close button at the bottom
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(160, 40),
                        backgroundColor: const Color(0xFF0077B6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(8),
                        ),
                      ),
                      child: Text(
                        'إغلاق',
                        style: GoogleFonts.cairo(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => setState(() => isExpanded = !isExpanded),
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
                    widget.date,
                    style: GoogleFonts.cairo(
                      color: const Color(0xFF505050),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    widget.text,
                    style: GoogleFonts.cairo(
                      color: const Color(0xFF505050),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    widget.number,
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
        if (isExpanded)
          Column(
            children: widget.pdfs
                .map(
                  (pdf) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFE6F1F8),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: const Color(0xFFDDEBF4)),
                      ),
                      child: ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              pdf.split('/').last,
                              style: GoogleFonts.cairo(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF1E7CB4),
                                decoration: TextDecoration.underline,
                                decorationColor: Color(0xFF0077B6),
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
          ),
      ],
    );
  }
}
