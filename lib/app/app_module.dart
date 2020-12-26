import 'package:filmespy_flutter/app/screens/movies_favorites/movies_favorites_bloc.dart';
import 'package:filmespy_flutter/app/services/movie_favorite_service.dart';
import 'package:filmespy_flutter/app/screens/movies/movies_bloc.dart';
import 'package:filmespy_flutter/app/services/movie_service.dart';
import 'package:filmespy_flutter/app/app_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:filmespy_flutter/app/app_widget.dart';

class AppModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => MoviesFavoritesBloc()),
        Bloc((i) => MoviesBloc()),
        Bloc((i) => AppBloc()),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => MovieFavoriteService()),
        Dependency((i) => MovieService()),
      ];

  @override
  Widget get view => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
