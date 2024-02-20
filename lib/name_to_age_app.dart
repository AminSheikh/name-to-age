import 'package:flutter/material.dart';
import 'package:name_to_age/screens/main/widgets/main_screen.dart';

class NameToAgeApp extends StatelessWidget {
  const NameToAgeApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Name to Age',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.grey,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}
