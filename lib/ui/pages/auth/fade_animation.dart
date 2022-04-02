import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget childWidget;

  const FadeAnimation({
    Key? key,
    required this.delay,
    required this.childWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final tween = MultiTrackTween([
    //   Track("opacity").add(Duration(milliseconds: 500), Tween(begin: 0.0, end: 1.0)),
    //   Track("translateY").add(
    //     Duration(milliseconds: 500), Tween(begin: -30.0, end: 0.0),
    //     curve: Curves.easeOut)
    // ]);

    // return ControlledAnimation(
    //   delay: Duration(milliseconds: (500 * delay).round()),
    //   duration: tween.duration,
    //   tween: tween,
    //   child: child,
    //   builderWithChild: (context, child, animation) => Opacity(
    //     opacity: animation["opacity"],
    //     child: Transform.translate(
    //       offset: Offset(0, animation["translateY"]),
    //       child: child
    //     ),
    //   ),
    // );
    return PlayAnimation<double>(
      delay: Duration(milliseconds: (500 * delay).round()),
      tween: Tween(begin: 50.0, end: 200.0), // specify tween
      duration: const Duration(seconds: 5), // set a duration
      child: childWidget,
      builder: (context, child, value) {
        // <-- use builder function
        return Transform.translate(offset: const Offset(0, 2), child: child);
      },
    );
  }
}
