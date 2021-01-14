import 'package:filmespy_flutter/app/shared/stores/favorite_store/favorite_store.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'movies_details_controller.g.dart';

class MovieDetailscontroller = _MovieDetailscontrollerBase
    with _$MovieDetailscontroller;

abstract class _MovieDetailscontrollerBase with Store {
  final favoriteStore = GetIt.I.get<FavoriteStore>();
}
