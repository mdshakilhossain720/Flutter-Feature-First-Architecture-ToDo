import 'package:flutter/material.dart';

import 'widgets/post_widgets.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Posts"), centerTitle: true),
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          //final post = posts[index];

          return PostCard(
            userId: index + 1,
            id: index + 1,
            title: "Post Title $index",
            body: "This is the body of post number $index.",
          );
        },
      ),
    );
  }
}
