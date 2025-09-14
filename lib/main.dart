import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'screens/sketch_screen.dart';
import 'state_manager/sketch_notifier.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SketchNotifier(),
      child: const CupertinoApp(
        home: SketchScreen(),
      ),
    );
  }
}
