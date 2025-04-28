import 'package:flutter/material.dart';

class NPCImage extends StatelessWidget {
  final String imagePath;

  const NPCImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.sizeOf(context).width * 0.3,
        maxHeight: MediaQuery.sizeOf(context).height * 0.45,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 32),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Image.asset(imagePath),
        ),
      ),
    );
  }
}