import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './screens/calcutator_screen.dart';
import 'screens/calcutator_screen.dart';

final sumProvider = StateProvider<int>((_) => 5000);
void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color(0xFF1E6FFF),
      ),
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}
