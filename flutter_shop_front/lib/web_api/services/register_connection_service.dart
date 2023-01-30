import 'dart:convert';
import 'package:http_status_code/http_status_code.dart';
import 'package:get_it/get_it.dart';
import 'package:ilare_world_flutter/config.dart';
import 'package:ilare_world_flutter/web_api/dto/new_user_dto.dart';
import 'package:ilare_world_flutter/web_api/dto/user_dto.dart';
import 'package:ilare_world_flutter/web_api/exception/register_error_exception.dart';
import 'package:ilare_world_flutter/web_api/services/api_service.dart';

class RegisterConnectionService {
  final ApiService apiService = GetIt.I<ApiService>();

  Future<UserDto> register(NewUserDto newUserDto) async {
    var response = await apiService.postWithoutToken(
      '$apiHost/api/users/register',
      newUserDto,
    );

    if (response.statusCode == StatusCode.CREATED) {
      var decodedBody = json.decode(response.body);

      return UserDto.fromJson(decodedBody);
    } else {
      throw RegisterErrorException();
    }
  }
}
