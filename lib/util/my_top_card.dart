import 'package:flutter/material.dart';


class MyTopCard extends StatelessWidget {
  const MyTopCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.only(top: 24,left: 16,right: 16,),
      decoration: BoxDecoration(color: Colors.amber[100],borderRadius: BorderRadius.circular(16),),
      height: 180,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          Icon(Icons.local_fire_department,size: 22,color: Color.fromARGB(128, 183, 151, 56),),
                          SizedBox(width: 4),
                          Text('Popular',style: TextStyle(color:  Color.fromARGB(233, 183, 151, 56)),)
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'The Psychology \n Of Money',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Morgan Housel (2020)',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              ),
              const SizedBox(height: 8),
              const Text(
                'Read More',
                style: TextStyle(color: Colors.amber),
              ),
            ],
          ),
          Image.network(
            'https://d2sofvawe08yqg.cloudfront.net/thepsychologyofmoney/s_hero?1657640958',
            width: 150),
        ],
      ),
    );
  }
}
