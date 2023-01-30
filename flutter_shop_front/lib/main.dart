import 'package:flutter/material.dart';

import 'dependancy_injection.dart';
import 'pages/main_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  MyApp({Key? key}) : super(key: key) {
    setupDependencyInjection(navigatorKey);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop app ',
      home: MainPage(),
    );
  }
}
