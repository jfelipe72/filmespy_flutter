import 'dart:convert';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:http/http.dart' as http;
import 'package:filmespy_flutter/app/models/movie_model.dart';

class MovieService extends Disposable {
  Future<List<MovieModel>> getMovies() async {
    try {
      const String url = 'https://filmespy.herokuapp.com/api/v1/filmes';

      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);

        List<dynamic> body = json["filmes"];

        List<MovieModel> movieModel =
            body.map<MovieModel>((item) => MovieModel.fromJson(item)).toList();

        return movieModel;
      } else {
        throw "Request Error";
      }
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  @override
  void dispose() {}
}
