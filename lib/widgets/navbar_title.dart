import 'package:flutter/cupertino.dart';

class NavbarTitle extends StatelessWidget {
  const NavbarTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Скетчи',
      style: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
