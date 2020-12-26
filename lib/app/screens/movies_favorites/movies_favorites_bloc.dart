import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:filmespy_flutter/app/app_module.dart';
import 'package:filmespy_flutter/app/models/movie_model.dart';
import 'package:filmespy_flutter/app/screens/movies/movies_bloc.dart';
import 'package:filmespy_flutter/app/services/movie_favorite_service.dart';
import 'package:rxdart/rxdart.dart';

class MoviesFavoritesBloc extends BlocBase {
  final _moviesController = BehaviorSubject<List<MovieModel>>();
  Stream<List<MovieModel>> get outMovies => _moviesController.stream;
  Function(List<MovieModel>) get changeMovies => _moviesController.sink.add;

  final _isFavoriteController = BehaviorSubject<bool>();
  Stream<bool> get outIsFavorite => _isFavoriteController.stream;
  Function(bool) get changeIsFavorite => _isFavoriteController.sink.add;

  final _movieFavService = MovieFavoriteService();

  final _moviesBloc = AppModule.to.getBloc<MoviesBloc>();

  Future<void> getMovies() async {
    await _movieFavService.getFavMovies().then((value) {
      changeMovies(value);
    }).catchError((e) => null);

    _movieFavService.dispose();
  }

  Future<bool> addFavMovie(MovieModel movie) async {
    movie.isFavorite = 'true';
    if (await _movieFavService.add(movie)) {
      await getMovies();

      for (MovieModel element in _moviesBloc.listMovieModel) {
        if (element.link == movie.link) element.isFavorite = 'true';
      }

      await _moviesBloc.changeMovies(_moviesBloc.listMovieModel);

      return true;
    } else
      movie.isFavorite = 'false';

    return false;
  }

  Future<bool> removeFavMovie(MovieModel movie) async {
    await _movieFavService.remove(movie);

    await getMovies();

    for (MovieModel element in _moviesBloc.listMovieModel) {
      if (element.link == movie.link) element.isFavorite = 'false';
    }

    await _moviesBloc.changeMovies(_moviesBloc.listMovieModel);

    return true;
  }

  bool isFavorite(MovieModel movie) {
    if (movie.isFavorite == 'true') return true;

    return false;
  }

  @override
  void dispose() {
    _moviesController.close();
    _isFavoriteController.close();
    _movieFavService.dispose();
    super.dispose();
  }
}
