import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

final String moviesTable = "moviesTable";
final String idColumn = "idColumn";
final String imgColumn = "ImageColumn";
final String nameColumn = "NameColumn";
final String dateColumn = "DateColumn";
final String timeColumn = "TimeColumn";
final String generoColumn = "GeneroColumn";
final String directorColumn = "DirectorColumn";
final String elencoColumn = "ElencoColumn";
final String sinopseColumn = "SinopseColumn";

class MoviesHelper {
  static final MoviesHelper _instance = MoviesHelper.internal();

  factory MoviesHelper() => _instance;

  MoviesHelper.internal();

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
    final path = join(databasePath, "movies2.db");

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
      await db.execute(
          "CREAT TABLE $moviesTable($idColumn INTEGER PRIMARY KEY,$imgColumn TEXT $nameColumn TEXT, $dateColumn TEXT, $timeColumn TEXT,"
          "$generoColumn TEXT, $directorColumn TEXT, $elencoColumn TEXT, $sinopseColumn TEXT)");
    });
  }

  Future<Movies> saveMovies(Movies movies) async {
    Database dbMovies = await db;
    movies.id = await dbMovies.insert(moviesTable, movies.toMap());
    return movies;
  }

  Future<Movies> getMovies(int id) async {
    Database dbMovies = await db;
    List<Map> maps = await dbMovies.query(moviesTable,
        columns: [
          idColumn,
          imgColumn,
          nameColumn,
          dateColumn,
          timeColumn,
          generoColumn,
          directorColumn,
          elencoColumn,
          sinopseColumn
        ],
        where: "$idColumn = ?",
        whereArgs: [id]);
    if (maps.length > 0) {
      return Movies.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int> deleteMovies(int id) async {
    Database dbMovies = await db;
    await dbMovies.delete(moviesTable, where: "$idColumn = ?", whereArgs: [id]);
  }

  Future<int> updateMovies(Movies movies) async {
    Database dbMovies = await db;
    dbMovies.update(moviesTable, movies.toMap(),
        where: "$idColumn = ?", whereArgs: [movies.id]);
  }

  Future<List> getAllMovies() async {
    Database dbMovies = await db;
    List listMap = await dbMovies.rawQuery("SELECT * FROM $moviesTable");
    List<Movies> listMovies = List();
    for (Map m in listMap) {
      listMovies.add(Movies.fromMap(m));
    }
    return listMovies;
  }

  Future<int> getNumber() async {
    Database dbMovies = await db;
    return Sqflite.firstIntValue(
        await dbMovies.rawQuery("SELECT COUNT(*) FROM $moviesTable"));
  }

  Future close() async {
    Database dbMovies = await db;
    dbMovies.close();
  }
}

class Movies {
  int id;
  String img;
  String name;
  String date;
  String time;
  String genero;
  String director;
  String elenco;
  String sinopse;

  Movies.fromMap(Map map) {
    id = map[idColumn];
    img = map[imgColumn];
    name = map[nameColumn];
    date = map[dateColumn];
    time = map[timeColumn];
    genero = map[generoColumn];
    director = map[directorColumn];
    elenco = map[elencoColumn];
    sinopse = map[sinopseColumn];
  }
  Map toMap() {
    Map<String, dynamic> map = {
      imgColumn: img,
      nameColumn: name,
      dateColumn: date,
      timeColumn: time,
      generoColumn: genero,
      directorColumn: director,
      elencoColumn: elenco,
      sinopseColumn: sinopse,
    };
    if (id != null) {
      map[idColumn] = id;
    }
    return map;
  }

  @override
  String toString() {
    return "Movies: $id, Nome: $name, Data: $date, Tempo de duração: $time, Genero: $genero,"
        " Diretor: $director, Elenco: $elenco, Sinopse: $sinopse";
  }
}
