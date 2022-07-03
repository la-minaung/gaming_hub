import 'package:flutter/material.dart';

extension NavigationUtility on Widget {
  void navigateToScreen(BuildContext context, Widget nextScreen) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => nextScreen));
  }
}
