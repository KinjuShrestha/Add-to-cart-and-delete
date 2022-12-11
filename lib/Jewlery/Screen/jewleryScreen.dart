import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobgrocery/Jewlery/Entity/cart_store.dart';
import 'package:mobgrocery/Jewlery/Entity/jewlery.dart';
import 'package:mobgrocery/Jewlery/Entity/jewleryStore.dart';
import 'package:mobgrocery/Jewlery/Screen/addtoCartScreen.dart';
import 'package:mobgrocery/Jewlery/Screen/reusable.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../Request/request_jewleryapi.dart';

class JewleryView extends StatefulWidget {
  // JewleryView() {
  //   store.getTheJewlery();
  //   //store.cartInit();
  // }

  @override
  State<JewleryView> createState() => _JewleryViewState();
}

class _JewleryViewState extends State<JewleryView> {
  JewleryStore store = JewleryStore();

  CartStore cartStore = CartStore();

  @override
  void didChangeDependencies() {
    cartStore = Provider.of<CartStore>(context, listen: false);
    super.didChangeDependencies();
  }

  @override
  void initState() {
    store.getTheJewlery();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final future = store.jewleryListFuture;
    // final cartData = store.cartListFuture;
    return SafeArea(
      child: Observer(
        builder: (BuildContext context) {
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
              final List<Jewlery> collectionOfJewlery = future.result;
              //final List<Jewlery> cartListFuture = cartData!.result;

              return RefreshIndicator(
                onRefresh: _refresh,
                child: GridView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  // itemCount: collectionOfJewlery.length,
                  itemBuilder: (context, index) {
                    final jewleryy = collectionOfJewlery[index];

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Slidable(
                          //dragStartBehavior: DragStartBehavior.down,
                          startActionPane:
                              ActionPane(motion: DrawerMotion(), children: [
                            SlidableAction(
                              autoClose: true,
                              //flex: 3,
                              padding: EdgeInsets.all(0),
                              onPressed: (index) {
                                //onDeletePressed(jewleryy.id!);

                                int index = cartStore.cartItems.indexWhere(
                                    (element) => element.id == jewleryy.id);
                                if (index == -1) {
                                  cartStore.addCartItem(
                                    Jewlery(
                                        title: jewleryy.title ?? "",
                                        image: jewleryy.image ?? "",
                                        price: jewleryy.price ?? 10,
                                        category: jewleryy.category ?? "",
                                        description: jewleryy.description,
                                        quantity: 1),
                                  );
                                } else {
                                  cartStore.cartItems[index] = Jewlery(
                                      title: jewleryy.title ?? "",
                                      image: jewleryy.image ?? "",
                                      price: jewleryy.price ?? 10,
                                      category: jewleryy.category ?? "",
                                      description: jewleryy.description,
                                      quantity:
                                          cartStore.cartItems[index].quantity! +
                                              1);
                                }

                                showSnackBarr(
                                    context, "Product added sucessfully");

                                Navigator.pushNamed(context, '/addtocart');
                              },
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                              icon: Icons.shopping_cart_sharp,
                              label: 'Add to Cart',
                            ),
                          ]),
                          key: const ValueKey(0),
                          child: CollectCustomizedCard(
                            jewleryData: jewleryy,
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            // editbutton: () {
                            //   Navigator.pushNamed(context, '/addtocart');
                            // },
                          )),
                    );
                  },
                  itemCount: collectionOfJewlery.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                ),
              );
              break;
          }
        },
      ),
    );
  }

  Future _refresh() async => await store.fetchJewlery();
}
