import 'package:flutter/material.dart';
import 'package:litera/screens/home_screen.dart';
import 'package:litera/screens/history_screen.dart';
import 'package:litera/screens/saved_screen.dart';

class MainScreen extends StatefulWidget{
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> pages = [
    const HomeScreen(),
    const SavedScreen(),
    const HistoryScreen()
  ];
  int currentPage = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (value){
          setState(() {
            currentPage = value;
          });
        },
        items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.bookmark),
                label: "Saved"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.history_rounded),
                label: "History"
            )
        ]
        ),

    );
  }
}