import 'package:flutter/material.dart';

class VariableValuesList extends StatelessWidget {
  const VariableValuesList({super.key, required this.values});
  final List<num?> values;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Values'),
      ),
      body: ListView.builder(
        itemCount: values.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                title: Text(values[index].toString()),
              ),
              Divider(
                thickness: 2,
              )
            ],
          );
        },
      ),
    );
  }
}
