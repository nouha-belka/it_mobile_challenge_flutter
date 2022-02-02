import 'package:flutter/material.dart';
var buttonStyleGradient = ButtonStyle(
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0),)
  ),
  padding:  MaterialStateProperty.all(EdgeInsets.all(0)),
);
const linearGradientColor = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Color.fromRGBO(0, 189, 204 , 1), Color.fromRGBO(0, 215, 172 , 1)]);
const decorationGradient = BoxDecoration(
  gradient: linearGradientColor,
  borderRadius: BorderRadius.all(Radius.circular(80.0)),
);

const containerDeco = BoxDecoration(
color: Colors.white,
boxShadow: [
BoxShadow(
color: Colors.black,
offset: Offset(0.0, 6), //(x,y)
blurRadius: 6.0,
)
],
borderRadius: BorderRadius.only(
bottomLeft: Radius.circular(60),
bottomRight: Radius.circular(60),
),
);

var textInputDeco = InputDecoration(
hintStyle: TextStyle(
color: Colors.grey[600],
fontSize: 15,
),
labelStyle: TextStyle(
  color: Color.fromRGBO(0, 189, 204 , 1),
  fontSize: 20
),
enabledBorder: OutlineInputBorder(
borderSide: BorderSide(color : Color.fromRGBO(0, 215, 172 , 1),width: 2),
borderRadius: BorderRadius.circular(15),
),
focusedBorder: OutlineInputBorder(
borderSide: BorderSide(color : Color.fromRGBO(0, 189, 204 , 1),width: 2),
borderRadius: BorderRadius.circular(15),
),

);

var outlinedButtonStyle = OutlinedButton.styleFrom(
  backgroundColor: Colors.white,
  shape:
  RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0),),
  side: BorderSide(width: 3.0, color:Color.fromRGBO(0, 215, 172 , 1)),
);
 Widget appBarCostume = Row(
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

 );