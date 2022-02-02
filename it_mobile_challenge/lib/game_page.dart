import 'dart:async';
import 'package:get/get.dart';
import 'package:it_mobile_challenge/constants.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:it_mobile_challenge/player.dart';
import 'package:it_mobile_challenge/rank_list.dart';
class GamePage extends StatefulWidget {
  List<Player> players;
  GamePage({required this.players});

  @override
  _GamePageState createState() => _GamePageState(players);
}

class _GamePageState extends State<GamePage> {
  List<Player> players;
  _GamePageState( this.players);
  int index = 0;
  String buttonText = "Start";
  Random random = new Random();
  String randomNum = "";
  bool showBox = false;
  var minutes = 0 ;
  var seconds2 = 0 ;
  var milliSeconds = 0;
  Timer? timer2;
  Duration duration = Duration();
  Duration duration2 = Duration();
  String twoDigits(int n) => n.toString().padLeft(2,'0');
  void startTimer(){
    timer2 = Timer.periodic(Duration(milliseconds: 100), (_){
      setState(() {
        milliSeconds = milliSeconds + 1;
        if(milliSeconds % 10 == 0){
          seconds2 += 1;
        }
        duration = Duration(seconds: seconds2);
      });
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Center(
          child: Column(

            children: [
              Container(
                height: 70,
                decoration:BoxDecoration(
                  gradient: linearGradientColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(0.0, 1), //(x,y)
                      blurRadius: 4.0,
                    )
                  ],
                ),
                child:Row(
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
              ),
              SizedBox(height: 40 ,),
              Text(
                "${players[index].name}'s turn",
                style: TextStyle(fontSize: 35),
              ),
              SizedBox(height: 20 ,),
              Container(
                height: 160.0,
                width: 160.0,
                decoration:BoxDecoration(
                  gradient: linearGradientColor,

                ),
                child: showBox ? Image.asset("assets/Logo-MC-White.png",fit: BoxFit.contain,) : Text(''),
              ),
              SizedBox(height: 40 ,),
              Text(
                  "${twoDigits(duration.inMinutes.remainder(60))} : ${twoDigits(duration.inSeconds.remainder(60))} : ${twoDigits(milliSeconds.remainder(10))}",
                style: TextStyle(fontSize: 40),
              ),
              SizedBox(height: 20 ,),

              SizedBox(
                width: 200,
                height:  70.0,
                child: OutlinedButton(
                  onPressed: (){
                    Timer? timer;
                    if(buttonText == "Start"){
                      int randomNumber = random.nextInt(10)+1;
                      setState(() {
                        buttonText = "Watch out";
                      });
                      timer = Timer.periodic(Duration(seconds: 1), (timer){
                        randomNumber -= 1;
                        if (randomNumber == 0){
                          setState(() {
                            showBox = true;
                            buttonText = "Stop";
                            startTimer();
                          });
                        }
                      });
                    }
                    else{
                      if(buttonText == "Stop") {
                        timer2!.cancel();
                        setState(() {
                          players[index].minutes = duration.inMinutes;
                          players[index].seconds = duration.inSeconds;
                          players[index].milliseconds = milliSeconds;
                          buttonText = "Next player";
                        });
                      }
                      else{
                        if(buttonText == "Next player"){
                          if(index + 1 < players.length){
                            setState(() {
                              milliSeconds = 0;
                              seconds2 = 0;
                              duration = Duration(minutes : 0 ,seconds: 0);
                              showBox = false;
                              index += 1;
                              buttonText = "Start";
                            });
                          }else{
                            setState(() {
                              buttonText = "See ranking";
                            });
                          }
                        }else{
                          if(buttonText == "See ranking"){
                            setState(() {
                              players.sort((a, b) => (a.milliseconds + a.seconds * 10 + a.minutes*60*10).compareTo(b.milliseconds + b.seconds * 10 + b.minutes*60*10));
                              Get.to(RankList(players: players));
                            });
                          }
                        }
                      }
                    }
                    },
                  style: OutlinedButton.styleFrom(
                    shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0),),
                    side: BorderSide(width: 3.0, color:Color.fromRGBO(0, 215, 172 , 1)),
                  ),

                  child: Text(
                    "${buttonText}",
                    style: TextStyle(fontSize: 20,color: Color.fromRGBO(0, 215, 172 , 1)),
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
