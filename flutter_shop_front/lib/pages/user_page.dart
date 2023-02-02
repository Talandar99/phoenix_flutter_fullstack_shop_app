import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../persistant_storage/persistant_storage.dart';
import '../view/user/history_view.dart';
import '../view/user/new_order_view.dart';
import '../view/user/orders_view.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    OrdersView(),
    HistoryView(),
    NewOrderView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final PersistentStorage persistentStorage = GetIt.I<PersistentStorage>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Client"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dining),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Order history',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.new_label),
            label: 'New Order',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
