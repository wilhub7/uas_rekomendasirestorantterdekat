import 'package:flutter/material.dart';
import 'package:nihfirebase/widgets/post_list.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: const Text('Favorite Menu'),
      ),
      body: const PostList(),
    );
  }
}
