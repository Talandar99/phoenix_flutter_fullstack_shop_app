import 'dart:convert';
import 'package:get_it/get_it.dart';
import '../../../host_ip.dart';
import '../../../persistant_storage/persistant_storage.dart';
import '../../dto/meal_dto.dart';
import '../../dto/meals_dto.dart';
import '../api_service.dart';

class MealsConncetionService {
  final ApiService apiService = GetIt.I<ApiService>();
  final PersistentStorage persistentStorage = GetIt.I<PersistentStorage>();

  Future<MealsDto> getAllMeals() async {
    var response = await apiService.makeApiGetRequest(
      '$apiHost/api/meals',
    );
    if (response.statusCode == 200) {
      var decodedBody = json.decode(response.body);
      return MealsDto.fromJson(decodedBody);
    } else {
      throw Exception();
    }
  }

  Future<MealDto> updateMeal(String id, MealDto mealDto) async {
    var response = await apiService.post(
      '$apiHost/api/meals/update/$id',
      mealDto,
    );
    if (response.statusCode == 200) {
      var decodedBody = json.decode(response.body);
      return MealDto.fromJson(decodedBody);
    } else {
      throw Exception();
    }
  }

  Future<MealDto> createMeal(MealDto mealDto) async {
    var response = await apiService.post(
      '$apiHost/api/meals/create',
      mealDto,
    );
    if (response.statusCode == 200) {
      var decodedBody = json.decode(response.body);
      return MealDto.fromJson(decodedBody);
    } else {
      throw Exception();
    }
  }
}
