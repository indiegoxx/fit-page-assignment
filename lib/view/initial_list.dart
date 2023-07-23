import 'package:assignment/model/data_model.dart';
import 'package:assignment/view/common/tag.dart';
import 'package:flutter/material.dart';

import '../repository/data_repository.dart';
import 'item_details.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Coding Assignment')),
      body: Center(
        child: FutureBuilder<List<dynamic>>(
          future: DataRepository.fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              List<DataModel> data = snapshot.data as List<DataModel>;
              List<Widget> widgets = [];
              for (var item in data) {
                widgets.add(ListTile(
                  title: Text(item.name ?? ''),
                  subtitle: Tag(
                    item: item,
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ItemDetails(
                        item: item,
                      );
                    }));
                  },
                ));
              }
              return ListView(
                children: widgets,
              );
            }
          },
        ),
      ),
    );
  }
}
