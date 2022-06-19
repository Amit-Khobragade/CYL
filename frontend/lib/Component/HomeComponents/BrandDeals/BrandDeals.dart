import 'package:CYL/App/Variables/ColorVariables.dart';
import 'package:flutter/material.dart';
import 'package:CYL/App/Variables/WidgetVariables.dart';

import 'package:CYL/App/Variables/Size.dart';

class BrandDeals extends StatelessWidget {
  const BrandDeals({Key? key}) : super(key: key);

  Widget placeholderSectionGenerator(double dividerWidth) {
    List<Widget> ar = [
      Divider(
        color: ColorVariables.secondaryTextColor,
        thickness: SizeVariables.dealDividorThickness,
        endIndent: dividerWidth,
      ),
    ];
    bool left = false;
    for (int i = 0; i < 5; ++i) {
      ar.add(const _Deals(
        child: Text(
          'Placeholder',
          style: WidgetVariables.headerTextStyle,
          textAlign: TextAlign.center,
        ),
      ));
      ar.add(
        Divider(
          color: ColorVariables.secondaryTextColor,
          thickness: SizeVariables.dealDividorThickness,
          endIndent: left ? dividerWidth : 0,
          indent: left ? 0 : dividerWidth,
        ),
      );
      left = !left;
    }
    return Column(
      children: ar,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        width: double.infinity,
        padding: WidgetVariables.smallPadding.copyWith(top: 40, bottom: 20),
        child: Column(
          children: [
            Row(
              children: const [
                Text(
                  'Brand Deals',
                  style: WidgetVariables.headerTextStyle,
                ),
                Icon(
                  Icons.arrow_right_alt_rounded,
                  color: ColorVariables.secondaryTextColor,
                  size: SizeVariables.iconSmall1,
                ),
              ],
            ),
            placeholderSectionGenerator(MediaQuery.of(context).size.width / 2),
          ],
        ),
      ),
    );
  }
}

class _Deals extends StatelessWidget {
  final Widget child;
  const _Deals({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: SizeVariables.dealsHeight,
      alignment: Alignment.center,
      child: child,
    );
  }
}
