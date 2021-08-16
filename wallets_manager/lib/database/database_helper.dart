import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  Database _database;

  Future<Database> _currentDatabase() async {
    if (_database != null) {
      return _database;
    }

    return _database =
        await openDatabase(join(await getDatabasesPath(), 'wallets_manager.db'),
            onCreate: (database, version) {
      return database.execute(
          'CREATE TABLE articles(id INTEGER PRIMARY KEY, title TEXT, description TEXT, imageUrl TEXT);');
    }, version: 1);
  }

  Future<bool> insertArticle(Map<String, dynamic> article) async {
    return await (await _currentDatabase()).insert('articles', article) > 0;
  }

  Future<List<Map<String, dynamic>>> getArticles() async {
    return await (await _currentDatabase()).query('articles');
  }
}
