import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:filmespy_flutter/app/screens/movies/movies_bloc.dart';
import 'package:filmespy_flutter/app/app_module.dart';

void main() {
  initModule(AppModule());
  MoviesBloc bloc;

  // setUp(() {
  //     bloc = AppModule.to.bloc<MoviesBloc>();
  // });

  // group('MoviesBloc Test', () {
  //   test("First Test", () {
  //     expect(bloc, isInstanceOf<MoviesBloc>());
  //   });
  // });
}
