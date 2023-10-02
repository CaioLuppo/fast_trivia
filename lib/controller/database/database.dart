import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AnswersDatabase {
  static Database? _instance;
  static Future<Database> getInstance() async {
    _instance ??= await openDatabase(
      join(
        await getDatabasesPath(),
        'answers_database.db',
      ),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE answers ("
            "_id INTEGER PRIMARY KEY AUTOINCREMENT,"
            "quizId INTEGER,"
            "questionId INTEGER NOT NULL,"
            "answerId INTEGER NOT NULL"
          ")",
        );
      },
      version: 1,
    );
    return Future.value(_instance);
  }
}
