import 'package:CYL/App/Variables/WidgetVariables.dart';
import 'package:CYL/App/Variables/ColorVariables.dart';
import 'package:flutter/material.dart';
import './navbar.dart';
import './searchBox.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool expanded = true;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      automaticallyImplyLeading: false,
      title: Column(
        children: const [NavBar(), WidgetVariables.verticalSpacingSmall, CustomSearchBox()],
      ),

      // TODO: have to change the constant
      toolbarHeight: 160,
      centerTitle: false,
      shadowColor: ColorVariables.appBarShadowColor,
      backgroundColor: ColorVariables.appBarColor,
    );
  }
}
