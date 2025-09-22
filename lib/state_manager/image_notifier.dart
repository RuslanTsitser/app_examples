import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

class ImageNotifier {
  final GlobalKey imageKey = GlobalKey();

  Future<ui.Image?> getImage() async {
    if (imageKey.currentContext == null) return null;
    final boundary = imageKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
    final image = await boundary?.toImage(pixelRatio: 3);
    return image;
  }
}
