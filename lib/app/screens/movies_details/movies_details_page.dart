import 'package:filmespy_flutter/app/app_module.dart';
import 'package:filmespy_flutter/app/models/movie_model.dart';
import 'package:filmespy_flutter/app/screens/movies_favorites/movies_favorites_bloc.dart';
import 'package:filmespy_flutter/app/shared/body_background.dart';
import 'package:filmespy_flutter/app/shared/favorite_button_widget.dart';
import 'package:flutter/material.dart';

class MoviesDetailsPage extends StatefulWidget {
  final MovieModel movieModel;

  const MoviesDetailsPage({
    Key key,
    @required this.movieModel,
  }) : super(key: key);

  @override
  _MoviesDetailsPageState createState() => _MoviesDetailsPageState();
}

class _MoviesDetailsPageState extends State<MoviesDetailsPage> {
  MoviesFavoritesBloc _moviesFavBloc;

  @override
  void initState() {
    _moviesFavBloc = AppModule.to.getBloc<MoviesFavoritesBloc>();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    final MovieModel movieModel = widget.movieModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(movieModel.titulo),
      ),
      body: BodyBackground(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: height * 60 / 100,
                child: Image.network(
                  movieModel.poster,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: resume(
                            title: 'TÍTULO ORIGINAL',
                            subtitle: movieModel.titulo,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: FavoriteButtonWidget(
                            isFavorite: _moviesFavBloc.isFavorite(movieModel),
                            onTap: (bool isFavorite) async {
                              if (isFavorite)
                                _moviesFavBloc.removeFavMovie(movieModel);
                              else
                                return _moviesFavBloc.addFavMovie(movieModel);

                              return !isFavorite;
                            },
                          ),
                        ),
                      ],
                    ),
                    resume(
                      title: 'GÊNERO',
                      subtitle: movieModel.genero,
                    ),
                    resume(
                      title: 'DATA DE LANÇAMENTO',
                      subtitle: movieModel.data,
                    ),
                    resume(
                      title: 'SINOPSE',
                      subtitle: movieModel.sinopseFull,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget resume({@required String title, @required String subtitle}) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }
}
