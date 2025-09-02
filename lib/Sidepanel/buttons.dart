import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ToggleButton extends StatefulWidget {
  final String name;
  final void Function(bool)? onToggle;

  const ToggleButton(this.name, {Key? key, this.onToggle}) : super(key: key);

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  bool _isPressed = false;

  void _togglePressed() {
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
        //width: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: _isPressed ? Color(0xFF1E7CB4) : Color(0xFFFFFFFF),
          border: Border.all(color: Color(0XFFDDEBF4)),
        ),
        alignment: Alignment.center,
        child: Padding(
          padding: _isPressed
              ? EdgeInsets.only(left: 12.5, right: 12.5, top: 8, bottom: 8)
              : const EdgeInsets.all(8.0),
          child: Text(
            widget.name,
            textAlign: TextAlign.center,
            style: GoogleFonts.cairo(
              fontWeight: _isPressed ? FontWeight.w600 : FontWeight.w400,
              fontSize: _isPressed ? 14 : 12,
              color: _isPressed ? Color(0xFFFFFFFF) : Color(0xFF505050),
            ),
          ),
        ),
      ),
    );
  }
}
