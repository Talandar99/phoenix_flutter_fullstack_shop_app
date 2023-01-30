class IngredientDto {
  String id;
  String name;
  double price;
  int ammountLeft;

  IngredientDto({
    required this.id,
    required this.name,
    required this.ammountLeft,
    required this.price,
  });

  factory IngredientDto.fromJson(Map<String, dynamic> json) {
    return IngredientDto(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      ammountLeft: json['ammount_left'],
    );
  }
}
