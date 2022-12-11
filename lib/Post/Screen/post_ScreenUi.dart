import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobgrocery/Post/Entity/postStore.dart';
import 'package:mobgrocery/Post/Screen/reusable.dart';
import 'package:mobgrocery/Post/request/post.dart';
import 'package:mobx/mobx.dart';

class PostScreen extends StatelessWidget {
//   PostStore postStore = PostStore();
//   PostScreen() {

//     postStore.getThePost();
//     postStore.fetchPosts();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final future = postStore.postListFuture;
//     return Observer(builder: (_) {
//       switch (future.status) {
//         case FutureStatus.pending:
//           return Center(
//             child: CircularProgressIndicator(),
//           );

//         case FutureStatus.rejected:
//           return Center(child: Text("The api loading failed"));

//         case FutureStatus.fulfilled:
//           final List<Post> posts = future.result;
//           print(posts);
//           return RefreshIndicator(
//             onRefresh: _refresh,
//             child: ListView.builder(
//                 itemCount: posts.length,
//                 itemBuilder: (context, index) {
//                   final post = posts[index];
//                   return ExpansionTile(
//                     title: Text(
//                       "${post.title}",
//                       style: const TextStyle(fontWeight: FontWeight.w600),
//                     ),
//                     children: <Widget>[Text("${post.body}")],
//                   );
//                   // CollectCustomizedCard(postData: post);
//                 }),
//           );
//           break;
//       }
//     });
//   }

//   Future _refresh() => postStore.fetchPosts();
// }

  // return RefreshIndicator(
  //   onRefresh: _refresh,
  //   child: ListView.builder(
  //     physics: const AlwaysScrollableScrollPhysics(),
  //     itemCount: posts.length,
  //     itemBuilder: (context, index) {
  //       final post = posts[index];
  //       return ExpansionTile(
  //         title: Text(post.title, style: TextStyle(fontWeight: FontWeight.w600),),
  //         children: <Widget>[
  //           Text(post.body)
  //         ],
  //       );
  //     }
  PostStore store = PostStore();

  PostScreen({Key? key}) : super(key: key) {
    store.getThePost();
  }

  @override
  Widget build(BuildContext context) {
    final future = store.postListFuture;

    return Observer(
      builder: (_) {
        switch (future!.status) {
          case FutureStatus.pending:
            return const Center(
              child: CircularProgressIndicator(),
            );

          case FutureStatus.rejected:
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Failed to load items.',
                    style: TextStyle(color: Colors.red),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: _refresh,
                    child: const Text('Tap to retry'),
                  )
                ],
              ),
            );
          case FutureStatus.fulfilled:
            final List<Post> posts = future.result;
            //print(posts);
            return RefreshIndicator(
              onRefresh: _refresh,
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];
                  return CollectCustomizedCard(postData: post);
                  // return ExpansionTile(
                  //   title: Text(
                  //     "${post.title}",
                  //     style: TextStyle(fontWeight: FontWeight.w600),
                  //   ),
                  //   children: <Widget>[
                  //     Text("${post.title}"),
                  //     // Image.network("${post.image}")
                  //   ],
                  // );
                },
              ),
            );
            break;
        }
      },
    );
  }

  Future _refresh() => store.fetchPosts();
}
