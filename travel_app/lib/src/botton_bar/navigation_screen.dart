import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NavigationScreen extends StatefulWidget {
  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      // extendBodyBehindAppBar: true,
      // backgroundColor: Colors.red,
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(40),
          topLeft: Radius.circular(40),
        ),
        child: BottomNavigationBar(
          selectedItemColor: Color(0xFF537EF1),
          unselectedItemColor: Colors.black87,
          onTap: onTabTapped,
          currentIndex: currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, size: 35),
              label: "",
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search, size: 35),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline, size: 35),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings_outlined,
                size: 35,
              ),
              label: "",
            ),
          ],
        ),
      ),
      body: widgetOptions.elementAt(currentIndex),
    );
  }

  int currentIndex = 0;
  List<Widget> widgetOptions = <Widget>[
    Text('data'),
    Text('data1'),
  ];

  onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
