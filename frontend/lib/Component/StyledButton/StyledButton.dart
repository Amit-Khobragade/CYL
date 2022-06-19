import 'package:CYL/App/Variables/WidgetVariables.dart';
import 'package:flutter/material.dart';
import 'package:CYL/App/Variables/ColorVariables.dart';

class StyledBtn extends StatefulWidget {
  final void Function() eventListener;
  final String text;
  const StyledBtn({Key? key, required this.eventListener, required this.text}) : super(key: key);

  @override
  State<StyledBtn> createState() => _StyledBtnState();
}

class _StyledBtnState extends State<StyledBtn> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.eventListener,
      child: Container(
        padding: WidgetVariables.smallPadding,
        decoration: BoxDecoration(
            color: ColorVariables.color60Per,
            borderRadius: WidgetVariables.borderRadiusPrimary,
            boxShadow: [WidgetVariables.btnTopShadow, WidgetVariables.btnBottomShadow]),
        child: Text(
          widget.text,
          style: WidgetVariables.primaryTextStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
