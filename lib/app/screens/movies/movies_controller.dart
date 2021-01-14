import 'package:filmespy_flutter/app/models/movie_model.dart';
import 'package:filmespy_flutter/app/services/movie_favorite_service.dart';
import 'package:filmespy_flutter/app/services/movie_service.dart';
import 'package:filmespy_flutter/app/shared/stores/movie_store/movie_store.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'movies_controller.g.dart';

class MoviesController = _MoviesControllerBase with _$MoviesController;

abstract class _MoviesControllerBase with Store {
  _MoviesControllerBase() {
    _getMovies();
  }

  final movieStore = GetIt.I.get<MovieStore>();

  _getMovies() async {
    final movieService = MovieService();
    final movieFavService = MovieFavoriteService();

    await movieService.getMovies().then((List<MovieModel> movies) async {
      for (var i = 0; i < movies.length; i++) {
        if (await movieFavService.checkMovieExists(movies[i])) {
          movies[i].isFavorite = 'true';
        }
      }

      movieStore.listMovies = movies;
    }).catchError((e) => print(e.toString()));
  }
}
