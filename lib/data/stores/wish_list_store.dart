import 'package:ecommerce/data/models/wish_list.dart';
import 'package:ecommerce/data/repositories/wish_list_repository.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'wish_list_store.g.dart';

class WishListStore = _WishListStore with _$WishListStore;

abstract class _WishListStore with Store {
  @observable
  ObservableList<WishList> wishLists = ObservableList.of([]);

  @observable
  int total = 0;

  @observable
  bool loading;

  @observable
  int page = 1;

  @observable
  int pages = 1;

  @observable
  String name = "";

  @observable
  int id;

  final _repository = WishListRepository();

  @action
  void setName(String value) => name = value.trim();

  void setId(int value) => id = value;

  @action
  Future<void> load({int nextPage = 1}) async {
    try {
      loading = true;
      final response = await _repository.fetch(page: nextPage);
      total = response.totalCount;
      page = response.currentPage;
      pages = response.pages;
      response.wishlists.forEach((element) => wishLists.add(element));
    } catch (e, s) {
      print(e);
      print(s);
    } finally {
      loading = false;
    }
  }

  @action
  Future<void> create() async {
    try {
      loading = true;
      final response = await _repository
          .create(WishList(name: name, isDefault: true, isPrivate: true));
      wishLists.add(response);
    } catch (e, s) {
      print(e);
      print(s);
    } finally {
      loading = false;
    }
  }

  @action
  Future<void> addProduct({@required int wishListId, @required int productId}) async {
    try {
      loading = true;
      final response = await _repository.addProduct(wishListId: wishListId, productId: productId);
      print(response);
    } finally {
      loading = false;
    }
  }

  @action
  Future<void> delete(int id) async {
    try {
      loading = true;
      await _repository.delete(id);
      wishLists.removeWhere((element) => element.id == id);
    } finally {
      loading = false;
    }
  }
}
