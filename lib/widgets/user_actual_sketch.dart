import 'package:flutter/cupertino.dart';

class UserActualSketch extends StatefulWidget {
  const UserActualSketch({super.key});

  @override
  State<UserActualSketch> createState() => _UserActualSketchState();
}

class _UserActualSketchState extends State<UserActualSketch> {
  List<Offset?> points = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          points.add(details.localPosition);
        });
      },
      onPanEnd: (details) {
        setState(() {
          points.add(null);
        });
      },
      child: CustomPaint(
        painter: _SketchPainter(points: points),
        child: const SizedBox.expand(),
      ),
    );
  }
}

class _SketchPainter extends CustomPainter {
  const _SketchPainter({required this.points});
  final List<Offset?> points;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = CupertinoColors.systemBlue
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;
    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] == null || points[i + 1] == null) continue;
      canvas.drawLine(points[i]!, points[i + 1]!, paint);
    }
  }

  @override
  bool shouldRepaint(_SketchPainter oldDelegate) => true;
}
