import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:shop_frontend/widgets/snackbar.dart';
import 'persistant_storage/cookies_storage/cookies_storage.dart';
import 'persistant_storage/persistant_storage.dart';
import 'persistant_storage/shared_persistance_storage/shared_preferences_storage.dart';
import 'web_api/connection/account_connection.dart';
import 'web_api/services/api_service.dart';
import 'web_api/services/login_connection_service.dart';

void setupDependencyInjection(navigatorKey) {
  GetIt.I.registerLazySingleton<PersistentStorage>(() {
    if (kIsWeb) {
      return CookiesStorage();
    } else {
      return SharedPreferencesStorage();
    }
  });
  GetIt.I.registerLazySingleton<AccountConncetion>(
    () => AccountConncetion(),
  );
  GetIt.I.registerLazySingleton<LoginConnectionService>(
    () => LoginConnectionService(),
  );
  GetIt.I.registerLazySingleton<CustomSnackBar>(
    () => CustomSnackBar(),
  );
  GetIt.I.registerLazySingleton<ApiService>(
    () => ApiService(),
  );
}
