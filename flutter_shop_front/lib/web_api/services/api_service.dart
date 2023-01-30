import 'dart:convert';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shop_frontend/web_api/dto/dto_to_json_interface.dart';
import '../../persistant_storage/persistant_storage.dart';
import '../../persistant_storage/storage_keys/storage_keys.dart';

class ApiService {
  final PersistentStorage persistentStorage = GetIt.I<PersistentStorage>();

  Future<http.Response> makeApiGetRequest(String uri) async {
    var token = await persistentStorage.getDataFromStorage(StorageKeys.apiToken);

    return http.get(
      Uri.parse(uri),
      headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8', 'Authorization': 'Bearer $token'},
    );
  }

  Future<http.Response> delete(String uri) async {
    var token = await persistentStorage.getDataFromStorage(StorageKeys.apiToken);

    return http.delete(
      Uri.parse(uri),
      headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8', 'Authorization': 'Bearer $token'},
    );
  }

  Future<http.Response> patch(
    String uri,
    DtoToJsonInterface toJsonDto,
  ) async {
    var token = await persistentStorage.getDataFromStorage(StorageKeys.apiToken);

    return http.patch(
      Uri.parse(uri),
      headers: <String, String>{
        'Content-Type': 'application/merge-patch+json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode(toJsonDto.toJson()),
    );
  }

  Future<http.Response> post(
    String uri,
    DtoToJsonInterface toJsonDto,
  ) async {
    var token = await persistentStorage.getDataFromStorage(StorageKeys.apiToken);
    return http.post(
      Uri.parse(uri),
      headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8', 'Authorization': 'Bearer $token'},
      body: jsonEncode(toJsonDto.toJson()),
    );
  }

  Future<http.Response> postWithoutToken(
    String uri,
    DtoToJsonInterface toJsonDto,
  ) async {
    return http.post(
      Uri.parse(uri),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(toJsonDto.toJson()),
    );
  }

  Future<http.Response> put(
    String uri,
    DtoToJsonInterface toJsonDto,
  ) async {
    var token = await persistentStorage.getDataFromStorage(StorageKeys.apiToken);

    return http.put(
      Uri.parse(uri),
      headers: <String, String>{'Content-Type': 'application/ld+json; charset=UTF-8', 'Authorization': 'Bearer $token'},
      body: jsonEncode(toJsonDto.toJson()),
    );
  }
}
