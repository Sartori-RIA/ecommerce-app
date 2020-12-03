import 'dart:convert';

import 'package:ecommerce/data/models/account.dart';
import 'package:ecommerce/utils/dio_config.dart';

class AccountRepository {
  static final AccountRepository _instance = AccountRepository.internal();

  factory AccountRepository() => _instance;

  AccountRepository.internal();

  final _api = AccountApi(DioConfig().dio);

  Future<Account> load() async {
    final data = await _api.load();
    return Account.fromJson(json.decode(data.data)["data"]["attributes"]);
  }

  Future<Account> update(Account account) async {
    final data = await _api.update({"user": account});
    return Account.fromJson(json.decode(data.data)["data"]["attributes"]);
  }
}
