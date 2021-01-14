// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FavoriteStore on _FavoriteStoreBase, Store {
  final _$listMoviesAtom = Atom(name: '_FavoriteStoreBase.listMovies');

  @override
  List<MovieModel> get listMovies {
    _$listMoviesAtom.reportRead();
    return super.listMovies;
  }

  @override
  set listMovies(List<MovieModel> value) {
    _$listMoviesAtom.reportWrite(value, super.listMovies, () {
      super.listMovies = value;
    });
  }

  final _$addFavMovieAsyncAction =
      AsyncAction('_FavoriteStoreBase.addFavMovie');

  @override
  Future<bool> addFavMovie(MovieModel movie) {
    return _$addFavMovieAsyncAction.run(() => super.addFavMovie(movie));
  }

  final _$removeFavMovieAsyncAction =
      AsyncAction('_FavoriteStoreBase.removeFavMovie');

  @override
  Future<bool> removeFavMovie(MovieModel movie) {
    return _$removeFavMovieAsyncAction.run(() => super.removeFavMovie(movie));
  }

  final _$_FavoriteStoreBaseActionController =
      ActionController(name: '_FavoriteStoreBase');

  @override
  dynamic changeLists() {
    final _$actionInfo = _$_FavoriteStoreBaseActionController.startAction(
        name: '_FavoriteStoreBase.changeLists');
    try {
      return super.changeLists();
    } finally {
      _$_FavoriteStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listMovies: ${listMovies}
    ''';
  }
}
