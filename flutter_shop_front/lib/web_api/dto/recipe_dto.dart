class RecipeDto {
  String id;
  String title;
  String ingredientIdList;

  RecipeDto({
    required this.id,
    required this.title,
    required this.ingredientIdList,
  });

  factory RecipeDto.fromJson(Map<String, dynamic> json) {
    return RecipeDto(
      id: json['id'],
      title: json['title'],
      ingredientIdList: json['ingredients_list'],
    );
  }
}
