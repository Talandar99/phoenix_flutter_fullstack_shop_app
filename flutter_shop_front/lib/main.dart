import 'package:flutter/material.dart';
import 'package:shop_frontend/pages/login_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Shop app sample',
      home: LoginPage(),
    );
  }
}
