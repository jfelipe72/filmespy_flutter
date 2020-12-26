import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class FavoriteButtonWidget extends StatefulWidget {
  final bool isFavorite;
  final Function(bool) onTap;

  FavoriteButtonWidget({@required this.isFavorite, @required this.onTap});

  @override
  FavoriteButtonWidgetState createState() => FavoriteButtonWidgetState();
}

class FavoriteButtonWidgetState extends State<FavoriteButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return LikeButton(
      isLiked: widget.isFavorite,
      circleColor: CircleColor(
        start: Colors.white,
        end: Colors.redAccent,
      ),
      bubblesColor: BubblesColor(
        dotPrimaryColor: Colors.white,
        dotSecondaryColor: Colors.redAccent,
      ),
      likeBuilder: (bool isLiked) {
        return Icon(
          (isLiked) ? Icons.favorite : Icons.favorite_border,
          color: (isLiked) ? Colors.redAccent : Colors.grey,
        );
      },
      onTap: widget.onTap,
    );
  }
}
