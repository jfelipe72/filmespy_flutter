import 'package:filmespy_flutter/app/models/movie_model.dart';
import 'package:mobx/mobx.dart';

part 'movie_store.g.dart';

class MovieStore = _MovieStoreBase with _$MovieStore;

abstract class _MovieStoreBase with Store {
  @observable
  List<MovieModel> listMovies;
}
