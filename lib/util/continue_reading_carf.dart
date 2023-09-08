
import 'package:book_app/data/res.dart';
import 'package:book_app/util/CardStar.dart';
import 'package:flutter/material.dart';

class ContinueReadingCard extends StatelessWidget {
  const ContinueReadingCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),

      child: Container(

        width: 329,
        margin: EdgeInsets.all(16),
        child: Row(
          children: [
            Image.network(imageSrc,width: 128,),
            SizedBox(width: 8),
            Column(
              children: [

                Row(
                  children: [
                    CardStar(color: primaryColor, icon: Icons.star, content: '4.4'),
                    SizedBox(width: 64,),
                    CardStar(color: Colors.blueGrey, icon: Icons.book, content: ''),
                    SizedBox(width: 8),
                    CardStar(color: Colors.amber, icon: Icons.cabin, content: ''),

                  ],
                ),
                SizedBox(height: 16,),

                Container(
                  width: 144,
                  child: const Text(
                    'The Psychology  Of Money',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    overflow: TextOverflow.ellipsis,),
                ),
                SizedBox(height: 8),

                Container(
                  width: 144,
                  child:  const Text(
                    'Morgan Housel ',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey),
                  ),
                ),
                Container(
                  width: 188,
                  child: Slider(
                      activeColor: primaryColor,
                      mouseCursor: MouseCursor.defer,
                      min: 0,
                      max: 100,
                      value: 60, onChanged: (val){}),
                )

              ],
            )
          ],
        ),
      ),
    );
  }
}
