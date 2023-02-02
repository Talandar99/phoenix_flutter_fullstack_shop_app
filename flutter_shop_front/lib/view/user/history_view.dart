import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../web_api/dto/order_view_ready_dto.dart';
import '../../web_api/services/connection/meals_connection_service.dart';
import '../../web_api/services/orders_view_ready_service.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({super.key});

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

@override
class _HistoryViewState extends State<HistoryView> {
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
                    if ((snapshot.data![index].currentUser == snapshot.data![index].accountDto.email) &&
                        snapshot.data![index].status == "odebrane") {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          height: 100,
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
                                ],
                              ),
                              Column(
                                children: [
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
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return Container();
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
