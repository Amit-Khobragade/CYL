import 'package:flutter/material.dart';
import 'package:cyl/App/Variables/size.dart';

class ClickBtn extends StatelessWidget {
  final void Function() onPressed;
  const ClickBtn({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Image.asset(
        'assets/images/clicking_btn.png',
        width: SizeVariables.iconLarge,
        alignment: Alignment.center,
      ),
    );
  }
}
