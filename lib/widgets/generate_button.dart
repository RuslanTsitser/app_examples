import 'dart:developer';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../state_manager/image_notifier.dart';

class GenerateButton extends StatelessWidget {
  const GenerateButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: SizedBox(
        width: double.infinity,
        child: CupertinoButton.filled(
          onPressed: () => generateSketch(context),
          child: const Text(
            'Генерировать',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> generateSketch(BuildContext context) {
  // Здесь будет логика генерации скетча
  return showCupertinoDialog(
    context: context,
    builder: (context) => const _Dialog(),
  );
}

class _Dialog extends StatefulWidget {
  const _Dialog();

  @override
  State<_Dialog> createState() => _DialogState();
}

class _DialogState extends State<_Dialog> {
  ui.Image? image;
  @override
  void initState() {
    super.initState();
    _getImage();
  }

  Future<void> _getImage() async {
    image = await context.read<ImageNotifier>().getImage();
    log(image.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text('Генерация'),
      content: image == null
          ? const Text('Генерируем скетч по промпту: "prompt"')
          : SizedBox(height: 300, width: 300, child: RawImage(image: image!)),
      actions: [
        CupertinoDialogAction(
          child: const Text('Отмена'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        CupertinoDialogAction(
          isDefaultAction: true,
          child: const Text('ОК'),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }
}
