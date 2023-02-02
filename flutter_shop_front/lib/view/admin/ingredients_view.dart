import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shop_frontend/web_api/dto/ingredient_dto.dart';
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

  String dialogValue = "";

  @override
  Widget build(BuildContext context) {
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
                                Row(
                                  children: [
                                    Text(
                                      snapshot.data!.ingredients[index].ammountLeft.toString(),
                                      textScaleFactor: 1.5,
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor: MaterialStatePropertyAll<Color>(Colors.green[800]!),
                                          ),
                                          onPressed: () async {
                                            return showDialog<void>(
                                              context: context,
                                              barrierDismissible: false, // user must tap button!
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: const Text('Enter new Value'),
                                                  content: SingleChildScrollView(
                                                    child: ListBody(
                                                      children: <Widget>[
                                                        TextField(
                                                          onChanged: (value) {
                                                            setState(() {
                                                              dialogValue = value;
                                                            });
                                                          },
                                                          decoration: InputDecoration(
                                                            border: OutlineInputBorder(),
                                                            labelText: 'Value',
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  actions: <Widget>[
                                                    ElevatedButton(
                                                      style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStatePropertyAll<Color>(Colors.green[800]!),
                                                      ),
                                                      child: const Text('Confirm'),
                                                      onPressed: () {
                                                        if (int.tryParse(dialogValue) == null) {
                                                          setState(() {
                                                            dialogValue == "Value is not a valid number";
                                                          });
                                                        } else {
                                                          ingredientsConncetionService.updateIngredient(
                                                            snapshot.data!.ingredients[index].id.toString(),
                                                            IngredientDto(
                                                              id: snapshot.data!.ingredients[index].id.toString(),
                                                              name: snapshot.data!.ingredients[index].name.toString(),
                                                              ammountLeft: int.parse(dialogValue),
                                                              price: snapshot.data!.ingredients[index].price,
                                                            ),
                                                          );
                                                          Navigator.of(context).pop();
                                                        }
                                                      },
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          child: Text("change")),
                                    )
                                  ],
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
  }
}
