import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../state_manager/sketch_notifier.dart';
import 'prompt_settings_bottom_sheet.dart';

class NavbarPromptButton extends StatelessWidget {
  const NavbarPromptButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      child: const Icon(
        CupertinoIcons.settings,
        color: CupertinoColors.systemBlue,
      ),
      onPressed: () {
        // _showPromptSettings();
      },
    );
  }
}

Future<void> showPromptSettings(BuildContext context) {
  return showCupertinoModalPopup(
    context: context,
    builder: (context) => const PromptSettingsBottomSheet(),
  );
}

class NavbarClearButton extends StatelessWidget {
  const NavbarClearButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      child: const Icon(
        CupertinoIcons.clear,
        color: CupertinoColors.systemBlue,
      ),
      onPressed: () {
        context.read<SketchNotifier>().clearPoints();
      },
    );
  }
}
