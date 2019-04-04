import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

final String peopleTable = "peopleTable";
final String idColumn = "idColumn";
final String emailColumn = "EmailColumn";
final String senhaColumn = "SenhaColumn";

class PeopleHelper {
  static final PeopleHelper _instance = PeopleHelper.internal();

  factory PeopleHelper() => _instance;

  PeopleHelper.internal();

  Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await initDb();
      return _db;
    }
  }

  Future<Database> initDb() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, "people2.db");

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
      await db.execute(
          "CREATE TABLE $peopleTable($idColumn INTEGER PRIMARY KEY,$emailColumn TEXT, $senhaColumn TEXT)");
    });
  }

  Future<People> savePeople(People people) async {
    Database dbMovies = await db;
    people.id = await dbMovies.insert(peopleTable, people.toMap());
    return people;
  }

  Future<People> getPeople(int id) async {
    Database dbPeople = await db;
    List<Map> maps = await dbPeople.query(peopleTable,
        columns: [idColumn, emailColumn, senhaColumn],
        where: "$idColumn = ?",
        whereArgs: [id]);
    if (maps.length > 0) {
      return People.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int> deletePeople(int id) async {
    Database dbPeople = await db;
    await dbPeople.delete(peopleTable, where: "$idColumn = ?", whereArgs: [id]);
  }

  Future<int> updatePeople(People people) async {
    Database dbPeople = await db;
    dbPeople.update(peopleTable, people.toMap(),
        where: "$idColumn = ?", whereArgs: [people.id]);
  }

  Future<List> getAllPeople() async {
    Database dbPeople = await db;
    List listMap = await dbPeople.rawQuery("SELECT * FROM $peopleTable");
    List<People> listPeople = List();
    for (Map m in listMap) {
      listPeople.add(People.fromMap(m));
    }
    return listPeople;
  }

  Future<int> getNumber() async {
    Database dbPeople = await db;
    return Sqflite.firstIntValue(
        await dbPeople.rawQuery("SELECT COUNT(*) FROM $peopleTable"));
  }

  Future close() async {
    Database dbPeople = await db;
    dbPeople.close();
  }
}

class People {
  int id;
  String email;
  String senha;

  People();

  People.fromMap(Map map) {
    id = map[idColumn];
    email = map[emailColumn];
    senha = map[senhaColumn];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      emailColumn: email,
      senhaColumn: senha,
    };
    if (id != null) {
      map[idColumn] = id;
    }
    return map;
  }

  @override
  String toString() {
    return "People: $id, Email: $email, Senha: $senha";
  }
}
