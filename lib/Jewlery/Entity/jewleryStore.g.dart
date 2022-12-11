// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jewleryStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$JewleryStore on _JewleryStore, Store {
  late final _$jewleryListFutureAtom =
      Atom(name: '_JewleryStore.jewleryListFuture', context: context);

  @override
  ObservableFuture<List<Jewlery>>? get jewleryListFuture {
    _$jewleryListFutureAtom.reportRead();
    return super.jewleryListFuture;
  }

  @override
  set jewleryListFuture(ObservableFuture<List<Jewlery>>? value) {
    _$jewleryListFutureAtom.reportWrite(value, super.jewleryListFuture, () {
      super.jewleryListFuture = value;
    });
  }

  late final _$userProductAtom =
      Atom(name: '_JewleryStore.userProduct', context: context);

  @override
  ObservableList<dynamic> get userProduct {
    _$userProductAtom.reportRead();
    return super.userProduct;
  }

  @override
  set userProduct(ObservableList<dynamic> value) {
    _$userProductAtom.reportWrite(value, super.userProduct, () {
      super.userProduct = value;
    });
  }

  late final _$_JewleryStoreActionController =
      ActionController(name: '_JewleryStore', context: context);

  @override
  Future<dynamic> fetchJewlery() {
    final _$actionInfo = _$_JewleryStoreActionController.startAction(
        name: '_JewleryStore.fetchJewlery');
    try {
      return super.fetchJewlery();
    } finally {
      _$_JewleryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> cart() {
    final _$actionInfo =
        _$_JewleryStoreActionController.startAction(name: '_JewleryStore.cart');
    try {
      return super.cart();
    } finally {
      _$_JewleryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
jewleryListFuture: ${jewleryListFuture},
userProduct: ${userProduct}
    ''';
  }
}
