import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_mobile_challenge/constants.dart';
import 'package:it_mobile_challenge/question.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var name = "";
  var age = "";
  TextEditingController _nameCtrl =   TextEditingController();
  TextEditingController _ageCtrl =   TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(5),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            decoration: BoxDecoration(gradient: linearGradientColor),
            child: SafeArea(
              child: Column(
                children: [
                  Container(
                    decoration: containerDeco,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 5),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(0),
                            child: Image.asset("assets/MC_Logo.png"),
                          ),
                          TextField(
                            controller: _nameCtrl,
                            style: TextStyle(fontSize: 20,color: Color.fromRGBO(0, 215, 172 , 1)),
                            decoration: textInputDeco.copyWith(labelText: "Name",),
                            keyboardType: TextInputType.name,
                          ),
                          SizedBox(height: 20 ,),
                          TextField(
                            controller: _ageCtrl,
                            style: TextStyle(fontSize: 20,color: Color.fromRGBO(0, 215, 172 , 1)),
                            decoration:  textInputDeco.copyWith(labelText: "Age",),
                            keyboardType: TextInputType.number,
                          ),
                          SizedBox(height: 35 ,),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(45, 0, 45, 0),
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  name = _nameCtrl.text;
                                  age = _ageCtrl.text;
                                  Get.to(Question(name: name,));
                                });
                              },
                              style: buttonStyleGradient,
                              child: Ink(
                                decoration: decorationGradient,
                                child: Container(
                                  constraints: const BoxConstraints(minWidth: 50, minHeight: 70.0), // min sizes for Material buttons
                                  alignment: Alignment.center,
                                  child:  Text(
                                    'Log in ',
                                    style: TextStyle(fontSize: 20),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 30 ,),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 80 ,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
