import 'package:flutter/material.dart';

class QrPainter extends CustomPainter {
  QrPainter(this.rect);
  final Rect rect;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    // Рисуем прямоугольник
    // canvas.drawRect(rect, paint);

    // Вычисляем длину линий, которые будут от углов
    double lineLength = rect.width / 3;

    // Рисуем линии от каждого угла (не до половины, а до трети стороны)ы

    // Верхний левый угол
    canvas.drawLine(
        rect.topLeft,
        Offset(rect.topLeft.dx + lineLength, rect.topLeft.dy),
        paint); // Линия вправо
    canvas.drawLine(
        rect.topLeft,
        Offset(rect.topLeft.dx, rect.topLeft.dy + lineLength),
        paint); // Линия вниз

    // Верхний правый угол
    canvas.drawLine(
        rect.topRight,
        Offset(rect.topRight.dx - lineLength, rect.topRight.dy),
        paint); // Линия влево
    canvas.drawLine(
        rect.topRight,
        Offset(rect.topRight.dx, rect.topRight.dy + lineLength),
        paint); // Линия вниз

    // Нижний левый угол
    canvas.drawLine(
        rect.bottomLeft,
        Offset(rect.bottomLeft.dx + lineLength, rect.bottomLeft.dy),
        paint); // Линия вправо
    canvas.drawLine(
        rect.bottomLeft,
        Offset(rect.bottomLeft.dx, rect.bottomLeft.dy - lineLength),
        paint); // Линия вверх

    // Нижний правый угол
    canvas.drawLine(
        rect.bottomRight,
        Offset(rect.bottomRight.dx - lineLength, rect.bottomRight.dy),
        paint); // Линия влево
    canvas.drawLine(
        rect.bottomRight,
        Offset(rect.bottomRight.dx, rect.bottomRight.dy - lineLength),
        paint); // Линия вверх
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
