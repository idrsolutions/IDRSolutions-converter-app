import 'package:flutter/material.dart';

class StyledAppbar extends StatelessWidget implements PreferredSizeWidget {
  const StyledAppbar({
    super.key,
    required this.title,
    required this.color,
  });

  final Widget title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      shape: Border(
          bottom: BorderSide(
        color: color,
        width: 10,
      )),
      elevation: 4,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
