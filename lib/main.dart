import 'package:flutter/material.dart';
import 'package:test_pancakeswap_app/features/token_selection/presentation/presentation/token_selection_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tokens course demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.teal.withOpacity(0.1)
      ),
      home: const TokenSelectionPage(),
    );
  }
}
