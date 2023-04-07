import 'package:flutter/material.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const MyAppbar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      leading: IconButton(
        onPressed: () {},
        icon: Icon(Icons.home_outlined),
      ),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.0);
}
