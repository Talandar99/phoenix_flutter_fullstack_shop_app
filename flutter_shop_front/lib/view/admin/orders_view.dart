import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shop_frontend/web_api/dto/meal_dto.dart';
import '../../web_api/dto/meals_dto.dart';
import '../../web_api/dto/order_view_ready_dto.dart';
import '../../web_api/services/connection/meals_connection_service.dart';
import '../../web_api/services/orders_view_ready_service.dart';

class OrdersView extends StatefulWidget {
  const OrdersView({super.key});

  @override
  State<OrdersView> createState() => _OrdersViewState();
}

@override
class _OrdersViewState extends State<OrdersView> {
  final MealsConncetionService mealsConncetionService = GetIt.I<MealsConncetionService>();
  final OrdersViewReadyService ordersViewReadyService = GetIt.I<OrdersViewReadyService>();

  String dialogValue = "";

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<OrderViewReadyDto>>(
        future: ordersViewReadyService.getOrderViewReady(),
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
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    if (snapshot.data![index].status == "usunięte") {
                      return Container();
                    }
                    if (snapshot.data![index].status != "odebrane") {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration:
                              BoxDecoration(color: Colors.green, borderRadius: BorderRadius.all(Radius.circular(20))),
                          height: 150,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: const Text(
                                      "order date",
                                      textScaleFactor: 1.5,
                                      style: TextStyle(
                                        color: Colors.white60,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    snapshot.data![index].orderDate,
                                    textScaleFactor: 1.5,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: const Text(
                                      "client name",
                                      textScaleFactor: 1.5,
                                      style: TextStyle(
                                        color: Colors.white60,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    snapshot.data![index].accountDto.fullName,
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
                                      "Recipe title",
                                      textScaleFactor: 1.5,
                                      style: TextStyle(
                                        color: Colors.white60,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    snapshot.data![index].recipeDto.title,
                                    textScaleFactor: 1.5,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: const Text(
                                      "status",
                                      textScaleFactor: 1.5,
                                      style: TextStyle(
                                        color: Colors.white60,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        snapshot.data![index].status.toString(),
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
                                                          onPressed: () async {
                                                            mealsConncetionService.updateMeal(
                                                              snapshot.data![index].id.toString(),
                                                              MealDto(
                                                                id: snapshot.data![index].id.toString(),
                                                                userId: snapshot.data![index].accountDto.id,
                                                                recipeId: snapshot.data![index].recipeDto.id,
                                                                orderDate: snapshot.data![index].orderDate,
                                                                status: dialogValue,
                                                              ),
                                                            );
                                                            Navigator.of(context).pop();
                                                          }),
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
                    } else {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.green[800], borderRadius: BorderRadius.all(Radius.circular(20))),
                          height: 150,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: const Text(
                                      "order date",
                                      textScaleFactor: 1.5,
                                      style: TextStyle(
                                        color: Colors.white60,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    snapshot.data![index].orderDate,
                                    textScaleFactor: 1.5,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: const Text(
                                      "client name",
                                      textScaleFactor: 1.5,
                                      style: TextStyle(
                                        color: Colors.white60,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    snapshot.data![index].accountDto.fullName,
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
                                      "Recipe title",
                                      textScaleFactor: 1.5,
                                      style: TextStyle(
                                        color: Colors.white60,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    snapshot.data![index].recipeDto.title,
                                    textScaleFactor: 1.5,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: const Text(
                                      "status",
                                      textScaleFactor: 1.5,
                                      style: TextStyle(
                                        color: Colors.white60,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        snapshot.data![index].status.toString(),
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
                                                          onPressed: () async {
                                                            mealsConncetionService.updateMeal(
                                                              snapshot.data![index].id.toString(),
                                                              MealDto(
                                                                id: snapshot.data![index].id.toString(),
                                                                userId: snapshot.data![index].accountDto.id,
                                                                recipeId: snapshot.data![index].recipeDto.id,
                                                                orderDate: snapshot.data![index].orderDate,
                                                                status: dialogValue,
                                                              ),
                                                            );
                                                            Navigator.of(context).pop();
                                                          }),
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
                    }
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
