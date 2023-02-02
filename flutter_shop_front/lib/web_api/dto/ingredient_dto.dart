import 'dto_to_json_interface.dart';

class IngredientDto implements DtoToJsonInterface {
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
  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ammount_left'] = ammountLeft;
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    return {'ingredient': data};
  }
}
