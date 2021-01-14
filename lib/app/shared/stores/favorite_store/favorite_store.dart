import 'package:filmespy_flutter/app/models/movie_model.dart';
import 'package:filmespy_flutter/app/services/movie_favorite_service.dart';
import 'package:filmespy_flutter/app/shared/stores/movie_store/movie_store.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'favorite_store.g.dart';

class FavoriteStore = _FavoriteStoreBase with _$FavoriteStore;

abstract class _FavoriteStoreBase with Store {
  @observable
  List<MovieModel> listMovies;

  final movieStore = GetIt.I.get<MovieStore>();
  final movieFavService = MovieFavoriteService();

  @action
  Future<bool> addFavMovie(MovieModel movie) async {
    movie.isFavorite = 'true';
    if (await movieFavService.add(movie)) {
      for (MovieModel element in movieStore.listMovies) {
        if (element.link == movie.link) element.isFavorite = 'true';
      }

      changeLists();

      return true;
    } else
      movie.isFavorite = 'false';

    return false;
  }

  @action
  Future<bool> removeFavMovie(MovieModel movie) async {
    if (await movieFavService.remove(movie)) {
      for (MovieModel element in movieStore.listMovies) {
        if (element.link == movie.link) element.isFavorite = 'false';
      }

      changeLists();

      return true;
    } else
      movie.isFavorite = 'true';

    return false;
  }

  @action
  changeLists() {
    movieStore.listMovies = movieStore.listMovies;
    listMovies = movieStore.listMovies
        .where((element) => element.isFavorite == 'true')
        .toList();
  }

  bool isFavorite(MovieModel movie) {
    if (movie.isFavorite == 'true') return true;

    return false;
  }
}
