import 'package:flutter/material.dart';
import 'package:loader_simples/loader_display.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loader Simples',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoaderDisplay(),
    );
  }
}
