import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './screens/calcutator_screen.dart';
import 'screens/calcutator_screen.dart';
import './providers/element_provider.dart';

final sumProvider =
    StateProvider((ref) => ElementProvider().getlistElements[0].cost);
final stateProvider =
    ChangeNotifierProvider<ElementProvider>((ref) => ElementProvider());

void main() {
  runApp(
    const ProviderScope(
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
        fontFamily: 'Steppe',
        primaryColor: const Color(0xFF1E6FFF),
      ),
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}
