import 'package:book_app/data/res.dart';
import 'package:book_app/home_page.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectIndex = 0 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectIndex],
      bottomNavigationBar: BottomNavigationBar(

        backgroundColor: Colors.white,
        selectedItemColor:primaryColor ,
        unselectedItemColor: Colors.blueGrey,
        elevation: 3,

        currentIndex: selectIndex,
        onTap: (index){
         setState(() {
           selectIndex = index;
         });
        },

        items: [
          BottomNavigationBarItem(icon:Icon( iconNavBar[0]),label: 'Home'),
          BottomNavigationBarItem(icon:Icon( iconNavBar[1]),label: 'Search'),
          BottomNavigationBarItem(icon:Icon( iconNavBar[2]),label: 'Library'),
          BottomNavigationBarItem(icon:Icon( iconNavBar[3]),label: 'Account'),

        ],
      ),
    );
  }
}
