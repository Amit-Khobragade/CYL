import 'package:flutter/material.dart';
import './Size.dart';

class IconBtn extends StatelessWidget {
  IconData iconData;
  void Function() onPressed;
  String? tooltip;
  double? size;
  Color? color;
  IconBtn({super.key, required this.iconData, required this.onPressed, this.tooltip, this.size, this.color}) {}

  @override
  Widget build(BuildContext context) {
    return (IconButton(
      iconSize: size ?? SizeVariables.iconSizeMed,
      icon: Icon(
        iconData,
        color: color,
      ),
      onPressed: onPressed,
      tooltip: tooltip,
    ));
  }
}
