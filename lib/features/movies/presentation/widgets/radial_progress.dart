import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  const RadialProgress({
    required this.value,
    this.color = Colors.blue,
    this.strokeWidth = 6,
    this.colorLine = Colors.grey,
    this.strokeWidthLine = 4,
    super.key
  });

  final double value;

  final Color color;

  final double strokeWidth;

  final Color colorLine;

  final double strokeWidthLine;

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> with SingleTickerProviderStateMixin {

  late AnimationController controller;

  double percentageAbove = 0.0;

  @override
  void initState() {

    percentageAbove = widget.value;

    controller = AnimationController(
      vsync: this, 
      duration: const Duration(milliseconds: 4500),
    );

    super.initState();
  }

  @override
  void dispose() {

    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    controller.forward(from: 0.0);

    final differenceAnimate = widget.value - percentageAbove;

    percentageAbove = widget.value;

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {

        return Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(10),
          child: Stack(
            children: [
              CustomPaint(
                size: MediaQuery.of(context).size,
                painter: _RadialProgressPainter(
                  value: (widget.value - differenceAnimate) + (differenceAnimate * controller.value),
                  color: widget.color,
                  strokeWidth: widget.strokeWidth,
                  colorLine: widget.colorLine,
                  strokeWidthLine: widget.strokeWidthLine,
                ),
              ),

              Center(
                child: Text(
                  widget.value.toStringAsFixed(1),
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold
                  ),
                ),
              )
            ],
          )
        );

      }
    );
  }
}

class _RadialProgressPainter extends CustomPainter {

  _RadialProgressPainter({
    required this.value,
    required this.color,
    required this.strokeWidth,
    required this.colorLine,
    required this.strokeWidthLine,
  });

  final double value;

  final Color color;

  final double strokeWidth;

  final Color colorLine;

  final double strokeWidthLine;

  @override
  void paint(Canvas canvas, Size size) {
    
    // ================== Circle ==================
    final paint = Paint()
      ..strokeWidth = strokeWidthLine
      ..color = colorLine
      ..style = PaintingStyle.stroke;

    Offset c = Offset(size.width * 0.5, size.height / 2);

    double radius = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(c, radius, paint);

    // ============= Arc =============
    final paintArc = Paint()
      ..strokeWidth = strokeWidth
      ..color = color
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    // Parte que se deberá ir llenando
    double arcAngle = 2 * pi * (value / 10);

    canvas.drawArc(
      Rect.fromCircle(center: c, radius: radius), 
      -pi / 2, 
      arcAngle, 
      false, 
      paintArc
    );

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}