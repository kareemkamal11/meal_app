import 'package:flutter/material.dart';
import 'package:meal_app/home.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // set  as the colorScheme
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            brightness: Brightness.light,
            seedColor: const Color.fromARGB(255, 132, 0, 51)),
        useMaterial3: true,
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            brightness: Brightness.dark,
            seedColor: const Color.fromARGB(255, 132, 0, 51)),
        useMaterial3: true,
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      // set a dark theme for the app from the colorScheme
      home: const HomeScreen(),
    );
  }
}
