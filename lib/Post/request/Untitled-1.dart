// import 'package:mobx/mobx.dart';
// import 'package:http/http.dart' as http;

// part 'post.g.dart';

// class Post = _Post with _$Post;

// abstract class _Post with Store {
//   final NetworkService httpClient = NetworkService();
//   final response = await http.get(Uri.parse(postUrl));

//   @observable
//   late ObservableFuture<List<Post>> postListFuture;

//   @action
//   Future fetchPosts() async  => postListFuture = ObservableFuture(
//     await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"))
//           .then((posts) => posts));


//   void getThePost() {
//     fetchPosts();
//   }
// }