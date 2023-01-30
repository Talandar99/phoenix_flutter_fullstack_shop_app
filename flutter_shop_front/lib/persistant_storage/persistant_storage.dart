import 'storage_keys/storage_key.dart';

abstract class PersistentStorage {
  void pushDataToStorage(StorageKey key, String value);
  void removeDataFromStorage(StorageKey key);
  Future<String> getDataFromStorage(StorageKey key);
}
