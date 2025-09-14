import 'package:flutter/cupertino.dart';

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
    builder: (context) => CupertinoAlertDialog(
      title: const Text('Генерация'),
      content: const Text('Генерируем скетч по промпту: "prompt"'),
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
    ),
  );
}
