import 'dart:convert';

import 'package:assignment/model/data_model.dart';
import 'package:assignment/view/common/variable_widget.dart';
import 'package:flutter/material.dart';

class CriteriaWidget extends StatelessWidget {
  final Criteria criteria;

  const CriteriaWidget({super.key, required this.criteria});

  @override
  Widget build(BuildContext context) {
    List<Widget> criteriaWidgets = [];
    List<String> criteriaList = criteria.text!.split(' ');

    switch (criteria.type) {
      case 'plain_text':
        for (var item in criteriaList) {
          criteriaWidgets.add(
            Text(
              utf8.decode(item.codeUnits),
              style: TextStyle(fontSize: 17),
            ),
          );
        }
        break;
      case 'variable':
        for (var item in criteriaList) {
          if (item.startsWith('\$')) {
            print(criteria.variable!.toString());
            criteria.variable!.forEach((key, value) {
              if (key == item) {
                Variable variable = Variable.fromJson(value);
                criteriaWidgets.add(
                    VariableWidget(variable_name: item, variable: variable));
              }
            });
          } else {
            criteriaWidgets.add(
              Text(
                utf8.decode(item.codeUnits),
                style: TextStyle(fontSize: 17),
              ),
            );
          }
        }
        break;
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 10, 8, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 4,
            children: criteriaWidgets,
          ),
          Divider(),
        ],
      ),
    );
  }
}
