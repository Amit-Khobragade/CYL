import 'package:CYL/App/Variables/ColorVariables.dart';
import 'package:CYL/App/Variables/WidgetVariables.dart';
import 'package:CYL/Component/StyledButton/StyledButton.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: ColorVariables.textPrimaryColor,
              style: BorderStyle.solid,
              strokeAlign: StrokeAlign.inside,
            ),
          ),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          padding: WidgetVariables.categoriesPad,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              StyledBtn(eventListener: () => print('hello'), text: 'Lipstick'),
              const SizedBox(
                width: 30,
              ),
              StyledBtn(eventListener: () => print('hello'), text: 'Face Masks'),
              const SizedBox(
                width: 30,
              ),
              StyledBtn(eventListener: () => print('hello'), text: 'Hair Products'),
              const SizedBox(
                width: 30,
              ),
              StyledBtn(eventListener: () => print('hello'), text: 'Eyelashes'),
              const SizedBox(
                width: 30,
              ),
              StyledBtn(eventListener: () => print('hello'), text: 'Foundations'),
            ],
          ),
        ),
      ),
    );
  }
}
