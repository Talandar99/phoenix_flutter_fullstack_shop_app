import 'package:get_it/get_it.dart';
import '../../host_ip.dart';
import '../dto/account_dto.dart';
import '../dto/accounts_dto.dart';
import '../services/api_service.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AccountConncetion {
  final apiService = GetIt.I<ApiService>();

  Future<AccountDto> getAccount(int index) async {
    var response = await apiService.makeApiGetRequest('$apiHost/api/accounts/$index');
    if (response.statusCode == 404) {
      throw Exception("can't feetch data exception");
    } else {
      print(response.body);
      return AccountDto.fromJson(json.decode(response.body));
    }
  }
  //  Future<String> addNewCard(
//    NewCardDto cardDto,
//  ) async {
//    var response = await apiService.post(
//      '$apiHost/api/cards',
//      cardDto,
//    );
//    return response.body;
//  }
//
//  Future<void> deleteCardById(int id) async {
//    var response = await apiService.delete('$apiHost/api/cards/$id');
//    if (response.statusCode == 404) {
//      throw CantFetchDataException();
//    }
//  }
//
//  Future<CardDto> getCardById(int id) async {
//    var response = await apiService.makeApiGetRequest('$apiHost/api/cards/$id');
//    if (response.statusCode == 404) {
//      throw CantFetchDataException();
//    } else {
//      return CardDto.fromJson(json.decode(response.body));
//    }
//  }
//
//  Future<List<CardDto>> getCards() async {
//    List<CardDto> dtos = [];
//    int pageNumber = 1;
//
//    while (true) {
//      var items = await _getAllItemsByPageNumber(pageNumber);
//
//      if (items.isEmpty) {
//        break;
//      } else {
//        pageNumber++;
//      }
//
//      dtos.addAll(items);
//    }
//
//    return dtos;
//  }
//
//  Future<List<CardDto>> _getAllItemsByPageNumber(int pageNumber) async {
//    var response = await apiService.makeApiGetRequest(
//      '$apiHost/api/cards?page=$pageNumber',
//    );
//    if (response.statusCode == StatusCode.OK) {
//      var decodedBody = json.decode(response.body);
//      var items = ResponseHelper.items(decodedBody);
//      return items.map((e) => CardDto.fromJson(e)).toList();
//    } else {
//      return [];
//    }
//  }
//
//  Future<CardDto> patchCard(NewCardDto newCardDto, int cardId) async {
//    var response =
//        await apiService.patch('$apiHost/api/cards/$cardId', newCardDto);
//    if (response.statusCode == 404) {
//      throw CantFetchDataException();
//    } else {
//      return CardDto.fromJson(json.decode(response.body));
//    }
//  }
}
