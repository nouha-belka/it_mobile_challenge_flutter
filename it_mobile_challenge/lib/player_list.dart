import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_mobile_challenge/game_page.dart';
import 'package:it_mobile_challenge/player.dart';
import 'package:it_mobile_challenge/player_card.dart';
import 'package:it_mobile_challenge/constants.dart';

class PlayeList extends StatefulWidget {
  List<Player> players;
  PlayeList({required this.players});

  @override
  _PlayeListState createState() => _PlayeListState(players);
}

class _PlayeListState extends State<PlayeList> {
  List<Player> players;
  _PlayeListState( this.players);
  TextEditingController _nameCtrl =   TextEditingController();
  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel(){
      showModalBottomSheet(context: context, builder: (context){
        return Container(
          height: 500,
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 20,horizontal: 60),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10,),
                TextField(
                  decoration: InputDecoration(hintText: "Player Name", hintStyle: TextStyle(fontSize: 20,color: Color.fromRGBO(0, 215, 172 , 1)),  ),
                  controller: _nameCtrl,
                  style: TextStyle(fontSize: 20,color: Color.fromRGBO(0, 215, 172 , 1)),
                ),
                SizedBox(height: 20,),
                SizedBox(
                  width: 170,
                  height:  50,
                  child: OutlinedButton(
                    onPressed: (){
                      setState(() {
                        players.add(Player(name: _nameCtrl.text));
                        Navigator.pop(context);
                      });

                    },
                    style: outlinedButtonStyle,
                    child: Text(
                      "Add",
                      style: TextStyle(fontSize: 20,color: Color.fromRGBO(0, 215, 172 , 1)),
                    ),
                  ),
                ),

            ],),
          ),
        );
      });
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 215, 172 , 1),
        actions: [
          Container(
            width: 410,
            decoration: BoxDecoration(gradient: linearGradientColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: (){
                    Get.to(GamePage(players: players,));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                    child: Text("start game",style: TextStyle(color: Colors.white, fontSize: 20),),
                  ),
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(0, 0, 0 , 0.3))),
                ),

                TextButton(
                  onPressed: () => _showSettingsPanel(),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                    child: Text("Add Player",style: TextStyle(color: Colors.white, fontSize: 20),),
                  ),
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(0, 0, 0 , 0.3))),
                ),
              ],
            ),
          ),


        ],
      ),
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              Column(
                children: players.map((player) {
                  return PlayerCard(
                      player : player,
                      delete :() {
                        setState(() {
                          players.remove(player);
                        });
                      }
                      );
                }).toList()
              ),
            ],
          ),
        ),
      ),
    );
  }
}
