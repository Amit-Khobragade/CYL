import 'package:CYL/Component/Footer/Footer.dart';
import 'package:flutter/material.dart';
import 'package:CYL/App/Variables/ColorVariables.dart';
import 'package:CYL/Component/HomeComponents/BrandDeals/BrandDeals.dart';
import 'package:CYL/Component/HomeComponents/Categories/Categories.dart';
import 'package:CYL/Component/HomeComponents/DiscountSection/Discounts.dart';
import 'package:CYL/Component/SaleInfo/SaleInfo.dart';
import 'package:CYL/Component/AppBar/appBar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      backgroundColor: ColorVariables.color60Per,
      body: SafeArea(
        child: CustomScrollView(
          controller: scrollController,
          scrollDirection: Axis.vertical,
          slivers: [
            const CustomAppBar(),
            const Categories(),
            const SaleInfo(),
            const Discounts(),
            const BrandDeals(),
            CustomFooter(scrollController: scrollController)
          ],
          physics: const BouncingScrollPhysics(),
        ),
      ),
    ));
  }
}
