import 'package:flutter/material.dart';
import 'dart:math';

class DottedCircle extends CustomPainter {
  final double strokeWidth;
  final Color color;
  final double dashWidth;
  final double dashSpace;

  DottedCircle({
    required this.strokeWidth,
    required this.color,
    required this.dashWidth,
    required this.dashSpace,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final double radius = size.width / 2;
    final Offset center = Offset(size.width / 2, size.height / 2);

    drawDottedCircle(canvas, paint, center, radius);
  }

  drawDottedCircle(
      Canvas canvas, Paint paint, Offset center, double radius) {
    double circumference = 2 * pi * radius;
    double dashCount = circumference / (dashWidth + dashSpace);

    for (int i = 0; i < dashCount; i++) {
      double angle = (2 * pi * i) / dashCount;
      double startX = center.dx + radius * cos(angle);
      double startY = center.dy + radius * sin(angle);

      double endAngle = (2 * pi * (i + 0.5)) / dashCount;
      double endX = center.dx + radius * cos(endAngle);
      double endY = center.dy + radius * sin(endAngle);

      canvas.drawLine(Offset(startX, startY), Offset(endX, endY), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
