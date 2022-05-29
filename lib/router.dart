import 'package:flutter/widgets.dart';

class Routes {
  static String homeScreen = 'homeScreen';
  static String detailsScreen = 'detailsScreen';
}

class Router {
  Future<void> toDetailsScreen(BuildContext context, String url) {
    return Navigator.pushNamed(context, Routes.detailsScreen, arguments: [url]);
  }
}

Router router = Router();
