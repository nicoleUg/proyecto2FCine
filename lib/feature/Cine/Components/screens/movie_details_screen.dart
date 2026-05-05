
import 'package:flutter/material.dart';
import '../../domain/movie.dart';
import 'buy_ticket_screen.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is! Movie) {
      return Scaffold(
        appBar: AppBar(title: const Text('Detalles')),
        body: const Center(child: Text('Datos de película no disponibles')),
      );
    }
    final Movie movie = args;
    
    return Scaffold(
      appBar: AppBar(title: const Text('Detalles')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Text(
                movie.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                movie.description,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.star, color: Colors.amber),
                  const SizedBox(width: 6),
                  Text(
                    movie.rating.toString(),
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ],
              ),  
            const SizedBox(height: 40),
            ElevatedButton.icon(
              icon: const Icon(Icons.local_activity),
              label: const Text('Comprar Entradas'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BuyTicketScreen(movie: movie),
                  ),
                ).then((buyResult) {
                  if (buyResult != null) {
                    Navigator.pop(context, buyResult);
                  }
                });
              },
            ),
            const SizedBox(height: 20),
            OutlinedButton.icon(
              icon: const Icon(Icons.arrow_back),
              label: const Text('Volver a la cartelera'),
              onPressed: () {
                Navigator.pop(
                  context,
                ); //mandar pop con informacion, es algo que pide el docente
              },
            ),
          ],
        ),
      ),
    );
  }
}
