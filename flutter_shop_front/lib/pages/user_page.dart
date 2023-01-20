import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, color: Colors.white);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: ',
      style: optionStyle,
    ),
    Text(
      'Index 1: ',
      style: optionStyle,
    ),
    Text(
      'Index 2: ',
      style: optionStyle,
    ),
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
        title: const Text("Shop App Frontend - User View"),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          TitleTile(),
          Expanded(
            child: ListView(
              children: [
                NewWidget(widgetOptions: _widgetOptions, selectedIndex: _selectedIndex),
                NewWidget(widgetOptions: _widgetOptions, selectedIndex: _selectedIndex),
                NewWidget(widgetOptions: _widgetOptions, selectedIndex: _selectedIndex),
                NewWidget(widgetOptions: _widgetOptions, selectedIndex: _selectedIndex),
                NewWidget(widgetOptions: _widgetOptions, selectedIndex: _selectedIndex),
                NewWidget(widgetOptions: _widgetOptions, selectedIndex: _selectedIndex),
                NewWidget(widgetOptions: _widgetOptions, selectedIndex: _selectedIndex),
                NewWidget(widgetOptions: _widgetOptions, selectedIndex: _selectedIndex),
                NewWidget(widgetOptions: _widgetOptions, selectedIndex: _selectedIndex),
                NewWidget(widgetOptions: _widgetOptions, selectedIndex: _selectedIndex),
                NewWidget(widgetOptions: _widgetOptions, selectedIndex: _selectedIndex),
                NewWidget(widgetOptions: _widgetOptions, selectedIndex: _selectedIndex),
                NewWidget(widgetOptions: _widgetOptions, selectedIndex: _selectedIndex),
                NewWidget(widgetOptions: _widgetOptions, selectedIndex: _selectedIndex),
                NewWidget(widgetOptions: _widgetOptions, selectedIndex: _selectedIndex),
              ],
            ),
          ),
        ],
      ),
      //body: NewWidget(widgetOptions: _widgetOptions, selectedIndex: _selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dining),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Order History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
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
