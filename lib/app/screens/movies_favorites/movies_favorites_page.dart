import 'package:filmespy_flutter/app/app_module.dart';
import 'package:filmespy_flutter/app/models/movie_model.dart';
import 'package:filmespy_flutter/app/screens/movies/movie_tile.dart';
import 'package:filmespy_flutter/app/screens/movies_favorites/movies_favorites_bloc.dart';
import 'package:filmespy_flutter/app/shared/body_background.dart';
import 'package:filmespy_flutter/app/shared/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class MoviesFavoritesPage extends StatefulWidget {
  final String title;
  const MoviesFavoritesPage({Key key, this.title = "Favoritos"})
      : super(key: key);

  @override
  _MoviesFavoritesPageState createState() => _MoviesFavoritesPageState();
}

class _MoviesFavoritesPageState extends State<MoviesFavoritesPage> {
  MoviesFavoritesBloc _moviesFavBloc;

  @override
  void initState() {
    _moviesFavBloc = AppModule.to.getBloc<MoviesFavoritesBloc>();

    _moviesFavBloc.getMovies();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BodyBackground(
        child: StreamBuilder<List<MovieModel>>(
          stream: _moviesFavBloc.outMovies,
          builder:
              (BuildContext context, AsyncSnapshot<List<MovieModel>> snapshot) {
            if (!snapshot.hasData)
              return ProgressIndicatorWidget();
            else if (snapshot.data.length == 0)
              return Center(
                child: Text('Ainda não há nenhum filme favorito'),
              );
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
      ),
    );
  }
}
