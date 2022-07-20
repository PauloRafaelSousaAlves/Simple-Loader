import 'package:flutter/material.dart';
import 'package:loader_simples/loader.dart';

class LoaderDisplay extends StatelessWidget {
  const LoaderDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[700],
        title: const Text(
          'Simple Loader',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.grey[350],
        child: const Loader(),
      ),
    );
  }
}
