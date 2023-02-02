import 'recipe_dto.dart';

class RecipesDto {
  List<RecipeDto> recipes;

  RecipesDto({
    required this.recipes,
  });

  factory RecipesDto.fromJson(Map<String, dynamic> json) {
    return RecipesDto(
      recipes: json['data'] != null
          ? json['data']
              .map<RecipeDto>(
                (json) => RecipeDto.fromJson(json),
              )
              .toList()
          : [],
    );
  }
}
