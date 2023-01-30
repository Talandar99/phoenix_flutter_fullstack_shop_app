// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import '../storage_keys/storage_key.dart';

class Cookies {
  final cookie = document.cookie;
  void pushCookie(StorageKey storageKey, String value) {
    document.cookie = ("${storageKey.key}=$value");
  }

  Future<String> getCookie(StorageKey storageKey) async {
    return _getCookiemap()[storageKey.key]!;
  }

  void removeCookie(StorageKey storageKey) {
    document.cookie = ("${storageKey.key}=;Max-Age=-99999999;");
  }

  Map<String, String> _getCookiemap() {
    final entity = cookie!.split("; ").map((item) {
      final split = item.split("=");
      return MapEntry(split[0], split[1]);
    });
    return Map.fromEntries(entity);
  }
}
