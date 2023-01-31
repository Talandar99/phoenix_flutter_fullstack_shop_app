import 'dart:convert';
import 'package:get_it/get_it.dart';
import '../../../host_ip.dart';
import '../../../persistant_storage/persistant_storage.dart';
import '../../dto/meal_dto.dart';
import '../api_service.dart';

class MealsConncetionService {
  final ApiService apiService = GetIt.I<ApiService>();
  final PersistentStorage persistentStorage = GetIt.I<PersistentStorage>();

  Future<MealDto> getAllIngredients() async {
    var response = await apiService.makeApiGetRequest(
      '$apiHost/api/sizes',
    );
    if (response.statusCode == 200) {
      var decodedBody = json.decode(response.body);
      return MealDto.fromJson(decodedBody);
    } else {
      throw Exception();
    }
  }
}