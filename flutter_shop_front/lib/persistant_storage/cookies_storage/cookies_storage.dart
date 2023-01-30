import '../storage_keys/storage_key.dart';
import '../persistant_storage.dart';
import 'cookies_html.dart' if (dart.library.io) 'cookies_io.dart';

class CookiesStorage implements PersistentStorage {
  @override
  void pushDataToStorage(StorageKey storageKey, String value) {
    Cookies().pushCookie(storageKey, value);
  }

  @override
  Future<String> getDataFromStorage(StorageKey storageKey) async {
    return await Cookies().getCookie(storageKey);
  }

  @override
  void removeDataFromStorage(StorageKey storageKey) {
    Cookies().removeCookie(storageKey);
  }
}
