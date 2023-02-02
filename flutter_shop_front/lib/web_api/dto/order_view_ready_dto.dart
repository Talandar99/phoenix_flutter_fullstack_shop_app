import 'account_dto.dart';
import 'recipe_dto.dart';

class OrderViewReadyDto {
  String id;
  AccountDto accountDto;
  RecipeDto recipeDto;
  String orderDate;
  String status;
  String currentUser;

  OrderViewReadyDto({
    required this.currentUser,
    required this.id,
    required this.accountDto,
    required this.recipeDto,
    required this.orderDate,
    required this.status,
  });
}
