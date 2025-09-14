import 'package:flutter/cupertino.dart';

import 'prompt_settings_bottom_sheet.dart';

class NavbarButton extends StatelessWidget {
  const NavbarButton({
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
