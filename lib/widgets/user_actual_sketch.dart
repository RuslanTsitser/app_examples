import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../state_manager/sketch_notifier.dart';

class UserActualSketch extends StatelessWidget {
  const UserActualSketch({super.key});

  @override
  Widget build(BuildContext context) {
    final points = context.watch<SketchNotifier>().points;
    return GestureDetector(
      onPanUpdate: (details) {
        context.read<SketchNotifier>().addPoint(details.localPosition);
      },
      onPanEnd: (details) {
        context.read<SketchNotifier>().addPoint(null);
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
