import 'package:cyl/App/cart_page.dart';
import 'package:cyl/App/Variables/color_variables.dart';
import 'package:cyl/App/Variables/widget_variables.dart';
import 'package:cyl/App/wish_list.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: WidgetVariables.smallPadding,
      decoration: const BoxDecoration(
          color: ColorVariables.navBarColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(17),
            topRight: Radius.circular(17),
          )),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          BottomBarMenuItems(
            title: 'Home',
            routes: '/',
          ),
          BottomBarMenuItems(
            title: 'WishList',
            routes: WishlistPage.routes,
          ),
          BottomBarMenuItems(
            title: 'Cart',
            routes: CartPage.routes,
          ),
          BottomBarMenuItems(
            title: 'Orders',
            routes: '/',
          ),
        ],
      ),
    );
  }
}

class BottomBarMenuItems extends StatelessWidget {
  final String title, routes;
  const BottomBarMenuItems({Key? key, required this.title, required this.routes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, routes),
      child: Container(
        width: double.infinity,
        padding: WidgetVariables.smallPadding,
        child: Center(
          child: Text(
            title,
            style: WidgetVariables.primaryTextStyle,
          ),
        ),
      ),
    );
  }
}
