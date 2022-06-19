import 'package:CYL/App/Variables/WidgetVariables.dart';
import 'package:flutter/material.dart';

class SaleInfo extends StatelessWidget {
  const SaleInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 218,
        width: double.infinity,
        alignment: Alignment.center,
        child: Text(
          'Sale Info',
          textAlign: TextAlign.center,
          style: WidgetVariables.primaryTextStyle.copyWith(fontSize: 40),
        ),
      ),
    );
  }
}
