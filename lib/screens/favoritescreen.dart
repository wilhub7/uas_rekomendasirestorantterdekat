import 'package:flutter/material.dart';

class Favoritescreen extends StatelessWidget {
  const Favoritescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Center(child: const Text('open now')),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
        ],
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: List.generate(
          10,
          (index) => Container(
            width: 200,
            height: 200,
            color: Colors.blueGrey,
            margin: const EdgeInsets.all(10),
          ),
        ),
      ),
    );
  }
}
