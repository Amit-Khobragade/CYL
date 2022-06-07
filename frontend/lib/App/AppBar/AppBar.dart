import 'package:flutter/material.dart';
import '../Variables/ColorVariables.dart';
import '../Variables/Factories.dart';
import '../Variables/Size.dart';
import '../Camera.dart';

class NavBar extends StatelessWidget with PreferredSizeWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return (SliverAppBar(
      floating: true,
      pinned: true,
      backgroundColor: ColorVariables.navBarColor,
      collapsedHeight: SizeVariables.navBarHeight,
      title: const Text("Choose Your Look"),
      titleTextStyle: const TextStyle(color: ColorVariables.textPrimaryColor, fontSize: SizeVariables.navBarTextSize, fontWeight: FontWeight.bold),
      actions: <Widget>[
        IconBtn(
          iconData: Icons.camera,
          onPressed: () => Navigator.pushNamed(context, CameraPage.routes),
          color: Colors.black,
          size: SizeVariables.navBarTextSize,
        )
      ],
    ));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
