// ignore_for_file: annotate_overrides

import 'package:flutter/material.dart';
import '../../domain/ticket.dart';
import '../../domain/movie.dart';

class BuyTicketScreen extends StatelessWidget {
  final Movie movie;

  const BuyTicketScreen({super.key, required this.movie});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Confirmar Compra')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle_outline,
              size: 80,
              color: Colors.green,
            ),
            const SizedBox(height: 20),
            Text(
              'Película: ${movie.title}',
              style: const TextStyle(fontSize: 20),
            ),
            const Text('Asiento: G4 - Sala 2'),
            const SizedBox(height: 40),
            FilledButton(
              onPressed: () {
               final ticket = Ticket(movieTitle: movie.title, seat: 'G4', price: 10.0, purchasedAt: DateTime.now());
               ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Compra exitosa')),
               );
               Navigator.pop(context, ticket);
              },
              child: const Text('Pagar \$10.00'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Cancelar',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
