import 'package:assignment/view/common/variables_view/variable_indicator.dart';
import 'package:assignment/view/common/variables_view/variable_values_list.dart';
import 'package:flutter/material.dart';

import '../../model/data_model.dart';

class VariableWidget extends StatelessWidget {
  const VariableWidget({super.key, this.variable, required this.variable_name});
  final Variable? variable;
  final String variable_name;

  @override
  Widget build(BuildContext context) {
    switch (variable!.type) {
      case 'value':
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        VariableValuesList(values: variable!.values!)));
          },
          child: Text(
            '(${variable!.values!.first})',
            style: TextStyle(
                fontSize: 17, color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        );
      case 'indicator':
        return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        VariableIndicator(variable: variable!)),
              );
            },
            child: Text(
              '(${variable!.defaultValue})',
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ));
    }

    return Text('-');
  }
}
