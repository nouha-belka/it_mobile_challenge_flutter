import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_mobile_challenge/game_page.dart';
import 'package:it_mobile_challenge/home_page.dart';
import 'package:it_mobile_challenge/player_list.dart';
import 'package:it_mobile_challenge/question.dart';
import 'package:it_mobile_challenge/rank_list.dart';
import 'package:it_mobile_challenge/player.dart';
void main() {
  List<Player> players = [
    Player(name: "nouha",minutes: 5,),
    Player(name: "mohamed",minutes: 2,milliseconds: 9),
    Player(name: "aroua",minutes: 1,seconds: 55,milliseconds: 5),

  ];
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home:  HomePage(),
  )
  );
}


