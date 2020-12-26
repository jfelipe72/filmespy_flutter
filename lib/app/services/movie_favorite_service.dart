import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:filmespy_flutter/app/models/movie_model.dart';
import 'package:filmespy_flutter/app/shared/constants.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MovieFavoriteService extends Disposable {
  MovieFavoriteService() {
    _initDB();
  }

  Future<Database> _initDB() async {
    return openDatabase(
      join(await getDatabasesPath(), DB_MOVIES),
      onCreate: (db, version) {
        return db.execute(CREATE_TB_FAV_MOVIES);
      },
      version: 1,
    );
  }

  Future<List<MovieModel>> getFavMovies() async {
    try {
      final Database db = await _initDB();
      final List<Map<String, dynamic>> maps = await db.query(TB_FAV_MOVIES);

      return List.generate(
        maps.length,
        (i) {
          return MovieModel.fromJson(maps[i]);
        },
      );
    } catch (ex) {
      print(ex);
      return new List<MovieModel>();
    }
  }

  Future<bool> add(MovieModel movie) async {
    try {
      final Database db = await _initDB();

      final List<Map<String, dynamic>> map = await db.query(TB_FAV_MOVIES);

      if (!await checkMovieExists(movie)) if (map.length < 3) {
        await db.insert(TB_FAV_MOVIES, movie.toJson());
        return true;
      }

      return false;
    } catch (ex) {
      print(ex);
      return false;
    }
  }

  Future<bool> remove(MovieModel movie) async {
    final Database db = await _initDB();
    await db.delete(
      TB_FAV_MOVIES,
      where: "link = ?",
      whereArgs: [movie.link],
    );
    return true;
  }

  Future<bool> clearFavMovies() async {
    final Database db = await _initDB();
    await db.delete(TB_FAV_MOVIES);
    return true;
  }

  Future<bool> checkMovieExists(MovieModel movie) async {
    try {
      final Database db = await _initDB();
      final List<Map<String, dynamic>> maps =
          await db.query(TB_FAV_MOVIES, where: "link = '${movie.link}'");

      if (maps.length > 0) {
        return true;
      }

      return false;
    } catch (ex) {
      print(ex);
      return false;
    }
  }

  @override
  void dispose() {}
}
