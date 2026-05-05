import 'package:flutter/material.dart';
import '../../domain/movie.dart';
import '../../domain/ticket.dart';
import '../../Infraestructure/routes/app_routes.dart';
import 'my_tickets_screen.dart';

class MoviesListScreen extends StatefulWidget {
  const MoviesListScreen({super.key});

  @override
  State<MoviesListScreen> createState() => _MoviesListScreenState();
}

class _MoviesListScreenState extends State<MoviesListScreen> {
  final List<Movie> movies = const [
    Movie(
      title: 'Dune: Parte Dos',
      description: 'historia de ciencia ficción',
      rating: 8.5,
    ),
    Movie(
      title: 'Oppenheimer',
      description: ' historia del físico J. Robert Oppenheimer',
      rating: 8.0,
    ),
    Movie(
      title: 'Interstellar',
      description: 'viaje a través del espacio y el tiempo',
      rating: 8.7,
    ),
  ];

  final List<Ticket> _tickets = [];

  Future<void> _openTicketsScreen() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => MyTicketsScreen(tickets: _tickets)),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cartelera de Cine'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.confirmation_num),
            onPressed: _openTicketsScreen,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return ListTile(
            leading: const Icon(Icons.movie),
            title: Text(movie.title),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () async {
              final result = await Navigator.pushNamed(
                context,
                AppRoutes.details,
                arguments: movie,
              );

              if (result is Ticket) {
                setState(() {
                  _tickets.add(result);
                });

                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Ticket guardado para ${result.movieTitle}',
                      ),
                      action: SnackBarAction(
                        label: 'Ver tickets',
                        onPressed: _openTicketsScreen,
                      ),
                    ),
                  );
                }
              }
            },
          );
        },
      ),
    );
  }
}
