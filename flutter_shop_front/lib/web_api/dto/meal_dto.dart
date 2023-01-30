class MealDto {
  String id;
  String userId;
  String recipeId;
  String orderDate;
  String status;

  MealDto({
    required this.id,
    required this.userId,
    required this.recipeId,
    required this.orderDate,
    required this.status,
  });

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
