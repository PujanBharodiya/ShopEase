import 'package:path/path.dart';
import 'package:project1/Project_Implementation/model/category.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  // database name
  static final String _dbName = 'shoppio.db';

  // database version
  static int _dbVersion = 9;

  // tables name
  static final String _tableCategory = 'category';

  // columns name
  // Column names
  static final String _id = 'id';
  static final String _title = 'title';
  static final String _desc = 'description';

  /*static final String _image = 'image_path';*/
  static final String _date = 'date';

  static Database? _database;

  Future<Database?> getDatabase() async {
    if (_database == null) {
      _database = await createDatabase();
    }
    return _database;
  }

  Future<Database> createDatabase() async {
    var path = join(await getDatabasesPath(), _dbName);
    print('database path : $path');
    return await openDatabase(
      path,
      version: _dbVersion,
      onCreate: (db, version) {
        return db.execute('CREATE TABLE $_tableCategory('
            '$_id INTEGER PRIMARY KEY AUTOINCREMENT , '
            '$_title TEXT, '
            '$_desc TEXT,'
            '$_date INTEGER )');
      },
    );
  }

  Future<int?> insert(Category category) async {
    final db = await getDatabase();
    return await db?.insert(_tableCategory, category.toMap());
  }

  Future<List<Category>> getCategoryList() async {
    List<Category> categoryList = [];

    final db = await getDatabase();

    final List<Map<String, dynamic>> list =
    await db!.rawQuery('select * from $_tableCategory');

    categoryList = List.generate(list.length, (index) => Category.fromMap(list[index])).toList();
    return categoryList;





  }

  void update() {}

  void delete() {}
}
