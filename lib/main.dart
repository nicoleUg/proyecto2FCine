
import 'package:flutter/material.dart';
import 'package:pract2/feature/Cine/Infraestructure/routes/app_routes.dart';

void main() {
  runApp(const CinemaApp());
}

class CinemaApp extends StatelessWidget {
  const CinemaApp({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Cine',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.home,
      routes: AppRoutes.getRoutes(),
    );
  }
}
