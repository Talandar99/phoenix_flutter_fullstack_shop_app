import 'package:flutter/material.dart';
import 'package:shop_frontend/view/admin/ingredients_view.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Orders',
      style: optionStyle,
    ),
    Text(
      'Index 1: Recipes',
      style: optionStyle,
    ),
    IngredientsView()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shop App Frontend - Admin Page"),
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
            icon: Icon(Icons.history),
            label: 'Recipes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Ingredients',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key? key,
    required List<Widget> widgetOptions,
    required int selectedIndex,
  })  : _widgetOptions = widgetOptions,
        _selectedIndex = selectedIndex,
        super(key: key);

  final List<Widget> _widgetOptions;
  final int _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
          decoration: BoxDecoration(
            color: Colors.green[300],
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: TileContent()),
    );
  }
}

class TitleTile extends StatelessWidget {
  const TitleTile({super.key});
  @override
  Widget build(BuildContext context) {
    String nazwa = "Nazwa";
    String date = "      Data      ";
    String status = "Status";
    return Container(
      color: Colors.green[300],
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 10,
          top: 10,
          left: 30,
          right: 30,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  nazwa,
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                Text(
                  "|",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                Text(
                  date,
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                Text(
                  "|",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                Text(
                  status,
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TileContent extends StatelessWidget {
  const TileContent({super.key});
  @override
  Widget build(BuildContext context) {
    String nazwa = "Nazwa";
    String date = "00.00.0000";
    String status = "status";
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                nazwa,
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              Text(
                "|",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              Text(
                date,
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              Text(
                "|",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              Text(
                status,
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
