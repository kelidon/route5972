import 'package:flutter/material.dart';
import 'package:route5972/common/constant/ui_const.dart';
import 'package:route5972/common/widget/dialog_content.dart';
import 'package:route5972/common/widget/npc_image.dart';

class DialogOverlayWidget extends StatefulWidget {
  const DialogOverlayWidget({
    required this.text,
    this.leftImage,
    this.rightImage,
    required this.options,
    super.key,
  });

  final String text;
  final String? leftImage;
  final String? rightImage;
  final List<({String text, VoidCallback onSelect})> options;

  @override
  State<DialogOverlayWidget> createState() => _DialogOverlayWidgetState();
}

class _DialogOverlayWidgetState extends State<DialogOverlayWidget> {
  bool showing = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        showing = true;
      });
    });
  }

  void close() {
    setState(() {
      showing = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: kAnimationDuration,
      switchInCurve: Curves.easeInOutQuad,
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 0.1),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
      },
      child:
          showing
              ? Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: DialogContent(text: widget.text, options: widget.options),
                  ),
                  if (widget.leftImage != null)
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: NPCImage(imagePath: widget.leftImage!),
                    ),
                ],
              )
              : const SizedBox.shrink(),
    );
  }
}
