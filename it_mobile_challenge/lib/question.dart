
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_mobile_challenge/constants.dart';
import 'package:it_mobile_challenge/game_page.dart';
import 'package:it_mobile_challenge/player.dart';
import 'package:it_mobile_challenge/player_list.dart';
class Question extends StatelessWidget {
  String name;
  Question({required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          SizedBox(height: 40 ,),
          Align(
            alignment: Alignment.topCenter,
            child: Text(
                "Do you want to\n play alone or\n with friends ?",
              style: TextStyle(
                fontSize: 50,
                color: Color.fromRGBO(0, 215, 172 , 1),
              ),
            ),
          ),
          SizedBox(height: 80 ,),
          Padding(
            padding: const EdgeInsets.fromLTRB(70, 0, 70, 0),
            child: ElevatedButton(
              onPressed: () {
                Get.to(GamePage(players: [Player(name : this.name)]));
              },
              style: buttonStyleGradient,
              child: Ink(
                decoration: decorationGradient,
                child: Container(
                  constraints: const BoxConstraints(minWidth: 50, minHeight: 70.0), // min sizes for Material buttons
                  alignment: Alignment.center,
                  child:  Text(
                    'Alone',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 50 ,),
          Padding(
            padding: const EdgeInsets.fromLTRB(70, 0, 70, 0),
            child: SizedBox(
              width: 600,
              height:  70.0,
              child: OutlinedButton(
                onPressed: (){
                  Get.to(PlayeList(players: [Player(name : this.name)]));
                },
                style: OutlinedButton.styleFrom(
                  shape:
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0),),
                  side: BorderSide(width: 3.0, color:Color.fromRGBO(0, 215, 172 , 1)),
                ),

                child: Text(
                    "with friends",
                  style: TextStyle(fontSize: 20,color: Color.fromRGBO(0, 215, 172 , 1)),
                ),
              ),
            ),
          )
        ],),
      ),
    );
  }
}
