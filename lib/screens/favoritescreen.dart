import 'package:flutter/material.dart';
import 'package:nihfirebase/widgets/post_list.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade100, // Softer background for better readability
      appBar: AppBar(
        backgroundColor: Colors.deepPurple, // Bold color for app bar
        title: const Text(
          'Favorite Menu',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white, // Ensures contrast with background
          ),
        ),
        centerTitle: true, // Centers the title for a more balanced look
        elevation: 5, // Adds a slight shadow for depth
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0), // Adds consistent spacing around the content
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.amber.shade100, Colors.amber.shade300],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: const PostList(), // The main content
      ),
    );
  }
}
