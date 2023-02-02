import 'dart:convert';

import 'package:get_it/get_it.dart';

import '../../host_ip.dart';
import '../../persistant_storage/persistant_storage.dart';
import '../dto/account_dto.dart';
import '../dto/accounts_dto.dart';
import 'api_service.dart';

class AccountsConnectionService {
  final ApiService apiService = GetIt.I<ApiService>();
  final PersistentStorage persistentStorage = GetIt.I<PersistentStorage>();

  Future<AccountDto> getAccountById(String accountId) async {
    var response = await apiService.makeApiGetRequest(
      '$apiHost/api/accounts/by_id_auth/$accountId',
    );
    if (response.statusCode == 200) {
      var decodedBody = json.decode(response.body);

      return AccountDto.fromJson(decodedBody);
    } else {
      throw Exception("account does not exist");
    }
  }

  Future<AccountsDto> getAllAccounts() async {
    var response = await apiService.makeApiGetRequest(
      '$apiHost/api/accounts',
    );
    if (response.statusCode == 200) {
      var decodedBody = json.decode(response.body);

      return AccountsDto.fromJson(decodedBody);
    } else {
      throw Exception("account does not exist");
    }
  }
}
