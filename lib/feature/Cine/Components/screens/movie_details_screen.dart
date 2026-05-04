// ignore_for_file: annotate_overrides

import 'package:flutter/material.dart';
import '../../domain/movie.dart';
import 'buy_ticket_screen.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;

    return Scaffold(
      appBar: AppBar(title: const Text('Detalles')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              movie.title,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
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
                );
              },
            ),
            const SizedBox(height: 20),
            OutlinedButton.icon(
              icon: const Icon(Icons.arrow_back),
              label: const Text('Volver a la cartelera'),
              onPressed: () {
                Navigator.pop(context);//mandar pop con informacion, es algo que pide el docente 
              },
            ),
          ],
        ),
      ),
    );
  }
}
