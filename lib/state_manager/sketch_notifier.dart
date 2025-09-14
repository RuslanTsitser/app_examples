import 'package:flutter/cupertino.dart';

class SketchNotifier with ChangeNotifier {
  List<Offset?> points = [];

  void addPoint(Offset? point) {
    points.add(point);
    notifyListeners();
  }

  void clearPoints() {
    points.clear();
    notifyListeners();
  }
}
