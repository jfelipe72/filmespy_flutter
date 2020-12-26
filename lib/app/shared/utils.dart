import 'package:flutter/material.dart';

openPage(BuildContext context, Widget page) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
}

closePage(BuildContext context) {
  Navigator.of(context).pop();
}
