import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_mobile_challenge/player.dart';
import 'package:it_mobile_challenge/player_card2.dart';
import 'package:it_mobile_challenge/constants.dart';
import 'package:it_mobile_challenge/player_list.dart';
import 'package:it_mobile_challenge/question.dart';
class RankList extends StatefulWidget {
  List<Player> players;
  RankList({required this.players});

  @override
  _RankListState createState() => _RankListState(players);
}

class _RankListState extends State<RankList> {
  List<Player> players;
  _RankListState( this.players);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Colors.grey[200],
        actions: [
          Container(
            width: 410,
            decoration: BoxDecoration(gradient: linearGradientColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/Logo-MC-White.png',
                  fit: BoxFit.contain,

                ),
                Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Speed',
                      style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w600),
                    ))
              ],
            ),
          )
        ],
      ),
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                  children: players.map((player) {
                    return PlayerCard2(
                        player : player,
                        rank: players.indexOf(player) + 1,
                    );
                  }).toList()
              ),
              SizedBox(height: 20 ,),
              Padding(
                padding: const EdgeInsets.fromLTRB(70, 0, 70, 0),
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(PlayeList(players: players));
                  },
                  style: buttonStyleGradient,
                  child: Ink(
                    decoration: decorationGradient,
                    child: Container(
                      constraints: const BoxConstraints(minWidth: 50, minHeight: 50.0), // min sizes for Material buttons
                      alignment: Alignment.center,
                      child:  Text(
                        'Restart',
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
