import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:route5972/common/constant/ui_const.dart';
import 'package:route5972/common/style/text_paint.dart';

class OptionItem extends StatefulWidget {
  const OptionItem({required this.text, required this.onSelect, super.key});

  final String text;
  final VoidCallback onSelect;

  @override
  State<OptionItem> createState() => _OptionItemState();
}

class _OptionItemState extends State<OptionItem> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          hovering = true;
        });
      },
      onExit: (_) {
        setState(() {
          hovering = false;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          children: [
            IntrinsicWidth(
              child: AnimatedTextKit(
                key: ValueKey(widget.text),
                isRepeatingAnimation: false,
                onTap: widget.onSelect,
                animatedTexts: [
                  TypewriterAnimatedText(
                    widget.text,
                    textAlign: TextAlign.start,
                    textStyle: TextPaints.regular.style.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            AnimatedSwitcher(
              duration: kAnimationDuration,
              child: hovering
                  ? Container(width: 30, height: 1, color: Colors.white)
                  : SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}