import 'package:CYL/App/Camera.dart';
import 'package:CYL/App/Variables/ColorVariables.dart';
import 'package:CYL/App/Variables/Size.dart';
import 'package:flutter/material.dart';

import '../BottomMenuBar/BottomMenuBar.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: SizeVariables.navBarHeight,
      padding: const EdgeInsets.symmetric(horizontal: SizeVariables.navBarPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            child: Image.asset('assets/images/menu.png', width: SizeVariables.iconSmall),
            onTap: () => showModalBottomSheet(
              context: context,
              backgroundColor: Colors.transparent,
              builder: (context) {
                return const BottomBar();
              },
            ),
          ),
          const Text(
            'CYL',
            style: TextStyle(
              fontSize: 24,
              color: ColorVariables.secondaryTextColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          GestureDetector(
            child: Image.asset('assets/images/camera.png', width: SizeVariables.iconSmall),
            onTap: () => Navigator.pushNamed(context, CameraPage.routes),
          ),
        ],
      ),
    );
  }
}
