import 'package:flutter/material.dart';

class NPCImage extends StatelessWidget {
  const NPCImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.sizeOf(context).width * 0.2,
        maxHeight: MediaQuery.sizeOf(context).height * 0.35,
      ),
      child: Align(
        alignment: Alignment.topCenter,
        child: Image.asset('assets/images/npc1.png'),
      ),
    );
  }
}