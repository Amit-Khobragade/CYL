import 'package:flutter/material.dart';
import './Size.dart';

class WidgetVariables {
  static const horizontalSpacingSmall = SizedBox(width: 20);
  static const verticalSpacingSmall = SizedBox(height: 20);
  static const borderRadiusSmall = BorderRadius.all(Radius.circular(4));
  static const smallPadding = EdgeInsets.all(SizeVariables.pad);
  static final boxBorderSmall = Border.all(color: Colors.black, width: 5, style: BorderStyle.solid);
}
