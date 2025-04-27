import 'package:flutter/material.dart';
import 'package:route5972/common/constant/ui_const.dart';
import 'package:route5972/common/widget/option_item.dart';

class OptionsList extends StatelessWidget {
  const OptionsList({
    required this.options,
    required this.showingOptions,
    super.key,
  });

  final List<({String text, VoidCallback onSelect})> options;
  final bool showingOptions;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: kAnimationDuration,
      child: showingOptions
          ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: options
                  .map(
                    (e) => OptionItem(text: e.text, onSelect: e.onSelect),
                  )
                  .toList(),
            )
          : const SizedBox.shrink(),
    );
  }
}