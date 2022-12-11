import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mobgrocery/Jewlery/Entity/cart_store.dart';
import 'package:mobgrocery/Jewlery/Entity/jewlery.dart';
import 'package:mobgrocery/Jewlery/Entity/jewleryStore.dart';
import 'package:mobgrocery/Jewlery/Screen/reusable.dart';

import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  CartStore _cartStore = CartStore();

  @override
  void didChangeDependencies() {
    _cartStore = Provider.of<CartStore>(context, listen: false);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: SafeArea(
        child: Observer(
          builder: (context) {
            if (_cartStore.cartItems.isEmpty) {
              return const Center(
                child: Text("No Cart Items Found"),
              );
            }
            return ListView.builder(
              itemCount: _cartStore.cartItems.length,
              itemBuilder: (context, index) {
                final item = _cartStore.cartItems[index];

                return Slidable(
                    endActionPane: ActionPane(
                      motion: const DrawerMotion(),
                      children: [
                        SlidableAction(
                          autoClose: true,
                          // flex: 1,
                          padding: EdgeInsets.all(8),
                          onPressed: (value) {
                            _cartStore.removeCartItem(item);
                          },
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Delete',
                        ),
                      ],
                    ),
                    child: CollectCartCard(
                        item: item,
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.width));

               
              },
            );
          },
        ),
      ),
    );
  }
}
