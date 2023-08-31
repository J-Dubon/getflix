import 'package:flutter/material.dart';
import 'package:getflix/core/theme/main_theme.dart';
import 'package:getflix/features/movies/presentation/screen/movies_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: MainTheme.getTheme(),
      home: const MoviesScreen(),
    );
  }
}