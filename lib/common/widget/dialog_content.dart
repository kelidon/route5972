import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:route5972/common/constant/ui_const.dart';
import 'package:route5972/common/style/text_paint.dart';
import 'package:route5972/common/widget/options_list.dart';

class DialogContent extends StatefulWidget {
  const DialogContent({
    required this.text,
    required this.options,
    super.key,
  });

  final String text;
  final List<({String text, VoidCallback onSelect})> options;

  @override
  State<DialogContent> createState() => _DialogContentState();
}

class _DialogContentState extends State<DialogContent> {
  bool showingOptions = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.28,
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(128),
            blurRadius: 10,
            spreadRadius: 5,
            offset: const Offset(-1, -1),
          ),
        ],
        color: Colors.black,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(child: SizedBox.shrink()),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Center(
                        child: AnimatedTextKit(
                          key: ValueKey(widget.text),
                          onFinished: () {
                            setState(() {
                              showingOptions = true;
                            });
                          },
                          isRepeatingAnimation: false,
                          animatedTexts: [
                            TypewriterAnimatedText(
                              widget.text,
                              textAlign: TextAlign.start,
                              textStyle: TextPaints.large.style,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.grey,
                      height: MediaQuery.sizeOf(context).height,
                      width: 1,
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: AnimatedSwitcher(
                          duration: kAnimationDuration,
                          child: showingOptions
                              ? OptionsList(
                                  options: widget.options,
                                  showingOptions: showingOptions,
                                )
                              : SizedBox.shrink(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}