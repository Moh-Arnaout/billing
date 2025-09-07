import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:billing/Details/Billingspart/table.dart';

class BillscardController extends GetxController {
  void showPdfPopup(BuildContext context, String name) {
    showDialog(
      context: context,
      builder: (_) => Center(
        child: Dialog(
          insetPadding: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.5,
              maxWidth: MediaQuery.of(context).size.width * 0.6,
            ),
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // File name + close icon (EXACTLY like your original)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () => Navigator.of(context).pop(),
                          child: const Icon(
                            Icons.close,
                            color: Color(0xFF8DA5B5),
                            size: 20,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            name,
                            style: GoogleFonts.cairo(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Disabled fields + table (EXACTLY like your original)
                    Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: _buildField('رقم الفاتورة', '1234', false),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: _buildField(
                                'نوع الفاتورة',
                                'مبيعات',
                                false,
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: _buildField(
                                'تاريخ الفاتورة',
                                '31-07-2025',
                                false,
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: _buildField(
                                'قيمة الفاتورة',
                                '429.200',
                                false,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        BillingsTable(),
                      ],
                    ),

                    const SizedBox(height: 16),
                    // Close button (EXACTLY like your original)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(160, 40),
                          backgroundColor: const Color(0xFF0077B6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
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
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Your EXACT original buildField method
  Widget _buildField(String label, String hint, bool enabled) {
    return SizedBox(
      width: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            label,
            style: GoogleFonts.cairo(
              color: const Color(0xFF505050),
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            enabled: enabled,
            textAlign: TextAlign.end,
            decoration: InputDecoration(
              filled: true,
              fillColor: enabled ? Colors.white : Color(0xFFF3F6F9),
              hintText: hint,
              hintStyle: GoogleFonts.cairo(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF8DA5B5),
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xFFDDEBF4)),
                borderRadius: BorderRadius.circular(8),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFDDEBF4)),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
