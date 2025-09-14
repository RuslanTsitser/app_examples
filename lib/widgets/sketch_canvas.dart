import 'package:flutter/cupertino.dart';

import 'user_actual_sketch.dart';

class SketchCanvas extends StatelessWidget {
  const SketchCanvas({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: CupertinoColors.systemGrey6,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: CupertinoColors.systemGrey4,
            width: 1,
          ),
        ),
        child: const _Body(isEmpty: false),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.isEmpty});
  final bool isEmpty;

  @override
  Widget build(BuildContext context) {
    return isEmpty ? const _EmptyWidget() : const UserActualSketch();
  }
}

class _EmptyWidget extends StatelessWidget {
  const _EmptyWidget();

  @override
  Widget build(BuildContext context) {
    return const Center(
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
    );
  }
}
