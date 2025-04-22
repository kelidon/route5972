import 'package:flutter/material.dart';
import 'package:route5972/config/router.dart';
import 'package:route5972/ui/theme/assets_extension.dart';

class App extends StatelessWidget {
  App({super.key});

  final router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        extensions: [AssetsLibrary.build()],
        textTheme: Typography.whiteMountainView,
        pageTransitionsTheme: PageTransitionsTheme(
          builders: Map.fromIterable(
            TargetPlatform.values,
            value: (final _) => const FadeUpwardsPageTransitionsBuilder(),
          ),
        ),
      ),
      onGenerateRoute: router.onGenerateRoute,
    );
  }
}
