import 'package:filmespy_flutter/app/shared/tiles/movie_tile.dart';
import 'package:filmespy_flutter/app/screens/movies_favorites/movies_favorites_controller.dart';
import 'package:filmespy_flutter/app/shared/body_background.dart';
import 'package:filmespy_flutter/app/shared/progress_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class MoviesFavoritesPage extends StatefulWidget {
  final String title;
  const MoviesFavoritesPage({Key key, this.title = "Favoritos"})
      : super(key: key);

  @override
  _MoviesFavoritesPageState createState() => _MoviesFavoritesPageState();
}

class _MoviesFavoritesPageState extends State<MoviesFavoritesPage> {
  MoviesFavoritesController _moviesFavController = MoviesFavoritesController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BodyBackground(
        child: Observer(
          builder: (_) {
            if (_moviesFavController.favoriteStore.listMovies == null)
              return ProgressIndicatorWidget();
            else if (_moviesFavController.favoriteStore.listMovies.isNotEmpty)
              return ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: _moviesFavController.favoriteStore.listMovies.length,
                itemBuilder: (BuildContext context, int index) {
                  return MovieTile(
                      movieModel:
                          _moviesFavController.favoriteStore.listMovies[index]);
                },
              );
            else
              return Center(
                child: Text('Ainda não há nenhum filme favorito'),
              );
          },
        ),
      ),
    );
  }
}
