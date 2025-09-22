import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'screens/sketch_screen.dart';
import 'state_manager/image_notifier.dart';
import 'state_manager/sketch_notifier.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SketchNotifier()),
        Provider(create: (context) => ImageNotifier()),
      ],

      child: const CupertinoApp(
        home: SketchScreen(),
      ),
    );
  }
}
