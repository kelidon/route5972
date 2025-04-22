import 'package:flutter/material.dart';
import 'package:route5972/config/router.dart';

class LevelSelectorPage extends StatelessWidget {
  const LevelSelectorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRouter.bar);
              },
              child: Text(
                'Level 1',
                style: const TextStyle(color: Colors.white),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRouter.race);
              },
              child: Text(
                'free ride :)))',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
