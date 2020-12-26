import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CollectionSlideTransition(
        children: <Widget>[
          icon(),
          icon(),
          icon(),
        ],
      ),
    );
  }

  Widget icon() {
    return Icon(Icons.videocam_rounded, size: 34);
  }
}
