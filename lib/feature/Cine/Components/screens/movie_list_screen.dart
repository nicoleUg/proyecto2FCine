import 'package:flutter/material.dart';
import '../../domain/movie.dart';
import '../../Infraestructure/routes/app_routes.dart';

class MoviesListScreen extends StatelessWidget {
  const MoviesListScreen({super.key});

  final List<Movie> movies = const [
    Movie(title: 'Dune: Parte Dos'),
    Movie(title: 'Oppenheimer'),
    Movie(title: 'Interstellar'),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cartelera de Cine'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return ListTile(
            leading: const Icon(Icons.movie),
            title: Text(movie.title),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRoutes.details,
                arguments: movie, 
              );
            },
          );
        },
      ),
    );
  }
}