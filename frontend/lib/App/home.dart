import 'package:cyl/Component/Footer/footer.dart';
import 'package:flutter/material.dart';
import 'package:cyl/App/Variables/color_variables.dart';
import 'package:cyl/Component/HomeComponents/BrandDeals/brand_deals.dart';
import 'package:cyl/Component/HomeComponents/Categories/categories.dart';
import 'package:cyl/Component/HomeComponents/DiscountSection/discounts.dart';
import 'package:cyl/Component/SaleInfo/sale_info.dart';
import 'package:cyl/Component/app_bar/app_bar.dart';

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
            const CategoriesTile(),
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
