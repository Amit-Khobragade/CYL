import 'package:cyl/App/Variables/size.dart';
import 'package:cyl/App/Variables/widget_variables.dart';
import 'package:cyl/Component/app_bar/app_bar.dart';
import 'package:cyl/Component/Card/card.dart';
import 'package:cyl/Component/Footer/footer.dart';
import 'package:flutter/material.dart';

class WishlistPage extends StatefulWidget {
  static const String routes = '/wishlist';
  const WishlistPage({Key? key}) : super(key: key);

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: const [
                  WidgetVariables.horizontalSpacingSmall,
                  Icon(
                    Icons.list,
                    size: SizeVariables.iconSmall1,
                  ),
                  Text(
                    'WishList',
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
    );
  }
}
