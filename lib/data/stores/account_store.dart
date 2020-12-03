import 'package:ecommerce/data/models/account.dart';
import 'package:ecommerce/data/repositories/account_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'account_store.g.dart';

class AccountStore = _AccountStore with _$AccountStore;

abstract class _AccountStore with Store {
  @observable
  bool loading = false;

  @observable
  String email = "";

  @observable
  String password = "";

  @observable
  String passwordConfirmation = "";

  @observable
  double cash = 0.0;

  @observable
  int totalOfOrders = 0;

  final _repository = AccountRepository();

  @action
  void setEmail(String value) => email = value.trim();

  @action
  void setPassword(String value) => password = value.trim();

  @action
  void setPasswordConfirmation(String value) =>
      passwordConfirmation = value.trim();

  @action
  Future<void> load(BuildContext context) async {
    try {
      loading = true;
      final data = await _repository.load();
      email = data.email;
      cash = data.storeCredits;
      totalOfOrders = data.completedOrders;
    } catch (e, s) {
      print(e);
      print(s);
    } finally {
      loading = false;
    }
  }

  @action
  Future<void> update(BuildContext context) async {
    try {
      loading = true;
      final data = await _repository.update(Account(email: email));
      email = data.email;
      cash = data.storeCredits;
      totalOfOrders = data.completedOrders;
    } catch (e, s) {
      print(e);
      print(s);
    } finally {
      loading = false;
    }
  }
}
