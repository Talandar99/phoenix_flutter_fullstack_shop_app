import '../storage_keys/storage_key.dart';
import '../persistant_storage.dart';
import 'shared_persistance.dart';

class SharedPreferencesStorage implements PersistentStorage {
  final SharedPreference storage = const SharedPreference();

  @override
  void pushDataToStorage(StorageKey key, String value) {
    storage.savePreference(key.key, value);
  }

  @override
  void removeDataFromStorage(StorageKey key) {
    storage.removePreference(key.key);
  }

  @override
  Future<String> getDataFromStorage(StorageKey key) {
    return storage.getPreference(key.key);
  }
}
