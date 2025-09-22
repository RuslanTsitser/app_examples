import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../data/generate_image_repository_impl.dart';
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
          onPressed: () async {
            final imageNotifier = context.read<ImageNotifier>();
            final image = await imageNotifier.getImage();
            final imageBytes = await image?.toByteData(format: ui.ImageByteFormat.png);
            const repository = GenerateImageRepositoryImpl();

            if (imageBytes == null) return;
            final generatedImage = await repository.generateImage(
              image: imageBytes.buffer.asUint8List(),
              prompt: 'Сгенерируй на основе этого скетча другой скетч на том же фоне',
            );

            if (generatedImage == null || !context.mounted) return;
            showCupertinoDialog(
              context: context,
              builder: (context) => _Dialog(generatedImage: generatedImage),
            );
          },
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

class _Dialog extends StatelessWidget {
  const _Dialog({required this.generatedImage});
  final Uint8List? generatedImage;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text('Генерация'),
      content: generatedImage == null
          ? const Text('Генерируем скетч по промпту: "prompt"')
          : SizedBox(height: 300, width: 300, child: Image.memory(generatedImage!)),
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
