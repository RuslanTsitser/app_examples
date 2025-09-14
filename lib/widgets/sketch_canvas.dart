import 'package:flutter/cupertino.dart';

class SketchCanvas extends StatelessWidget {
  const SketchCanvas({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey6,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: CupertinoColors.systemGrey4,
          width: 1,
        ),
      ),
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              CupertinoIcons.photo,
              size: 64,
              color: CupertinoColors.systemGrey3,
            ),
            SizedBox(height: 16),
            Text(
              'Холст для скетчей',
              style: TextStyle(
                fontSize: 17,
                color: CupertinoColors.systemGrey2,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Нажмите "Генерировать" для создания скетча',
              style: TextStyle(
                fontSize: 15,
                color: CupertinoColors.systemGrey3,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
