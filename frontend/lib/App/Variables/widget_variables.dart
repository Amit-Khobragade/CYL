import 'package:cyl/App/Variables/color_variables.dart';
import 'package:flutter/material.dart';
import './size.dart';

class WidgetVariables {
  static const horizontalSpacingSmall = SizedBox(width: 20);
  static const verticalSpacingSmall = SizedBox(height: 20);
  static const borderRadiusSmall = BorderRadius.all(Radius.circular(4));
  static const borderRadiusPrimary = BorderRadius.all(Radius.circular(17));
  static const smallPadding = EdgeInsets.all(SizeVariables.pad);
  static const medPadding = EdgeInsets.all(SizeVariables.padMed);
  static const medPaddingHorizontal = EdgeInsets.symmetric(horizontal: SizeVariables.padMed);
  static final boxBorderSmall = Border.all(color: Colors.black, width: 5, style: BorderStyle.solid);
  static const primaryTextStyle = TextStyle(fontSize: 24, color: ColorVariables.secondaryTextColor);
  static const headerTextStyle = TextStyle(fontSize: 30, color: ColorVariables.secondaryTextColor);

//  ! Search Box
  static const searchBoxEdgeInsets = EdgeInsets.symmetric(vertical: 18, horizontal: 18);
  static const searchContainerEdgeInsets = EdgeInsets.symmetric(vertical: 9, horizontal: 20);
//  ! Button
  static final btnBottomShadow = BoxShadow(color: const Color.fromRGBO(203, 203, 203, 0.5), offset: Offset.fromDirection(0.45, 4), blurRadius: 2);
  static final btnTopShadow = BoxShadow(color: const Color.fromRGBO(255, 255, 255, 0.75), offset: Offset.fromDirection(0.45, -4), blurRadius: 2);

//  ! Categories
  static const categoriesPad = EdgeInsetsDirectional.fromSTEB(30, 25, 30, 15);

//  ! Discount
  static const discountCardPad = EdgeInsets.symmetric(vertical: 20);
}
