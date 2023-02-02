import 'dart:convert';
import 'package:get_it/get_it.dart';

import '../../host_ip.dart';
import '../../persistant_storage/persistant_storage.dart';
import '../../persistant_storage/storage_keys/storage_keys.dart';
import '../dto/account_dto.dart';
import '../dto/email_password_dto.dart';
import '../dto/token_dto.dart';
import 'api_service.dart';

class LoginConnectionService {
  final ApiService apiService = GetIt.I<ApiService>();
  final PersistentStorage persistentStorage = GetIt.I<PersistentStorage>();

  Future<TokenDto> login(EmailPasswordDto emailPasswordDto) async {
    var response = await apiService.postWithoutToken(
      '$apiHost/api/accounts/sign_in',
      emailPasswordDto,
    );
    if (response.statusCode == 200) {
      var decodedBody = json.decode(response.body);
      var account = AccountDto.fromJson(decodedBody);

      persistentStorage.pushDataToStorage(
        StorageKeys.userFullName,
        account.fullName.toString(),
      );
      persistentStorage.pushDataToStorage(
        StorageKeys.userIsAdmin,
        account.isAdmin.toString(),
      );
      persistentStorage.pushDataToStorage(
        StorageKeys.userPhoneNumber,
        account.phoneNumber.toString(),
      );
      persistentStorage.pushDataToStorage(
        StorageKeys.userEmail,
        account.email.toString(),
      );
      persistentStorage.pushDataToStorage(
        StorageKeys.uID,
        account.id.toString(),
      );
      return TokenDto.fromJson(decodedBody);
    } else {
      throw Exception("wrong credentials");
    }
  }
}
