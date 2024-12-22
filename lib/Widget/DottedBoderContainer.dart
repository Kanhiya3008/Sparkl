import 'dart:math';
import 'package:flutter/material.dart';

class DottedPorderContainer extends StatelessWidget {
  final List<double> progressValues; // List of progress values (0-1)
  final List<Color> segmentColors; // List of colors for each segment
  final double strokeWidth;
  final double gapWidth; // Width of the gap between segments
  final Widget? child;


  const DottedPorderContainer({
    Key? key,
    required this.progressValues,
    required this.segmentColors,
    this.strokeWidth = 8.0,
    this.gapWidth = 4.0,
    this.child,
  }) : assert(progressValues.length == segmentColors.length,
  'progressValues and segmentColors must have the same length'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pop(context);
      },
      child: CustomPaint(
        painter: _DottedPorderContainer(
          progressValues: progressValues,
          segmentColors: segmentColors,
          strokeWidth: strokeWidth,
          gapWidth: gapWidth,
        ),
        child: Center(child: child),
      ),
    );
  }
}

class _DottedPorderContainer extends CustomPainter {
  final List<double> progressValues;
  final List<Color> segmentColors;
  final double strokeWidth;
  final double gapWidth;

  _DottedPorderContainer({
    required this.progressValues,
    required this.segmentColors,
    required this.strokeWidth,
    required this.gapWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height) / 2 - strokeWidth / 2;
    final totalProgress = progressValues.fold<double>(0, (sum, p) => sum + p);
    if (totalProgress > 1) {
      throw ArgumentError('Total progress cannot exceed 1');
    }

    double startAngle = -pi / 2;

    for (int i = 0; i < progressValues.length; i++) {
      final progress = progressValues[i];
      final segmentAngle = 2 * pi * progress;
      final paint = Paint()
        ..color = segmentColors[i]
        ..strokeWidth = strokeWidth
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.butt;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        segmentAngle,
        false,
        paint,
      );

      startAngle += segmentAngle + (2 * pi * (gapWidth / (2 * pi * radius))); // Add gap

    }
  }

  @override
  bool shouldRepaint(covariant _DottedPorderContainer oldDelegate) {
    return progressValues != oldDelegate.progressValues ||
        segmentColors != oldDelegate.segmentColors ||
        strokeWidth != oldDelegate.strokeWidth ||
        gapWidth != oldDelegate.gapWidth;
  }
}
