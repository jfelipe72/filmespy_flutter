import 'package:filmespy_flutter/app/shared/tiles/movie_tile.dart';
import 'package:filmespy_flutter/app/screens/movies/movies_controller.dart';
import 'package:filmespy_flutter/app/shared/body_background.dart';
import 'package:filmespy_flutter/app/shared/progress_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({Key key}) : super(key: key);

  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  final moviesController = MoviesController();

  @override
  Widget build(BuildContext context) {
    return BodyBackground(
      child: Observer(
        builder: (_) {
          if (moviesController.movieStore.listMovies == null)
            return ProgressIndicatorWidget();
          else if (moviesController.movieStore.listMovies.isNotEmpty)
            return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: moviesController.movieStore.listMovies.length,
              itemBuilder: (BuildContext context, int index) {
                return MovieTile(
                    movieModel: moviesController.movieStore.listMovies[index]);
              },
            );
          else
            return Center(child: Text('Nenhum filme encontrado'));
        },
      ),
    );
  }
}
