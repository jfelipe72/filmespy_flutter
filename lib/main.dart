import 'package:filmespy_flutter/app/app_widget.dart';
import 'package:filmespy_flutter/app/shared/stores/favorite_store/favorite_store.dart';
import 'package:filmespy_flutter/app/shared/stores/movie_store/movie_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt getIt = GetIt.I;
  getIt.registerSingleton<MovieStore>(MovieStore());
  getIt.registerSingleton<FavoriteStore>(FavoriteStore());
  runApp(AppWidget());
}
