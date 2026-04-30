import 'package:flutter/material.dart';
import 'package:pract2/feature/Cine/Components/screens/movie_list_screen.dart';
import 'package:pract2/feature/Cine/Components/screens/movie_details_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String details = '/details';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      home: (context) => const MoviesListScreen(),
      details: (context) => const MovieDetailsScreen(),
    };
  }
}
