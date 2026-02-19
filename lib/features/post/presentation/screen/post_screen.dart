import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/post_provider.dart';




class PostScreen extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final postAsync = ref.watch(postProvider);


    return Scaffold(

      appBar: AppBar(title: Text("Posts")),

      body: postAsync.when(

        loading: () => CircularProgressIndicator(),

        error: (e, s) => Text("Error: $e"),

        data: (posts){

          return ListView.builder(

            itemCount: posts.length,

            itemBuilder: (context, index){

              final post = posts[index];

              return ListTile(

                title: Text(post.title),

                subtitle: Text(post.body),

              );

            },

          );

        },

      ),

    );

  }

}
