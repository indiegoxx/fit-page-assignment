import 'package:assignment/model/data_model.dart';
import 'package:flutter/material.dart';
import '../../../util/string_extensions.dart';

class VariableIndicator extends StatelessWidget {
  const VariableIndicator({super.key, required this.variable});
  final Variable variable;

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController(
      text: variable.defaultValue.toString(),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(variable.studyType!.toUpperCase()),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 8, 20),
            child: Text(
              variable.studyType!.toUpperCase(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
          ),
          ListTile(
            title: Text('Set Parameters'),
          ),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: ListTile(
                  title: Text(variable.parameterName!.toTitleCase()),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: _controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a value';
                      }
                      try {
                        double numericValue = double.parse(value);
                        if (numericValue > variable.maxValue! ||
                            numericValue < variable.minValue!) {
                          return 'Value must be between ${variable.minValue} and ${variable.maxValue}';
                        }
                      } catch (e) {
                        return 'Invalid input';
                      }
                      return null;
                    },
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
