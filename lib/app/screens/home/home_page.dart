import 'package:filmespy_flutter/app/screens/movies/movies_page.dart';
import 'package:filmespy_flutter/app/screens/movies_favorites/movies_favorites_page.dart';
import 'package:filmespy_flutter/app/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "FilmesPY"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Shimmer.fromColors(
          baseColor: Colors.white,
          highlightColor: Colors.white12,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.local_movies_rounded, size: 24),
              SizedBox(width: 10),
              Text(widget.title),
              SizedBox(width: 10),
              Icon(Icons.local_movies_rounded, size: 24),
            ],
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: Colors.redAccent,
            ),
            onPressed: () {
              openPage(context, MoviesFavoritesPage());
            },
          )
        ],
      ),
      body: MoviesPage(),
    );
  }
}
