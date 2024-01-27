import 'package:flutter/material.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  MyAppbar({
    super.key,
    this.actions,
    this.backgroundColor,
    this.title,
    this.leading,
    this.centerTitle,
  });

  final Color? backgroundColor;
  final Widget? leading;
  final Widget? title;
  List<Widget>? actions;
final bool? centerTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 5),
      child: AppBar(
        centerTitle: centerTitle,
        backgroundColor: backgroundColor,
        automaticallyImplyLeading: false,
        title: title,
        leading: leading,
        actions: actions,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(20);
}
