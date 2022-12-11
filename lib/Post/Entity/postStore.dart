import 'package:mobgrocery/Post/request/network.dart';
import 'package:mobgrocery/Post/request/post.dart';
import 'package:mobx/mobx.dart';

part 'postStore.g.dart';

class PostStore = _PostStore with _$PostStore;

abstract class _PostStore with Store {
  final NetworkService httpClient = NetworkService();

  @observable
  ObservableFuture<List<Post>>? postListFuture;

  @action
  Future fetchPosts() => postListFuture = ObservableFuture(
          httpClient.getPosts("https://jsonplaceholder.typicode.com/posts"))
      .then((posts) => posts);

  void getThePost() {
    fetchPosts();
  }
}
