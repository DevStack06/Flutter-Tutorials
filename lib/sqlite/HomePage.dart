import 'package:flutter/material.dart';
import 'package:flutterapps/sqlite/DataCard.dart';
import 'package:flutterapps/sqlite/dataModel.dart';

import 'Database.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late DB db;
  List<DataModel> datas = [];
  bool fetching = true;
  TextEditingController titleController = TextEditingController();
  TextEditingController subtitleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    db = DB();
    db.initializeDB();
    getData();
  }

  getData() async {
    datas = await db.getData();
    setState(() {
      fetching = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Sqflite Tutorial"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showMyDialog();
        },
        child: Icon(Icons.add),
      ),
      body: fetching
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: datas.length,
              itemBuilder: (context, index) => DataCard(data: datas[index])),
    );
  }

  void showMyDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(16.0),
          content: Container(
            height: 150,
            child: Column(
              children: <Widget>[
                TextField(
                  controller: titleController,
                  autofocus: true,
                  decoration: new InputDecoration(
                    labelText: 'title',
                  ),
                ),
                TextField(
                  controller: subtitleController,
                  autofocus: true,
                  decoration: new InputDecoration(
                    labelText: 'subtitle',
                  ),
                )
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Save'),
              onPressed: () {
                DataModel model = DataModel(
                  title: titleController.text,
                  subtitle: subtitleController.text,
                );
                db.insertData(model);
                setState(() {
                  datas = [...datas, model];
                });
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }
}
