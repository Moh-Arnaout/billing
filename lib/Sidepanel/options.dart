import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Options extends StatefulWidget {
  const Options(
    this.name,
    this.icon1,
    this.icon2, {
    super.key,
    this.onToggle,
    this.children = const [],
  });

  final String name;
  final String icon1;
  final String icon2;
  final void Function(bool)? onToggle;
  final List<Widget> children;

  @override
  State<Options> createState() => _OptionsState();
}

class _OptionsState extends State<Options> with SingleTickerProviderStateMixin {
  bool _isPressed = false;
  late AnimationController _animationController;
  late Animation<double> _expandAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _togglePressed() {
    setState(() {
      _isPressed = !_isPressed;
    });

    if (_isPressed) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }

    if (widget.onToggle != null) {
      widget.onToggle!(_isPressed);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: _togglePressed,
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: _isPressed ? Color(0xFFE9F2F8) : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                AnimatedRotation(
                  turns: _isPressed ? 0.5 : 0.0,
                  duration: const Duration(milliseconds: 300),
                  child: SvgPicture.asset('Images/${widget.icon2}'),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Text(
                    widget.name,
                    textAlign: TextAlign.end,
                    style: GoogleFonts.cairo(
                      fontSize: 16,
                      fontWeight: _isPressed
                          ? FontWeight.w700
                          : FontWeight.w600,
                      color: const Color(0xFF1E7CB4),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                SvgPicture.asset('Images/${widget.icon1}'),
              ],
            ),
          ),
        ),
        // Expandable children section
        if (widget.children.isNotEmpty)
          SizeTransition(
            sizeFactor: _expandAnimation,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
              child: Column(
                children: widget.children.map((child) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: child,
                  );
                }).toList(),
              ),
            ),
          ),
      ],
    );
  }
}

class ChildOption extends StatelessWidget {
  const ChildOption(
    this.name,
    this.icon1,
    this.icon2, {
    super.key,
    this.onTap,
    this.children = const [],
  });

  final String name;
  final String icon1;
  final String icon2;
  final VoidCallback? onTap;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(right: 12, top: 4, bottom: 4),
            child: Row(
              children: [
                SvgPicture.asset('Images/$icon1'),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Flexible(
                        child: Text(
                          name,
                          softWrap: true,
                          textAlign: TextAlign.end,
                          style: GoogleFonts.cairo(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF1E7CB4),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      SvgPicture.asset('Images/$icon2'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        if (children.isNotEmpty)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(left: 24, right: 24, top: 8),
            child: Column(
              children: children.map((child) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: child,
                );
              }).toList(),
            ),
          ),
      ],
    );
  }
}

class ChildOption2 extends StatelessWidget {
  const ChildOption2(this.name, this.icon1, {super.key, this.onTap});

  final String name;
  final String icon1;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset('Images/$icon1'),
            Flexible(
              child: Text(
                name,
                softWrap: true,
                textAlign: TextAlign.end,
                style: GoogleFonts.cairo(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF8DA5B5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
