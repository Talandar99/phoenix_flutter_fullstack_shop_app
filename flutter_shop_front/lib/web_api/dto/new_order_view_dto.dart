import 'accounts_dto.dart';
import 'ingredients_dto.dart';
import 'recipes_dto.dart';
import 'sizes_dto.dart';

class NewOrderViewReady {
  AccountsDto accountsDto;
  RecipesDto recipesDto;
  SizesDto sizesDto;
  IngredientsDto ingredientsDto;

  NewOrderViewReady({
    required this.ingredientsDto,
    required this.accountsDto,
    required this.recipesDto,
    required this.sizesDto,
  });
}
