import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:presa_talk/_shared/lib/env.dart';

import 'demo.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  static final String _pkg = "constellations_list";

  const App({super.key});
  static String get pkg => Env.getPackage(_pkg);
  static String get bundle => Env.getBundle(_pkg);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: const []);

    return MaterialApp(
      home: ConstellationsListDemo(),
    );
  }
}
