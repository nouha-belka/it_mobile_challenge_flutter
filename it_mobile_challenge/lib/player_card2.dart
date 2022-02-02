import 'package:flutter/material.dart';
import 'package:it_mobile_challenge/constants.dart';
import 'package:it_mobile_challenge/player.dart';
class PlayerCard2 extends StatelessWidget {
  final Player player;
  final int rank ;
  PlayerCard2({required this.player,required this.rank});
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
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    gradient: linearGradientColor,
                    borderRadius: BorderRadius.all(Radius.circular(60)),
                  ),
                  child: Center(child: Text(""
                      "${this.rank}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  )),
                ),
                SizedBox(width: 20,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                  ],
                )
              ],
            ),


          ],
        ),

      ),
    );
  }
}
