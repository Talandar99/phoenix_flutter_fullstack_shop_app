import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../web_api/dto/ingredients_dto.dart';
import '../../web_api/services/connection/ingredients_connection_service.dart';

class IngredientsView extends StatefulWidget {
  const IngredientsView({super.key});

  @override
  State<IngredientsView> createState() => _IngredientsViewState();
}

@override
class _IngredientsViewState extends State<IngredientsView> {
  final IngredientsConncetionService ingredientsConncetionService = GetIt.I<IngredientsConncetionService>();

  @override
  Widget build(BuildContext context) {
    body:
    return FutureBuilder<IngredientsDto>(
        future: ingredientsConncetionService.getAllIngredients(),
        builder: (BuildContext context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const Center(
                child: Text("Connecting"),
              );
            default:
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.ingredients.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration:
                            BoxDecoration(color: Colors.green, borderRadius: BorderRadius.all(Radius.circular(20))),
                        height: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: const Text(
                                    "Ingredient name",
                                    textScaleFactor: 1.5,
                                    style: TextStyle(
                                      color: Colors.white60,
                                    ),
                                  ),
                                ),
                                Text(
                                  snapshot.data!.ingredients[index].name,
                                  textScaleFactor: 1.5,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: const Text(
                                    "Price",
                                    textScaleFactor: 1.5,
                                    style: TextStyle(
                                      color: Colors.white60,
                                    ),
                                  ),
                                ),
                                Text(
                                  snapshot.data!.ingredients[index].price.toString(),
                                  textScaleFactor: 1.5,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: const Text(
                                    "Ammount Left",
                                    textScaleFactor: 1.5,
                                    style: TextStyle(
                                      color: Colors.white60,
                                    ),
                                  ),
                                ),
                                Text(
                                  snapshot.data!.ingredients[index].ammountLeft.toString(),
                                  textScaleFactor: 1.5,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else {
                return Text("Something went wrong ;/");
              }
          }
        });

    //    return Column(
//      children: [
//        Expanded(
//          child: Text(
//            'Ingredients View',
//          ),
//        ),
//      ],
//    );
  }
}
