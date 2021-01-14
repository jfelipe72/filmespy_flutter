import 'package:filmespy_flutter/app/shared/stores/favorite_store/favorite_store.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'movies_favorites_controller.g.dart';

class MoviesFavoritesController = _MoviesFavoritesControllerBase
    with _$MoviesFavoritesController;

abstract class _MoviesFavoritesControllerBase with Store {
  _MoviesFavoritesControllerBase() {
    _getMovies();
  }

  final favoriteStore = GetIt.I.get<FavoriteStore>();

  _getMovies() async {
    await favoriteStore.movieFavService.getFavMovies().then((value) {
      favoriteStore.listMovies = value;
    }).catchError((e) => null);
  }
}
