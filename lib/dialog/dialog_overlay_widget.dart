import 'package:flutter/material.dart';
import 'package:route5972/dialog/model/dialog_data.dart';

const Duration dialogFadeDuration = Duration(milliseconds: 300);

class DialogOverlayWidget extends StatefulWidget {
  final DialogData data;

  const DialogOverlayWidget({super.key, required this.data});

  @override
  State<DialogOverlayWidget> createState() => _DialogOverlayWidgetState();
}

class _DialogOverlayWidgetState extends State<DialogOverlayWidget>
    with SingleTickerProviderStateMixin {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      setState(() => _opacity = 1.0);
    });
  }

  void fadeOutAndClose(VoidCallback onComplete) {
    setState(() => _opacity = 0.0);
    Future.delayed(dialogFadeDuration, onComplete);
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: _opacity != 1.0,
      child: AnimatedOpacity(
        opacity: _opacity,
        duration: dialogFadeDuration,
        child: Material(
          color: Colors.transparent,
          child: Container(
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(12),
              image:
                  widget.data.backgroundImagePath == null
                      ? null
                      : DecorationImage(
                        image: AssetImage(widget.data.backgroundImagePath!),
                        fit: BoxFit.cover,
                      ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (widget.data.leftImagePath != null)
                  Image.asset(widget.data.leftImagePath!, width: 200),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.data.text,
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ...widget.data.options.map(
                      (option) => Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: ElevatedButton(
                            onPressed: () {
                              fadeOutAndClose(option.onSelected);
                            },
                          child: Text(option.label),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
