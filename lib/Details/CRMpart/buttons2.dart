import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Buttons2 extends StatefulWidget {
  final String name;
  final void Function(bool)? onToggle;
  final bool isEnabled;

  const Buttons2(this.name, {Key? key, this.onToggle, this.isEnabled = true})
    : super(key: key);

  @override
  State<Buttons2> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<Buttons2> {
  bool _isPressed = false;

  void _togglePressed() {
    if (!widget.isEnabled) return;

    setState(() {
      _isPressed = !_isPressed;
    });
    if (widget.onToggle != null) {
      widget.onToggle!(_isPressed);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _togglePressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.transparent,
          border: Border.all(
            color: widget.isEnabled ? Color(0xFF1E7CB4) : Color(0xFFF3F6F9),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 8, bottom: 8, left: 12, right: 12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.name,
                textAlign: TextAlign.center,
                style: GoogleFonts.cairo(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: widget.isEnabled
                      ? Color(0xFF1E7CB4)
                      : Color(0xFF8DA5B5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
