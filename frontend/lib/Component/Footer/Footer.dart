import 'package:CYL/App/Variables/ColorVariables.dart';
import 'package:CYL/App/Variables/Size.dart';
import 'package:CYL/App/Variables/WidgetVariables.dart';
import 'package:flutter/material.dart';

class CustomFooter extends StatelessWidget {
  final ScrollController scrollController;
  const CustomFooter({Key? key, required this.scrollController}) : super(key: key);

  Text textGen(String text) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: WidgetVariables.primaryTextStyle.copyWith(color: ColorVariables.color60Per),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: ColorVariables.secondaryTextColor,
        padding: WidgetVariables.smallPadding,
        height: SizeVariables.footerHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [textGen('Products'), textGen('Category'), textGen('About Us')],
                ),
                TextButton(
                  child: textGen('Back To Top'),
                  onPressed: () => scrollController.animateTo(
                    0,
                    duration: const Duration(milliseconds: SizeVariables.delayMidMS),
                    curve: Curves.linear,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.copyright, color: ColorVariables.color60Per),
                textGen('Copyrights reserved to CYL'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
