import 'package:filmespy_flutter/app/app_module.dart';
import 'package:filmespy_flutter/app/models/movie_model.dart';
import 'package:filmespy_flutter/app/screens/movies/movie_tile.dart';
import 'package:filmespy_flutter/app/screens/movies/movies_bloc.dart';
import 'package:filmespy_flutter/app/shared/body_background.dart';
import 'package:filmespy_flutter/app/shared/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({Key key}) : super(key: key);

  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  MoviesBloc _moviesBloc;

  @override
  void initState() {
    _moviesBloc = AppModule.to.getBloc<MoviesBloc>();

    _moviesBloc.getMovies();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BodyBackground(
      child: StreamBuilder<List<MovieModel>>(
        stream: _moviesBloc.outMovies,
        builder:
            (BuildContext context, AsyncSnapshot<List<MovieModel>> snapshot) {
          if (!snapshot.hasData)
            return ProgressIndicatorWidget();
          else
            return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return MovieTile(movieModel: snapshot.data[index]);
              },
            );
        },
      ),
    );
  }
}
