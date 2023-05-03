import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnimationsDemo extends StatefulHookWidget {
  const AnimationsDemo({super.key});

  @override
  State<AnimationsDemo> createState() => _AnimationsDemoState();
}

class _AnimationsDemoState extends State<AnimationsDemo> {
  int money = 0;

  @override
  Widget build(BuildContext context) {
    final animationController =
        useAnimationController(initialValue: 0, duration: 1600.ms);

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
                    .animate(
                      delay: 700.ms,
                    )
                    .fadeIn(duration: 400.ms)
                    .rotate(duration: 1000.ms, begin: 0.5)
                    .moveY(duration: 600.ms, begin: 700)
                    .animate(
                      controller: animationController,
                      autoPlay: false,
                    )
                    .shake(duration: 400.ms)
              ],
            ),
            const Text(
              'Hello guys!',
              style: TextStyle(
                fontSize: 20,
              ),
            )
                .animate(
                  delay: 1600.ms,
                )
                .fadeIn(duration: 400.ms),
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
                setState(() {
                  money++;
                  animationController.reset();
                  animationController.forward();
                });
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

//images/dash.png'
//images/sunglasses.svg'
class WidgetsDemo extends StatefulHookWidget {
  const WidgetsDemo({super.key});

  @override
  State<WidgetsDemo> createState() => _WidgetsDemoState();
}

class _WidgetsDemoState extends State<WidgetsDemo> {
  int money = 0;

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MojSuperWidget(animationController: animationController),
            const Text('Hey everyone!'),
            Text('I have $money dollars in my bank account.!'),
            if (money > 4) const Text('VECI SAM OD 4'),
            if (money <= 4) const Text('MANJI SAM OD 4'),
            TextButton(
              onPressed: () {
                setState(() {
                  money++;
                  animationController.reset();
                  animationController.forward();
                });
              },
              child: const Text('Add money'),
            )
          ],
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
class MojSuperWidget extends StatelessWidget {
  const MojSuperWidget({
    super.key,
    required this.animationController,
  });

  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset('images/dash.png')
            .animate()
            .moveX(delay: 0.ms, duration: 600.ms, begin: 200),
        SvgPicture.asset('images/sunglasses.svg')
            .animate(delay: 500.ms)
            .fadeIn(duration: 400.ms)
            .moveY(duration: 600.ms, begin: 700)
            .animate(controller: animationController)
            .shake(duration: 400.ms)
      ],
    );
  }
}
 