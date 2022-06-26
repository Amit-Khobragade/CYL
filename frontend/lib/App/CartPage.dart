import 'package:CYL/App/Variables/ColorVariables.dart';
import 'package:CYL/App/Variables/Size.dart';
import 'package:CYL/App/Variables/WidgetVariables.dart';
import 'package:CYL/Component/AppBar/appBar.dart';
import 'package:CYL/Component/Card/Card.dart';
import 'package:CYL/Component/Footer/Footer.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  static const String routes = '/cart';
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  ScrollController? scrollController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          controller: scrollController!,
          physics: BouncingScrollPhysics(),
          slivers: [
            CustomAppBar(),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  WidgetVariables.horizontalSpacingSmall,
                  Image.asset('assets/images/cart-icon.png', width: SizeVariables.iconMed),
                  const Text(
                    'Your Cart',
                    style: WidgetVariables.headerTextStyle,
                  ),
                  WidgetVariables.horizontalSpacingSmall,
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                width: double.infinity,
                padding: WidgetVariables.smallPadding,
                child: Wrap(
                  alignment: WrapAlignment.spaceEvenly,
                  children: const [
                    CustomCard(title: 'title'),
                    CustomCard(title: 'title'),
                    CustomCard(title: 'title'),
                    CustomCard(title: 'title'),
                    CustomCard(title: 'title'),
                    CustomCard(title: 'title'),
                    CustomCard(title: 'title'),
                    CustomCard(title: 'title'),
                    CustomCard(title: 'title'),
                    CustomCard(title: 'title'),
                    CustomCard(title: 'title'),
                    CustomCard(title: 'title'),
                  ],
                ),
              ),
            ),
            CustomFooter(scrollController: scrollController!),
          ],
        ),
      ),
      bottomSheet: Container(
        width: double.infinity,
        height: 91,
        color: ColorVariables.color60Per,
        child: FractionallySizedBox(
          heightFactor: 0.8,
          widthFactor: 0.85,
          child: Container(
            decoration: const BoxDecoration(
              color: ColorVariables.secondaryTextColor,
              borderRadius: WidgetVariables.borderRadiusPrimary,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Rs XXXX/-',
                  style: WidgetVariables.primaryTextStyle.copyWith(color: ColorVariables.color60Per),
                ),
                WidgetVariables.horizontalSpacingSmall,
                const Icon(
                  Icons.arrow_right_alt_rounded,
                  size: SizeVariables.iconSmall1,
                  color: ColorVariables.color60Per,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
