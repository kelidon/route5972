import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:route5972/config/router.dart';
import 'package:route5972/main_menu/main_menu_options.dart';

class MainMenuPage extends StatefulWidget {
  const MainMenuPage({super.key});

  @override
  State<MainMenuPage> createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenuPage> {
  final menuItems = MainMenuOptions.values;
  late MainMenuOptions selectedOption = menuItems.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 10),
            itemBuilder: (_, _) => Placeholder(),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'LOGO LOGO\nLOGO',
                    style: TextStyle(fontSize: 32, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ...menuItems.map(
                    (e) => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (selectedOption == e) const Icon(Icons.check, color: Colors.white),
                        TextButton(
                          onPressed: () {
                            //todo показать диалоги с интро
                            Navigator.of(context).pushNamed(AppRouter.cityMap);
                          },
                          child: Text(e.name, style: const TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
