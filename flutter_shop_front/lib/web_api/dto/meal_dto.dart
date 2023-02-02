import 'dto_to_json_interface.dart';

class MealDto implements DtoToJsonInterface {
  String? id;
  String userId;
  String recipeId;
  String orderDate;
  String status;

  MealDto({
    this.id,
    required this.userId,
    required this.recipeId,
    required this.orderDate,
    required this.status,
  });

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userid'] = userId;
    data['recipeid'] = recipeId;
    data['status'] = status;
    data['orderdate'] = orderDate;
    return {'meal': data};
  }

  factory MealDto.fromJson(Map<String, dynamic> json) {
    return MealDto(
      id: json['id'],
      userId: json['userid'],
      recipeId: json['recipeid'],
      orderDate: json['orderdate'],
      status: json['status'],
    );
  }
}
