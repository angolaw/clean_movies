import 'package:flutter/material.dart';
import 'package:clean_movies/common/extensions/size_extension.dart';

class Logo extends StatelessWidget {
  final double height;
  const Logo({required this.height, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset('pngs/logo.png', height: height.h.toDouble());
  }
}
