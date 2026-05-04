import 'package:flutter/material.dart';
import '../../domain/movie.dart';
import '../../Infraestructure/routes/app_routes.dart';

class MoviesListScreen extends StatelessWidget {
  const MoviesListScreen({super.key});

  final List<Movie> movies = const [
    Movie(title: 'Dune: Parte Dos', description: 'Una épica historia de ciencia ficción', rating: 8.5),
    Movie(title: 'Oppenheimer', description: 'La historia del físico J. Robert Oppenheimer', rating: 8.0),
    Movie(title: 'Interstellar', description: 'Un viaje a través del espacio y el tiempo', rating: 8.7),
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