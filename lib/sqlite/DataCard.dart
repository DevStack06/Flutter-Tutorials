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
        leading: CircleAvatar(
          backgroundColor: Colors.teal,
          radius: 20,
          child: Icon(
            Icons.edit,
            color: Colors.white,
          ),
        ),
        title: Text(
          data.title,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          data.subtitle,
          style: TextStyle(
            fontSize: 13,
          ),
        ),
        trailing: CircleAvatar(
          radius: 16,
          backgroundColor: Colors.red,
          child: Icon(
            Icons.delete,
            size: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
