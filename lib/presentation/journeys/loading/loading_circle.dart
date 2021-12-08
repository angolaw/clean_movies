import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class LoadingCircle extends StatelessWidget {
  final double size;

  const LoadingCircle({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: size,
        height: size,
        child: const RiveAnimation.asset(
          'assets/animations/load.riv',
        ));
  }
}
