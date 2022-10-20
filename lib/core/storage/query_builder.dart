import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class QueryBuilder {

  // Initialize Database
  initDatabase() async {
    String databasesPath = await getDatabasesPath();
    String dbPath = join(databasesPath, dotenv.env['DB_NAME']);

    var database = await openDatabase(dbPath, version: 1, onCreate: createDatabase);
    return database;
  }

  // Create Database
  createDatabase(Database database, int version) async {
    await database.execute("CREATE TABLE post ("
        "id INTEGER PRIMARY KEY AUTOINCREMENT,"
        "title TEXT,"
        "description TEXT,"
        "status TEXT"
        ")");
  }
}