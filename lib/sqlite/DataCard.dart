import 'package:flutter/material.dart';
import 'package:flutterapps/sqlite/dataModel.dart';

class DataCard extends StatelessWidget {
  const DataCard({Key? key, required this.data}) : super(key: key);

  final DataModel data;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      contentPadding: EdgeInsets.all(8.0),
      title: Text(data.title),
      subtitle: Text(data.subtitle),
    ));
  }
}
