import 'package:book_app/data/res.dart';
import 'package:book_app/util/CardStar.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  const BookCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      width: 150,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(

          children: [
            Image.network(
                imageSrc,
                width: 140),
            const SizedBox(height: 8),
           Container(
             margin:const EdgeInsets.symmetric(horizontal: 8),
             child:const Column(
               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                  Text(
                   'The Psychology  Of Money',
                   style: TextStyle(
                     fontSize: 14,
                   ),
                   overflow: TextOverflow.ellipsis,
                 ),
                  SizedBox(height: 8),
                  Text(
                   'Morgan Housel ',
                   style: TextStyle(
                       fontSize: 12,
                       fontWeight: FontWeight.w500,
                       color: Colors.grey),
                 ),
                  Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: [
                     CardStar(
                         color: Color.fromARGB(233, 183, 151, 56),
                         content: '4.4  ',
                         icon: Icons.star),

                     CardStar(
                         color: Color.fromARGB(233, 148, 151, 201),
                         content: 'Packed  ',
                         icon: Icons.book),
                   ],
                 ),
               ],
             ),
           )
          ],
        ),
      ),
    );
  }
}
