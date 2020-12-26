import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:filmespy_flutter/app/models/movie_model.dart';
import 'package:filmespy_flutter/app/services/movie_favorite_service.dart';
import 'package:filmespy_flutter/app/services/movie_service.dart';
import 'package:rxdart/rxdart.dart';

class MoviesBloc extends BlocBase {
  final _moviesController = BehaviorSubject<List<MovieModel>>();
  Stream<List<MovieModel>> get outMovies => _moviesController.stream;
  Function(List<MovieModel>) get changeMovies => _moviesController.sink.add;

  List<MovieModel> listMovieModel = [];

  Future<void> getMovies() async {
    final movieService = MovieService();
    final movieFavService = MovieFavoriteService();

    await movieService.getMovies().then((List<MovieModel> movie) async {
      for (var i = 0; i < movie.length; i++) {
        if (await movieFavService.checkMovieExists(movie[i])) {
          movie[i].isFavorite = 'true';
        }
      }
      listMovieModel = movie;
      changeMovies(movie);
    }).catchError((e) => null);

    movieService.dispose();
  }

  @override
  void dispose() {
    _moviesController.close();
    super.dispose();
  }
}
