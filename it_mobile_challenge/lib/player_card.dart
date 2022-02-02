import 'package:flutter/material.dart';
import 'package:it_mobile_challenge/constants.dart';
import 'package:it_mobile_challenge/player.dart';
class PlayerCard extends StatelessWidget {

  final Player player;
  final Function delete;
  PlayerCard({required this.player, required this.delete,
  });
  String twoDigits(int n) => n.toString().padLeft(2,'0');


  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Padding(
        padding : EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Text(
                "${player.name}",
              style: TextStyle(
                fontSize: 17,
                color: Color.fromRGBO(0, 215, 172 , 1),
              ),
            ),
            SizedBox(height: 6,),
            Text(
              "${twoDigits(this.player.minutes)} : ${twoDigits(this.player.seconds)} : ${twoDigits(this.player.milliseconds)}",
              style: TextStyle(
                fontSize: 17,
                color: Color.fromRGBO(19, 14, 14, 1.0),
              ),
            ),
            SizedBox(height: 6,),
            TextButton.icon(
              // ignore: unnecessary_statements
              onPressed: () => delete(),
              label: Text(
                'Delete player',
                style: TextStyle(fontSize: 17,color : Color.fromRGBO(0, 215, 172 , 1)),
              ),
              icon: Icon(Icons.delete , color: Color.fromRGBO(0, 215, 172 , 1)),
            )
          ],
        ),

      ),
    );
  }
}
