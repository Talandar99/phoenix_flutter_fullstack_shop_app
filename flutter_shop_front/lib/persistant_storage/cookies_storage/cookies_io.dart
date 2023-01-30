import '../storage_keys/storage_key.dart';

class Cookies {
  void pushCookie(StorageKey storageKey, String value) {}

  Future<String> getCookie(StorageKey storageKey) async {
    return "You shouldn't be able to see it";
  }

  void removeCookie(StorageKey storageKey) {}
}
