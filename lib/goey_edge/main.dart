import 'package:flutter/material.dart';
import 'package:presa_talk/_shared/lib/env.dart';

import 'demo.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  static const String _pkg = "gooey_edge";

  const App({super.key});
  static String get pkg => Env.getPackage(_pkg);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GooeyEdgeDemo(title: 'Gooey Edge Demo'),
    );
  }
}
