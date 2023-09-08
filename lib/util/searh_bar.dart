import 'package:flutter/material.dart';

import '../data/res.dart';
class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({
    super.key,
    required this.width,
    required this.height,
    required this.falg,
  });
  final bool falg;
  final double width;
  final double height;

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: widget.width*0.8,
          height: widget.height*0.06,
          decoration: BoxDecoration(color: primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(32),
          ),
          child: Row(
            children: [SizedBox(width: widget.width*0.05,),
              const Icon(Icons.search_rounded,size: 32,),
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search Book',
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),

                ),
              ),

            ],
          ),
        ),
        SizedBox(width: 2),
        IconButton(onPressed: (){
          setState(() {

          });

        }, icon: Icon(Icons.compare_arrows))
      ],
    );
  }
}
