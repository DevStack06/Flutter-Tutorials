import 'package:flutter/material.dart';
import 'package:flutterapps/sqlite/DataCard.dart';
import 'package:flutterapps/sqlite/DataModel.dart';
import 'package:flutterapps/sqlite/Database.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController subtitleController = TextEditingController();
  List<DataModel> datas = [];
  bool fetching = true;

  late DB db;
  @override
  void initState() {
    super.initState();
    db = DB();
    getData2();
  }

  void getData2() async {
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
          showMyDilogue();
        },
        child: Icon(Icons.add),
      ),
      body: fetching
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: datas.length,
              itemBuilder: (context, index) => DataCard(data: datas[index]),
            ),
    );
  }

  void showMyDilogue() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(14),
            content: Container(
              height: 150,
              child: Column(
                children: [
                  TextFormField(
                    controller: titleController,
                    decoration: InputDecoration(labelText: "title"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: subtitleController,
                    decoration: InputDecoration(labelText: "Subtitle"),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  DataModel dataLocal = DataModel(
                      title: titleController.text,
                      subtitle: subtitleController.text);
                  db.insertData(dataLocal);
                  dataLocal.id = datas[datas.length - 1].id! + 1;
                  setState(() {
                    datas.add(dataLocal);
                  });
                  titleController.clear();
                  subtitleController.clear();
                  Navigator.pop(context);
                },
                child: Text("Save"),
              ),
            ],
          );
        });
  }
}
