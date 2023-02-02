import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../web_api/dto/recipes_dto.dart';
import '../../web_api/services/connection/recipes_connection_service.dart';

class RecipesView extends StatefulWidget {
  const RecipesView({super.key});

  @override
  State<RecipesView> createState() => _RecipesViewState();
}

@override
class _RecipesViewState extends State<RecipesView> {
  final RecipesConncetionService recipesConncetionService = GetIt.I<RecipesConncetionService>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<RecipesDto>(
        future: recipesConncetionService.getAllRecipes(),
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
                  itemCount: snapshot.data!.recipes.length,
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
                                    "Recipe Title",
                                    textScaleFactor: 1.5,
                                    style: TextStyle(
                                      color: Colors.white60,
                                    ),
                                  ),
                                ),
                                Text(
                                  snapshot.data!.recipes[index].title,
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
                                    "ingredients",
                                    textScaleFactor: 1.5,
                                    style: TextStyle(
                                      color: Colors.white60,
                                    ),
                                  ),
                                ),
                                Text(
                                  snapshot.data!.recipes[index].ingredientIdList,
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
                print(snapshot.toString());
                return Text("Something went wrong ;/");
              }
          }
        });
  }
}
