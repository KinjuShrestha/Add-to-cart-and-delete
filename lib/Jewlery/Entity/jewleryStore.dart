import 'package:mobgrocery/Jewlery/Entity/jewlery.dart';
import 'package:mobgrocery/Jewlery/Request/request_jewleryapi.dart';
import 'package:mobx/mobx.dart';

part 'jewleryStore.g.dart';

class JewleryStore = _JewleryStore with _$JewleryStore;

abstract class _JewleryStore with Store {
  final NetworkService httpClient = NetworkService();

  @observable
  ObservableFuture<List<Jewlery>>? jewleryListFuture;
  ObservableFuture<List<Jewlery>>? cartListFuture;

  @observable
  ObservableList userProduct = [].asObservable();

  @action
  Future fetchJewlery() => jewleryListFuture = ObservableFuture(
          httpClient.getJewlery("https://fakestoreapi.com/products"))
      .then((collectionOfJewlery) => collectionOfJewlery);

  void getTheJewlery() {
    fetchJewlery();
  }

  @action
  // void removeData(String data) {
  //   jewleryListFuture?.remove(data);
  // }

  Future cart() => cartListFuture =
      ObservableFuture(httpClient.addToCart(1)).then((cartData) => cartData);

  void cartInit() {
    cart();
  }

  // Future<void> onDeletePressed(int id) async {
  //   bool apiResponse = await httpClient.deleteJewlery(id);
  //   if (apiResponse) {
  //     print("api response is true");
  //     //showSnackBar(context, "Post deleted sucessfully");
  //     // setState(() {
  //     // jewleryy.removeWhere((element) => element.id == id);
  //     // });
  //   } else {
  //     print("api response is false");
  //     //showSnackBar(context, "The post couldn't be deleted");
  //   }
  // }

  // @action
  // Future<void> onDeletePressed(int id) async {
  //   bool apiResponse = await httpClient.deleteJewlery(id);
  //   if (apiResponse) {
  //     print("sjsj");

  //     // SnackBar(
  //     //   content: Text("djddj"),
  //     //   backgroundColor: Colors.blue,
  //     //   elevation: 5,
  //     // );

  //     collectionOfJewlery.removeWhere((element) => element.id == id);
  //   } else {
  //     print("The post couldn't be deleted");
  //   }
  // }
}
