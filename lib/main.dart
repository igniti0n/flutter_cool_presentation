import 'package:flutter/material.dart';
import 'package:presa_talk/constelation/demo.dart';
import 'package:presa_talk/fluid_nav_bar/fluid_nav_bar.dart';
import 'package:presa_talk/goey_edge/demo.dart';
import 'package:presa_talk/widgets_demo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Preza demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainNav(),
    );
  }
}

class MainNav extends StatefulWidget {
  const MainNav({super.key});

  @override
  State createState() {
    return _FluidNavBarDemoState();
  }
}

class _FluidNavBarDemoState extends State<MainNav> {
  late Widget _child;

  @override
  void initState() {
    _child = const GooeyEdgeDemo(title: 'Gooey Edge Demo');

    super.initState();
  }

  @override
  Widget build(context) {
    // Build a simple container that switches content based of off the selected navigation item
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF75B7E1),
        extendBody: true,
        body: _child,
        bottomNavigationBar: FluidNavBar(onChange: _handleNavigationChange),
      ),
    );
  }

  void _handleNavigationChange(int index) {
    setState(() {
      switch (index) {
        case 0:
          _child = const GooeyEdgeDemo(title: 'Gooey Edge Demo');
          break;
        case 1:
          _child = const ConstellationsListDemo();
          break;
        case 2:
          _child = const WidgetsDemo();
          break;
        case 3:
          _child = const AnimationsDemo();
          break;
      }
      _child = AnimatedSwitcher(
        switchInCurve: Curves.easeOut,
        switchOutCurve: Curves.easeIn,
        duration: const Duration(milliseconds: 500),
        child: _child,
      );
    });
  }
}
