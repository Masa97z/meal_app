import 'package:book_app/home_page.dart';
import 'package:book_app/pages/library.dart';
import 'package:book_app/pages/profile_screen.dart';
import 'package:book_app/pages/search_Page.dart';
import 'package:flutter/material.dart';

const List<IconData> iconNavBar = [Icons.home_filled , Icons.search,Icons.book , Icons.person];
const Color primaryColor = Color.fromARGB(223, 183, 151, 56);
const String imageSrc =  'https://d2sofvawe08yqg.cloudfront.net/thepsychologyofmoney/s_hero?1657640958';
const List<Widget> pages = [HomePage(),SearchPage(),Library(),Profile()];