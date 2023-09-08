import 'package:book_app/data/res.dart';
import 'package:book_app/util/CardStar.dart';
import 'package:book_app/util/book_card.dart';
import 'package:book_app/util/continue_reading_carf.dart';
import 'package:flutter/material.dart';
import 'package:book_app/util/my_top_card.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    final _controler = PageController();
    final List<String> type = [
      'All Genre',
      'Comedy',
      'Fiction',
      'Romance',
      'Action',
      'Self development'
    ];

    return Scaffold(
      backgroundColor: Color(0xffFAFAFA),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 200,
              child: PageView(
                  controller: _controler,
                  scrollDirection: Axis.horizontal,
                  children: const [
                    MyTopCard(),
                    MyTopCard(),
                    MyTopCard(),
                    MyTopCard(),
                    MyTopCard(),
                    MyTopCard(),
                  ]),
            ),
            const SizedBox(height: 4),
            SmoothPageIndicator(
              controller: _controler,
              count: 6,
              effect: const ExpandingDotsEffect(
                activeDotColor: Color.fromARGB(223, 183, 151, 56),
                dotHeight: 12,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              height: 48,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: type.length,
                itemBuilder: (ctx, index) => InkWell(
                  onTap: () {
                    setState(() {
                      selectIndex = index;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.all(16),
                    child: Text(
                      type[index],
                      style: TextStyle(
                          color: index == selectIndex
                              ? const Color.fromARGB(223, 183, 151, 56)
                              : Colors.blueGrey),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Container(
              margin: EdgeInsets.all(8),
              height: 228,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  BookCard(),
                  BookCard(),
                  BookCard(),
                  BookCard(),
                  BookCard(),
                  BookCard(),
                ],
              ),
            ),
            const SizedBox(height: 8),
            const Row(
              children: [
                SizedBox(width: 16),
                Text('Continue Reading',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    textAlign: TextAlign.start),
              ],
            ),
            SizedBox(height: 16,),
            Container(
              height: 172,
              child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) => const ContinueReadingCard(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
