import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get_it/get_it.dart';

import '../persistant_storage/persistant_storage.dart';
import '../persistant_storage/storage_keys/storage_keys.dart';
import '../widgets/snackbar.dart';
import 'package:jwt_decode/jwt_decode.dart';

import 'admin_page.dart';
import 'login_page.dart';
import 'user_page.dart';

class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PersistentStorage persistentStorage = GetIt.I<PersistentStorage>();
  final CustomSnackBar errorSnackbar = GetIt.I<CustomSnackBar>();
  late Future<String> token;

  @override
  void initState() {
    super.initState();
    token = persistentStorage.getDataFromStorage(StorageKeys.apiToken);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<String>(
        future: token,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            String id = Jwt.parseJwt(snapshot.data!)['userId'].toString();
            persistentStorage.pushDataToStorage(StorageKeys.userID, id);
            if (Jwt.isExpired(snapshot.data!)) {
              SchedulerBinding.instance.addPostFrameCallback((_) {
                errorSnackbar.show(
                  context,
                  'Token logowania wygasł. Zaloguj się żeby pozyskać nowy',
                );
              });
            } else {
              SchedulerBinding.instance.addPostFrameCallback((_) async {
                if ((await persistentStorage.getDataFromStorage(StorageKeys.userIsAdmin)) == "true") {
                  print("o tak mordeczko jestem adminem");
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AdminPage(),
                    ),
                  );
                } else {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const UserPage(),
                    ),
                  );
                  print("oj nie byczku nie jestem adminem");
                }
              });
            }
            return LoginPage();
          } else if (snapshot.hasError) {
            return LoginPage();
          }
          return const Center(
            child: SizedBox(
              height: 200.0,
              width: 200.0,
              child: CircularProgressIndicator(strokeWidth: 5),
            ),
          );
        },
      ),
    );
  }
}
