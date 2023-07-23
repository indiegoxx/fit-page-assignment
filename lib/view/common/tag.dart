import 'package:flutter/material.dart';

import '../../model/data_model.dart';

class Tag extends StatelessWidget {
  const Tag({super.key, required this.item});
  final DataModel item;

  @override
  Widget build(BuildContext context) {
    Color? color;

    switch (item.color) {
      case 'red':
        color = Colors.red;
        break;
      case 'green':
        color = Colors.green;
        break;
      default:
        color = Colors.black;
    }

    return Container(
      child: Text(
        item.tag ?? '',
        style: TextStyle(color: color),
      ),
    );
  }
}
