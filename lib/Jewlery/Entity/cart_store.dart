import 'package:mobx/mobx.dart';

import 'package:mobgrocery/Jewlery/Entity/jewlery.dart';

part 'cart_store.g.dart';

class CartStore = _CartStore with _$CartStore;

abstract class _CartStore with Store {
  @observable
  ObservableList<Jewlery> cartItems = ObservableList<Jewlery>();

  @action
  void addCartItem(Jewlery item) {
    cartItems.add(item);
  }

  @action
  void removeCartItem(Jewlery item) {
    cartItems.remove(item);
  }
}

