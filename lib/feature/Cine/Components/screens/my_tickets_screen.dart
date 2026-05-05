import 'package:flutter/material.dart';
import '../../domain/ticket.dart';

class MyTicketsScreen extends StatelessWidget {
  final List<Ticket> tickets;

  const MyTicketsScreen({super.key, required this.tickets});

  String _formatDateTime(DateTime dateTime) {
    final local = dateTime.toLocal();
    return '${local.day}/${local.month}/${local.year} ${local.hour}:${local.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mis Tickets')),
      body: tickets.isEmpty
          ? const Center(child: Text('No tienes tickets comprados todavía.'))
          : ListView.builder(
              itemCount: tickets.length,
              itemBuilder: (context, index) {
                final ticket = tickets[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.confirmation_num),
                    title: Text(ticket.movieTitle),
                    subtitle: Text(
                      'Asiento: ${ticket.seat}\nComprado: ${_formatDateTime(ticket.purchasedAt)}',
                    ),
                    trailing: Text('\$${ticket.price.toStringAsFixed(2)}'),
                  ),
                );
              },
            ),
    );
  }
}
