import 'package:flutter/material.dart';

class IngredientsView extends StatefulWidget {
  const IngredientsView({super.key});

  @override
  State<IngredientsView> createState() => _IngredientsViewState();
}

@override
class _IngredientsViewState extends State<IngredientsView> {
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Text(
            'Ingredients View',
          ),
        ),
      ],
    );
  }
}
