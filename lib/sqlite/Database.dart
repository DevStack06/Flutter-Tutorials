import 'package:flutterapps/sqlite/DataModel.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DB {
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, "MYDB.db"),
      onCreate: (database, verison) async {
        await database.execute("""
        CREATE TABLE MYTable(
        id INTEGER PRIMERY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        subtile TEXT NOT NULL
        )
        """);
      },
      version: 1,
    );
  }

  Future<bool> insertData(DataModel dataModel) async {
    final Database db = await initDB();
    db.insert("MYTable", dataModel.toMap());
    return true;
  }
}
