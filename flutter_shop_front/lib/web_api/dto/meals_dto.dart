import 'meal_dto.dart';

class MealsDto {
  List<MealDto> meals;

  MealsDto({
    required this.meals,
  });

  factory MealsDto.fromJson(Map<String, dynamic> json) {
    return MealsDto(
      meals: json['data'] != null
          ? json['data']
              .map<MealDto>(
                (json) => MealDto.fromJson(json),
              )
              .toList()
          : [],
    );
  }
}
