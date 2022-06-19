import 'package:CYL/App/Variables/Size.dart';
import 'package:flutter/material.dart';

class ImagesBtn extends StatelessWidget {
  const ImagesBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print('images'),
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
