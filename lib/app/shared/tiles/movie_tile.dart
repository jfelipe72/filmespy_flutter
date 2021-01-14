import 'package:filmespy_flutter/app/models/movie_model.dart';
import 'package:filmespy_flutter/app/screens/movies_details/movies_details_page.dart';
import 'package:filmespy_flutter/app/shared/constants.dart';
import 'package:filmespy_flutter/app/shared/favorite_button_widget.dart';
import 'package:filmespy_flutter/app/shared/stores/favorite_store/favorite_store.dart';
import 'package:filmespy_flutter/app/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:progressive_image/progressive_image.dart';

class MovieTile extends StatefulWidget {
  final MovieModel movieModel;

  const MovieTile({Key key, this.movieModel}) : super(key: key);

  @override
  _MovieTileState createState() => _MovieTileState();
}

class _MovieTileState extends State<MovieTile> {
  final favoriteStore = GetIt.I.get<FavoriteStore>();

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
              isFavorite: favoriteStore.isFavorite(movieModel),
              onTap: (bool isFavorite) async {
                if (isFavorite)
                  favoriteStore.removeFavMovie(movieModel);
                else
                  return favoriteStore.addFavMovie(movieModel);

                return !isFavorite;
              },
            ),
          ),
        ],
      ),
    );
  }
}
