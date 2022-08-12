import 'package:cyl/App/Variables/color_variables.dart';
import 'package:cyl/App/Variables/size.dart';
import 'package:cyl/App/Variables/widget_variables.dart';
import 'package:cyl/Component/Card/card.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class SelectedSection extends StatelessWidget {
  final Map<String, String> selection;
  const SelectedSection({Key? key, required this.selection}) : super(key: key);

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
              direction: Axis.vertical,
              children: selection.values.map((e) {
                if (e == '0') {
                  return Container();
                }
                return Query(
                  options: QueryOptions(
                    document: gql("""
                query {
                  product(_id: "$e") {
                    title
                  }
                }
                """),
                  ),
                  builder: (result, {fetchMore, refetch}) {
                    if (result.source == QueryResultSource.loading) {
                      return const Text('loading...');
                    } else if (result.data == null) {
                      return const Text('An error had occured...');
                    }

                    return CustomCard(title: result.data!['product']['title']);
                  },
                );
              }).toList(),
            ),
            WidgetVariables.verticalSpacingSmall,
          ],
        ),
      ),
    );
  }
}
