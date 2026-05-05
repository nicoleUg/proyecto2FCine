
import 'package:flutter/material.dart';
import 'feature/Cine/Infraestructure/routes/app_routes.dart';

void main() {
  runApp(const CinemaApp());
}

class CinemaApp extends StatelessWidget {
  const CinemaApp({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Cine',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 174, 36, 36)),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.home,
      routes: AppRoutes.getRoutes(),
    );
  }
}
