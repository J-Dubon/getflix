import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoaderWidget extends StatelessWidget {

  /// Widget for loader
  const LoaderWidget({
    this.color = Colors.blue,
    this.size = 40,
    super.key
  });

  /// Color of the loader
  final Color color;

  /// Size of the loader
  final double size;

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.staggeredDotsWave(
      color: color,
      size: size,
    );
  }
}