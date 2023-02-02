import 'package:get_it/get_it.dart';
import 'package:shop_frontend/persistant_storage/storage_keys/storage_keys.dart';
import 'package:shop_frontend/web_api/dto/new_order_view_dto.dart';
import '../../persistant_storage/persistant_storage.dart';
import '../dto/account_dto.dart';
import '../dto/accounts_dto.dart';
import '../dto/ingredients_dto.dart';
import '../dto/recipes_dto.dart';
import '../dto/sizes_dto.dart';
import 'account_conneciton_service.dart';
import 'connection/ingredients_connection_service.dart';
import 'connection/recipes_connection_service.dart';
import 'connection/sizes_connection_service.dart';

class NewOrderService {
  Future<NewOrderViewReady> loadOrderView() async {
    final RecipesConncetionService recipesConncetionService = GetIt.I<RecipesConncetionService>();
    final AccountsConnectionService accountsConnectionService = GetIt.I<AccountsConnectionService>();
    final IngredientsConncetionService ingredientsConncetionService = GetIt.I<IngredientsConncetionService>();
    final SizesConncetionService sizesConncetionService = GetIt.I<SizesConncetionService>();
    final PersistentStorage persistentStorage = GetIt.I<PersistentStorage>();

    IngredientsDto ingredientsDto = await ingredientsConncetionService.getAllIngredients();
    AccountsDto accountsDto = await accountsConnectionService.getAllAccounts();
    String currentUserMail = await persistentStorage.getDataFromStorage(StorageKeys.userEmail);
    SizesDto sizesDto = await sizesConncetionService.getAllSizes();
    RecipesDto recipesDto = await recipesConncetionService.getAllRecipes();

    return NewOrderViewReady(
        ingredientsDto: ingredientsDto, accountsDto: accountsDto, recipesDto: recipesDto, sizesDto: sizesDto);
  }
}
