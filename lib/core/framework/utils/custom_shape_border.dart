import 'package:flutter/rendering.dart';

class CustomShapeBorder extends ContinuousRectangleBorder {
  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    const double radius = 20;

    return Path()
      ..addRRect(
        RRect.fromRectAndCorners(
          rect,
          bottomLeft: const Radius.circular(radius),
        ),
      )
      ..moveTo(rect.right, rect.bottom)
      ..relativeQuadraticBezierTo(0, 0, 0, radius)
      ..relativeQuadraticBezierTo(0, -radius, -radius, -radius)
      ..close();
  }
}

class CustomBoxShapeBorder extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const double radius = 20;
    Path path = Path();

    path
      ..addRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTRB(0, 0, size.width, size.height),
          bottomLeft: const Radius.circular(radius),
        ),
      )
      ..moveTo(size.width, size.height)
      ..relativeQuadraticBezierTo(0, 0, 0, radius)
      ..relativeQuadraticBezierTo(0, -radius, -radius, -radius)
      ..close();

    canvas.drawPath(
        path, Paint()..color = const Color.fromARGB(255, 255, 0, 0));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
