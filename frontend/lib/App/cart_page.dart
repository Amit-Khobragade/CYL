import 'package:cyl/App/Variables/color_variables.dart';
import 'package:cyl/App/Variables/size.dart';
import 'package:cyl/App/Variables/widget_variables.dart';
import 'package:cyl/Component/app_bar/app_bar.dart';
import 'package:cyl/Component/Card/card.dart';
import 'package:cyl/Component/Footer/footer.dart';
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
          physics: const BouncingScrollPhysics(),
          slivers: [
            const CustomAppBar(),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: const [
                  WidgetVariables.horizontalSpacingSmall,
                  Icon(Icons.shopping_cart, size: SizeVariables.iconSmall1, color: ColorVariables.secondaryTextColor),
                  Text(
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
