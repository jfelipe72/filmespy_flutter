import 'package:filmespy_flutter/app/app_module.dart';
import 'package:filmespy_flutter/app/models/movie_model.dart';
import 'package:filmespy_flutter/app/screens/movies_details/movies_details_page.dart';
import 'package:filmespy_flutter/app/screens/movies_favorites/movies_favorites_bloc.dart';
import 'package:filmespy_flutter/app/shared/constants.dart';
import 'package:filmespy_flutter/app/shared/favorite_button_widget.dart';
import 'package:filmespy_flutter/app/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:progressive_image/progressive_image.dart';

class MovieTile extends StatefulWidget {
  final MovieModel movieModel;

  const MovieTile({
    @required this.movieModel,
  });

  @override
  _MovieTileState createState() => _MovieTileState();
}

class _MovieTileState extends State<MovieTile> {
  MoviesFavoritesBloc _moviesFavBloc;

  @override
  void initState() {
    _moviesFavBloc = AppModule.to.getBloc<MoviesFavoritesBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final movieModel = widget.movieModel;

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        openPage(
          context,
          MoviesDetailsPage(movieModel: movieModel),
        );
      },
      child: Stack(
        children: [
          Card(
            color: Colors.transparent,
            child: Container(
              height: height * 20 / 100,
              child: Row(
                children: [
                  Container(
                    width: width * 30 / 100,
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      child: ProgressiveImage(
                        placeholder: AssetImage(IMG_BACKGROUND),
                        thumbnail: NetworkImage(movieModel.poster),
                        image: NetworkImage(movieModel.poster),
                        height: height,
                        width: width,
                        fit: BoxFit.cover,
                        fadeDuration: Duration(seconds: 3),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: width * 60 / 100,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RichText(
                              maxLines: 7,
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: movieModel.titulo + '\n',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  TextSpan(text: movieModel.genero + '\n\n'),
                                  TextSpan(text: movieModel.sinopse),
                                ],
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.white70,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
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
    );
  }
}
