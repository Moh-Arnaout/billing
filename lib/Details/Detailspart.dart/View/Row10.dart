import 'package:billing/Details/Detailspart.dart/Controller/rowsController.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class Row10 extends StatelessWidget {
  Row10({super.key});

  final RowsController controller = Get.put(RowsController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFD9EBF4)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          children: [
            Expanded(
              child: _buildTechnicalSection(
                'التعديلات الإضافية',
                controller.isAdditionalEdits,
                (val) => controller.isAdditionalEdits.value = val ?? false,
              ),
            ),
            Expanded(
              child: _buildTechnicalSection(
                'CRM رفع الملفات على',
                controller.isUploadToCRM,
                (val) => controller.isUploadToCRM.value = val ?? false,
              ),
            ),
            Expanded(
              child: _buildTechnicalSection(
                'إرسال إيميل إلى رنا',
                controller.isEmail,
                (val) => controller.isEmail.value = val ?? false,
              ),
            ),
            Expanded(
              child: _buildTechnicalSection(
                'scan عمل مسح ضوئي',
                controller.isScan,
                (val) => controller.isScan.value = val ?? false,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTechnicalSection(
    String name,
    RxBool value, // Changed parameter type to RxBool
    ValueChanged<bool?> onChanged,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            name,
            style: GoogleFonts.cairo(
              color: const Color(0xFF505050),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.right,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
        SizedBox(width: 12),
        Transform.translate(
          offset: Offset(-12, 0),
          child: Obx(
            () => Checkbox(
              // Wrapped Checkbox with Obx
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              splashRadius: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              side: WidgetStateBorderSide.resolveWith((
                Set<WidgetState> states,
              ) {
                if (states.contains(WidgetState.selected)) {
                  return const BorderSide(color: Color(0xFF1E7CB4), width: 2);
                }
                if (states.contains(WidgetState.hovered)) {
                  return const BorderSide(color: Color(0xFF2196F3), width: 2);
                }
                return const BorderSide(color: Color(0xFF8DA5B5), width: 1.5);
              }),
              activeColor: const Color(0xFF1E7CB4),
              overlayColor: WidgetStateProperty.all(Colors.transparent),
              checkColor: Colors.white,
              value: value.value, // Access the actual boolean value with .value
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
