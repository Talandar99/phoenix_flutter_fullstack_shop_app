import 'package:get_it/get_it.dart';
import 'package:shop_frontend/persistant_storage/storage_keys/storage_keys.dart';

import '../../persistant_storage/persistant_storage.dart';
import '../dto/account_dto.dart';
import '../dto/meals_dto.dart';
import '../dto/order_view_ready_dto.dart';
import '../dto/recipe_dto.dart';
import 'account_conneciton_service.dart';
import 'connection/meals_connection_service.dart';
import 'connection/recipes_connection_service.dart';

class OrdersViewReadyService {
  Future<List<OrderViewReadyDto>> getOrderViewReady() async {
    final MealsConncetionService mealsConncetionService = GetIt.I<MealsConncetionService>();
    final RecipesConncetionService recipesConncetionService = GetIt.I<RecipesConncetionService>();
    final AccountsConnectionService accountsConnectionService = GetIt.I<AccountsConnectionService>();

    final PersistentStorage persistentStorage = GetIt.I<PersistentStorage>();

    MealsDto mealsDto = await mealsConncetionService.getAllMeals();

    List<OrderViewReadyDto> ordersViewReady = [];
    for (var i = 0; i < mealsDto.meals.length; i++) {
      AccountDto accountDto = await accountsConnectionService.getAccountById(mealsDto.meals[i].userId);
      RecipeDto recipeDto = await recipesConncetionService.getRecipeById(mealsDto.meals[i].recipeId);
      String currentUser = await persistentStorage.getDataFromStorage(StorageKeys.userEmail);

      ordersViewReady.add(OrderViewReadyDto(
        id: mealsDto.meals[i].id!,
        accountDto: accountDto,
        recipeDto: recipeDto,
        orderDate: mealsDto.meals[i].orderDate,
        status: mealsDto.meals[i].status,
        currentUser: currentUser,
      ));
    }
    return ordersViewReady;
  }
}
