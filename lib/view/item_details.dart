import 'package:assignment/model/data_model.dart';
import 'package:flutter/material.dart';

import 'common/criteria_widget.dart';
import 'common/tag.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key, required this.item});
  final DataModel item;
  @override
  Widget build(BuildContext context) {
    List<Criteria> criteria = item.criteria ?? [];

    List<Widget> criteriaWidgets = [];

    for (var item in criteria) {
      criteriaWidgets.add(
        CriteriaWidget(
          criteria: item,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(item.name ?? ''),
              Tag(
                item: item,
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            color: Color.fromRGBO(22, 134, 177, 1),
            child: ListTile(
              title: Text(item.name ?? ''),
              subtitle: Tag(
                item: item,
              ),
            ),
          ),
          ...criteriaWidgets
        ],
      ),
    );
  }
}
