import 'ingredient_dto.dart';

class IngredientsDto {
  List<IngredientDto> ingredients;

  IngredientsDto({
    required this.ingredients,
  });

  factory IngredientsDto.fromJson(Map<String, dynamic> json) {
    return IngredientsDto(
      ingredients: json['data'] != null
          ? json['data']
              .map<IngredientDto>(
                (json) => IngredientDto.fromJson(json),
              )
              .toList()
          : [],
    );
  }
}
