import 'package:cyl/App/Variables/color_variables.dart';
import 'package:cyl/App/Variables/size.dart';
import 'package:cyl/App/Variables/widget_variables.dart';
import 'package:flutter/material.dart';

class Discounts extends StatelessWidget {
  const Discounts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        width: double.infinity,
        alignment: Alignment.topCenter,
        color: ColorVariables.discountPrimaryClr,
        padding: WidgetVariables.smallPadding,
        child: Column(
          children: const [
            Text(
              'Exciting Offers upto 30% off',
              style: WidgetVariables.primaryTextStyle,
            ),
            _DiscountClassRow(
              url1: 'assets/images/lipstick.png',
              url2: 'assets/images/foundations.png',
              title1: 'Lipstick',
              title2: 'Foundations',
            ),
            _DiscountClassRow(
              url1: 'assets/images/eyeliner.png',
              url2: 'assets/images/faceMasks.png',
              title1: 'Eyeliner',
              title2: 'FaceMasks',
            ),
          ],
        ),
      ),
    );
  }
}

class _DiscountClassRow extends StatelessWidget {
  final String url1, url2, title1, title2;
  const _DiscountClassRow({Key? key, required this.url1, required this.url2, required this.title1, required this.title2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _DiscountCard(url: url1, title: title1),
        _DiscountCard(url: url2, title: title2),
      ],
    );
  }
}

class _DiscountCard extends StatelessWidget {
  final String url;
  final String title;
  const _DiscountCard({Key? key, required this.url, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      width: SizeVariables.discountCardWidth,
      padding: WidgetVariables.discountCardPad,
      child: Column(
        children: [
          Image.asset(
            url,
            width: SizeVariables.discountImageWidth,
          ),
          Text(
            title,
            style: WidgetVariables.headerTextStyle,
          )
        ],
      ),
    );
  }
}
