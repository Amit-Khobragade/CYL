import 'package:CYL/App/Variables/ColorVariables.dart';
import 'package:CYL/App/Variables/Size.dart';
import 'package:CYL/App/Variables/WidgetVariables.dart';
import 'package:CYL/Component/Card/Card.dart';
import 'package:flutter/material.dart';

class SelectedSection extends StatelessWidget {
  const SelectedSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        width: double.infinity,
        padding: WidgetVariables.smallPadding,
        child: Column(
          children: [
            WidgetVariables.verticalSpacingSmall,
            Row(
              children: const [
                Text(
                  'Items Selected',
                  style: WidgetVariables.headerTextStyle,
                ),
                Icon(
                  Icons.arrow_right_alt_rounded,
                  color: ColorVariables.secondaryTextColor,
                  size: SizeVariables.iconSmall1,
                ),
              ],
            ),
            WidgetVariables.verticalSpacingSmall,
            Wrap(
              alignment: WrapAlignment.start,
              spacing: 20,
              children: const [
                CustomCard(title: 'placeholder'),
                CustomCard(title: 'placeholder'),
                CustomCard(title: 'placeholder'),
              ],
            ),
            WidgetVariables.verticalSpacingSmall,
          ],
        ),
      ),
    );
  }
}
