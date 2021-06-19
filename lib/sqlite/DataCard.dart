import 'package:flutter/material.dart';
import 'package:flutterapps/sqlite/DataModel.dart';

class DataCard extends StatelessWidget {
  const DataCard({Key? key, required this.data}) : super(key: key);
  final DataModel data;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Icon(Icons.edit),
        ),
        title: Text(data.title),
        subtitle: Text(data.subtitle),
        trailing: CircleAvatar(
          backgroundColor: Colors.red,
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
