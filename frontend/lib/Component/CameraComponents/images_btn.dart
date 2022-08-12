import 'package:cyl/App/Variables/size.dart';
import 'package:flutter/material.dart';

class ImagesBtn extends StatelessWidget {
  final void Function() onPressed;
  const ImagesBtn({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: SizeVariables.imagePad),
        child: Image.asset(
          'assets/images/images_btn.png',
          width: SizeVariables.iconMed,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
