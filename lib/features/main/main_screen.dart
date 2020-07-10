import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/features/github/list/github_list_screen.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedTab = 0;

  Widget _getSelectedScreen(int index) {
    if (_selectedTab == 0) {
      return GithubListScreen();
    } else {
      return GithubListScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App title"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            title: Text("Tab1"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            title: Text("Tab2"),
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedTab = index;
          });
        },
      ),
      body: _getSelectedScreen(_selectedTab),
    );
  }
}
