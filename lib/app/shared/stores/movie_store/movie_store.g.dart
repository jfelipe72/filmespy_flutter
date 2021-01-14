// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MovieStore on _MovieStoreBase, Store {
  final _$listMoviesAtom = Atom(name: '_MovieStoreBase.listMovies');

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

  @override
  String toString() {
    return '''
listMovies: ${listMovies}
    ''';
  }
}
