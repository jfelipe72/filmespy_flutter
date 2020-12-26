import 'package:filmespy_flutter/app/shared/constants.dart';
import 'package:flutter/material.dart';

class BodyBackground extends StatelessWidget {
  final Widget child;

  BodyBackground({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(IMG_BACKGROUND),
              fit: BoxFit.fill,
            ),
          ),
        ),
        this.child,
      ],
    );
  }
}
