import 'package:flutter/cupertino.dart';

import '../widgets/generate_button.dart';
import '../widgets/navbar_button.dart';
import '../widgets/navbar_title.dart';
import '../widgets/sketch_canvas.dart';

class SketchScreen extends StatefulWidget {
  const SketchScreen({super.key});

  @override
  State<SketchScreen> createState() => _SketchScreenState();
}

class _SketchScreenState extends State<SketchScreen> {
  String prompt = 'Нарисуй кота';

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: NavbarTitle(),
        trailing: NavbarButton(),
      ),
      child: SafeArea(
        child: Column(
          children: [
            // Холст для скетчей
            Expanded(
              child: SketchCanvas(),
            ),
            // Кнопка генерации
            GenerateButton(),
          ],
        ),
      ),
    );
  }
}
