import 'package:flutter/material.dart';
import 'package:route5972/city_map/city_map_game.dart';

class DialogOverlayWidget extends StatelessWidget {
  final CityMapGame game;

  const DialogOverlayWidget({required this.game, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/npc.png', height: 100),
            const SizedBox(height: 16),
            const Text(
              'Welcome, traveler. Will you help us?',
              style: TextStyle(color: Colors.white, fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // respond to choice
                game.overlays.remove(CityMapGame.dialogOverlayIdentifier);
              },
              child: const Text('Yes, I will help'),
            ),
            ElevatedButton(
              onPressed: () {
                game.overlays.remove(CityMapGame.dialogOverlayIdentifier);
              },
              child: const Text('No, I must go'),
            ),
          ],
        ),
      ),
    );
  }
}
