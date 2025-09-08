import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class Buttons2 extends StatelessWidget {
  final String name;
  final void Function(bool)? onToggle;
  final bool isEnabled;

  const Buttons2(this.name, {Key? key, this.onToggle, this.isEnabled = true})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ButtonController(), tag: name);

    return GestureDetector(
      onTap: () {
        if (!isEnabled) return;
        controller.togglePressed();
        if (onToggle != null) {
          onToggle!(controller.isPressed.value);
        }
      },
      child: Obx(
        () => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: controller.isPressed.value && isEnabled
                ? Color(0xFF1E7CB4).withOpacity(0.1)
                : Colors.transparent,
            border: Border.all(
              color: isEnabled ? Color(0xFF1E7CB4) : Color(0xFFF3F6F9),
              width: controller.isPressed.value && isEnabled ? 2 : 1,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 8, bottom: 8, left: 12, right: 12),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  name,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.cairo(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: isEnabled ? Color(0xFF1E7CB4) : Color(0xFF8DA5B5),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonController extends GetxController {
  var isPressed = false.obs;

  void togglePressed() {
    isPressed.value = !isPressed.value;
  }
}
