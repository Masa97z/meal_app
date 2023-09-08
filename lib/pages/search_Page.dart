import 'package:book_app/data/res.dart';
import 'package:book_app/util/searh_bar.dart';
import 'package:flutter/material.dart';
class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool flag = false;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(child: Container(
      padding:const EdgeInsets.all(16),
      color: packGroundColor,
      child: Column(
        children: [
          SearchBarWidget(width: width, height: height,falg :flag),

        ],
      ),
    ),

    );
  }
}
