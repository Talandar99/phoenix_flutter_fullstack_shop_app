import 'package:flutter/material.dart';

class CustomSnackBar {
  const CustomSnackBar();

  show(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 5),
        backgroundColor: Colors.blue,
        onVisible: () async =>
            {await Future.delayed(const Duration(seconds: 5)), ScaffoldMessenger.of(context).clearSnackBars()},
        action: SnackBarAction(
          label: 'ukryj',
          onPressed: () => {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..clearSnackBars(),
          },
        ),
      ),
    );
  }
}
