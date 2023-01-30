import 'dart:convert';
import 'package:get_it/get_it.dart';
import '../../../host_ip.dart';
import '../../../persistant_storage/persistant_storage.dart';
import '../../dto/ingredients_dto.dart';
import '../api_service.dart';

class IngredientsConncetionService {
  final ApiService apiService = GetIt.I<ApiService>();
  final PersistentStorage persistentStorage = GetIt.I<PersistentStorage>();

  Future<IngredientsDto> getAllIngredients() async {
    var response = await apiService.makeApiGetRequest(
      '$apiHost/api/ingredients',
    );
    if (response.statusCode == 200) {
      var decodedBody = json.decode(response.body);
      return IngredientsDto.fromJson(decodedBody);
    } else {
      throw Exception();
    }
  }
}
