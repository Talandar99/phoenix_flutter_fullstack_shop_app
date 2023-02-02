import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shop_frontend/persistant_storage/storage_keys/storage_keys.dart';
import 'package:shop_frontend/web_api/dto/meal_dto.dart';
import '../../persistant_storage/persistant_storage.dart';
import '../../web_api/dto/new_order_view_dto.dart';
import '../../web_api/services/connection/meals_connection_service.dart';
import '../../web_api/services/new_order_service.dart';
import '../../widgets/snackbar.dart';

class NewOrderView extends StatefulWidget {
  const NewOrderView({super.key});

  @override
  State<NewOrderView> createState() => _NewOrderViewState();
}

@override
class _NewOrderViewState extends State<NewOrderView> {
  final NewOrderService ordersViewReadyService = NewOrderService();
  final MealsConncetionService mealsConncetionService = MealsConncetionService();
  final PersistentStorage persistentStorage = GetIt.I<PersistentStorage>();
  final CustomSnackBar snackbar = GetIt.I<CustomSnackBar>();
  int selectedRecipe = -1;
  int selectedSize = -1;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewOrderViewReady>(
        future: ordersViewReadyService.loadOrderView(),
        builder: (BuildContext context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const Center(
                child: Text("Connecting"),
              );
            default:
              if (snapshot.hasData) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Recipes',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.recipesDto.recipes.length,
                        itemBuilder: (BuildContext context, int index) {
                          if (selectedRecipe == index) {
                            return Card(
                              color: Colors.green[100],
                              child: Center(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            snapshot.data!.recipesDto.recipes[index].title,
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ),
                                        Text(snapshot.data!.recipesDto.recipes[index].ingredientIdList),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStatePropertyAll<Color>(Colors.green[800]!),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          selectedRecipe = index;
                                        });
                                      },
                                      child: Text('Select'),
                                    ),
                                  )
                                ],
                              )),
                            );
                          } else {
                            return Card(
                              child: Center(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            snapshot.data!.recipesDto.recipes[index].title,
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ),
                                        Text(snapshot.data!.recipesDto.recipes[index].ingredientIdList),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStatePropertyAll<Color>(Colors.green[800]!),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          selectedRecipe = index;
                                        });
                                      },
                                      child: Text('Select'),
                                    ),
                                  )
                                ],
                              )),
                            );
                          }
                        },
                      ),
                    ),
                    Container(
                      height: 5,
                      color: Colors.green,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Sizes',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.sizesDto.sizes.length,
                          itemBuilder: (BuildContext context, int index) {
                            if (selectedSize == index) {
                              return Card(
                                color: Colors.green[100],
                                child: Center(
                                    child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Text(snapshot.data!.sizesDto.sizes[index].size),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStatePropertyAll<Color>(Colors.green[800]!),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            selectedSize = index;
                                          });
                                        },
                                        child: Text('Select'),
                                      ),
                                    )
                                  ],
                                )),
                              );
                            } else {
                              return Card(
                                child: Center(
                                    child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Text(snapshot.data!.sizesDto.sizes[index].size),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStatePropertyAll<Color>(Colors.green[800]!),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            selectedSize = index;
                                          });
                                        },
                                        child: Text('Select'),
                                      ),
                                    )
                                  ],
                                )),
                              );
                            }
                          }),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(Colors.green[800]!),
                          ),
                          onPressed: () async {
                            String userid = await persistentStorage.getDataFromStorage(StorageKeys.uID);
                            var now = DateTime.now();
                            var formattedDate = DateFormat('kk:mm dd.MM.yyyy').format(now);
                            mealsConncetionService.createMeal(
                              MealDto(
                                  userId: userid,
                                  recipeId: snapshot.data!.recipesDto.recipes[selectedRecipe].id,
                                  orderDate: formattedDate,
                                  status: "ordered"),
                            );

                            snackbar.show(
                              context,
                              'Order send',
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Order',
                                style: TextStyle(fontSize: 28),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                );
                return Container();
              } else {
                print(snapshot.toString());
                return Text("Something went wrong ;/");
              }
          }
        });
  }
}
