import 'dart:convert';
import 'package:get_it/get_it.dart';
import '../../../host_ip.dart';
import '../../../persistant_storage/persistant_storage.dart';
import '../../dto/recipe_dto.dart';
import '../../dto/recipes_dto.dart';
import '../api_service.dart';

class RecipesConncetionService {
  final ApiService apiService = GetIt.I<ApiService>();
  final PersistentStorage persistentStorage = GetIt.I<PersistentStorage>();

  Future<RecipesDto> getAllRecipes() async {
    var response = await apiService.makeApiGetRequest(
      '$apiHost/api/recipes',
    );
    if (response.statusCode == 200) {
      var decodedBody = json.decode(response.body);

      return RecipesDto.fromJson(decodedBody);
    } else {
      throw Exception();
    }
  }

  Future<RecipeDto> getRecipeById(String recipeId) async {
    var response = await apiService.makeApiGetRequest(
      '$apiHost/api/recipes/by_id/$recipeId',
    );
    if (response.statusCode == 200) {
      var decodedBody = json.decode(response.body);

      return RecipeDto.fromJson(decodedBody);
    } else {
      throw Exception();
    }
  }
}
