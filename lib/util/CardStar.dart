import 'package:flutter/material.dart';

class CardStar extends StatelessWidget {
  const CardStar({
    super.key,
    required this.color,
    required this.icon,
    required this.content,
  });

  final Color color;
  final IconData icon;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: color.withOpacity(0.3)),
      //popular
      child:  Row(
        children: [
          Row(

            children: [
              Icon(
                icon,
                size: 16,
                color: color,
              ),
             const SizedBox(width: 4),
              Text(
                content,
                style: TextStyle(color:color,fontSize: 12),
              )
            ],
          ),
        ],
      ),
    );
  }
}
