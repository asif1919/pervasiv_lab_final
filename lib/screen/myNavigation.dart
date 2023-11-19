import 'package:flutter/material.dart';

import '../testScreen.dart';
import 'calculator/scientificCalculator.dart';
import 'Profile/protfolio_screen.dart';
import 'quizapp/screens/quiz_screen.dart';
import 'weather_Screen.dart';

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({super.key});

  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions =  [
    ScientificCalculator(),
   const QuizScreen(),
    const WeatherScreen(),
    PortfolioScreen(),
   // TestScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        
          items:   const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
            
              icon: Icon(Icons.calculate),
              label: "Calculator",
              backgroundColor: Color.fromARGB(255, 252, 146, 138),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.quick_contacts_mail),
              label: "Quiz",
                 backgroundColor: Colors.blueGrey,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.cloud),
              label: "Weather",
                  backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
                backgroundColor: Color.fromARGB(255, 73, 75, 77),
            ),
          ],
          type: BottomNavigationBarType.shifting,
          unselectedItemColor: Colors.white,
          
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.yellow,
          iconSize: 40,
          onTap: _onItemTapped,
          elevation: 5),
    );
  }
}
