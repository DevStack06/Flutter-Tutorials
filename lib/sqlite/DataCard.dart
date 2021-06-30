import 'package:flutter/material.dart';
import 'package:flutterapps/sqlite/DataModel.dart';

class DataCard extends StatelessWidget {
  const DataCard(
      {Key? key, required this.data, required this.edit, required this.index})
      : super(key: key);
  final DataModel data;
  final Function edit;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              edit(index);
            },
          ),
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
