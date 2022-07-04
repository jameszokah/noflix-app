import 'package:noflix/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  ScreenAppBar({this.title});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title!),
      backgroundColor: Colors.black,
      elevation: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: IconButton(
            icon: Icon(Icons.collections_bookmark_rounded),
            onPressed: () => print('collection bookmark'),
          ),
        ),
        AppBarButtons()
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60);
}
