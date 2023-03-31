import 'package:path/path.dart';
import 'package:pokedex/model/favorites_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const _databaseName = "favorites.db";
  static const _databaseVersion = 1;
  static const table = 'favorites';
  static const columnId = '_id';
  static const columnNumRef = 'num_ref';
  static const columnIsFavorite = 'is_favorite';

  // torna a classe singleton
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // tem somente uma referência ao banco de dados
  Database? db;

  Future<Database> get database async {
    if (db != null) return db!;
    // instancia o db na primeira vez que for acessado
    db = await _initDatabase();
    return db!;
  }

  // abre o banco de dados e o cria se ele não existir
  _initDatabase() async {
    final databashPath = await getDatabasesPath();
    final path = join(databashPath, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // Código SQL para criar o banco de dados e a tabela
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnNumRef TEXT NOT NULL,
            $columnIsFavorite TEXT NOT NULL
          )
          ''');
  }

  Future insert(FavoriteModel favoriteModel) async {
    Database db = await instance.database;
    return await db.rawInsert(
        'insert into $table ($columnNumRef, $columnIsFavorite) values(?,?)', [
      favoriteModel.numRef,
      favoriteModel.isFavorite,
    ]);
  }

  /// Simple query with WHERE raw query
  Future<List<FavoriteModel>> getAll() async {
    Database db = await instance.database;
    final res = await db.rawQuery("SELECT * FROM $table");
    List<FavoriteModel> listHistory = [];
    for (Map m in res) {
      listHistory.add(FavoriteModel.fromMap(m));
    }
    return listHistory;
  }

  Future<FavoriteModel?> getFavoriteItem(String numRef) async {
    Database db = await instance.database;
    final res =
        await db.rawQuery("SELECT * FROM $table where num_ref = ?", [numRef]);

    if (res.isNotEmpty) {
      List<FavoriteModel> listHistory = [];
      for (Map m in res) {
        listHistory.add(FavoriteModel.fromMap(m));
      }

      return listHistory[0];
    }
    return null;
  }

  Future delete(String numRef) async {
    Database db = await instance.database;
    return await db
        .rawDelete('delete from $table where num_ref = ?;', [numRef]);
  }
}
