import 'package:assigment/presentations/pages/business_page.dart';
import 'package:assigment/presentations/pages/home_page.dart';
import 'package:assigment/presentations/pages/technology_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    HomePage(),
    const BusinessPage(),
    const TechnologyPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: const Padding(
          padding: EdgeInsets.only(top: 25.0),
          child: Text('News'),
        ),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.amber,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            activeIcon: Icon(Icons.home_outlined),
            label: 'Science',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_outlined),
            label: 'Technology',
          ),
        ],
      ),
    );
  }
}
