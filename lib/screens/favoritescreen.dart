import 'package:flutter/material.dart';
import 'package:nihfirebase/widgets/post_list.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo'),
      ),
      body: const PostList(),
    );
  }
}
