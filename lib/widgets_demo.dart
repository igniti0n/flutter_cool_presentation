import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnimationsDemo extends StatefulWidget {
  const AnimationsDemo({super.key});

  @override
  State<AnimationsDemo> createState() => _AnimationsDemoState();
}

class _AnimationsDemoState extends State<AnimationsDemo> {
  int money = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset('images/dash.png')
                    .animate()
                    .moveX(delay: 0.ms, duration: 600.ms, begin: 200),
                SvgPicture.asset('images/sunglasses.svg')
                    .animate(delay: 700.ms)
                    .fadeIn(duration: 400.ms)
                    .rotate(duration: 1000.ms, begin: 0.5)
                    .moveY(duration: 600.ms, begin: 700),
              ],
            ),
            const Text(
              'Hello guys!',
              style: TextStyle(
                fontSize: 20,
              ),
            ).animate(delay: 1600.ms).fadeIn(duration: 400.ms),
            const SizedBox(
              height: 80,
            ),
            Text(
              'I got $money in my bank account',
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() => money++);
              },
              child: const Text(
                'Add money',
                style: TextStyle(fontSize: 16, color: Colors.green),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WidgetsDemo extends StatefulWidget {
  const WidgetsDemo({super.key});

  @override
  State<WidgetsDemo> createState() => _WidgetsDemoState();
}

class _WidgetsDemoState extends State<WidgetsDemo> {
  int money = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset('images/dash.png'),
                SvgPicture.asset('images/sunglasses.svg')
              ],
            ),
            const SizedBox(
              height: 80,
            ),
            Text(
              'I got $money in my bank account',
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() => money++);
              },
              child: const Text(
                'Add money',
                style: TextStyle(fontSize: 16, color: Colors.green),
              ),
            ),
          ],
        ),
      ),
    );
  }
}