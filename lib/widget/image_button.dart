import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget ImageButton(Size size,double top_padding){
  return Row(
    children: [

      Column(
        children: [
          Padding(
            padding:  EdgeInsets.only(left:size.width*0.06,top: top_padding),
            child: GestureDetector(
              onTap: (){},
              child: Container(

                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blue,width: 3)
                ),
                child: Image.asset('asset/image/circle_girl.png',width: size.width/8,height: size.width/8),
              ),
            ),
          ),

          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left:16.0,bottom: 4),
              child: Center(
                child: RichText(
                  text: TextSpan(
                    text:'¿En que te puedo',
                    children: <TextSpan>[
                      TextSpan(
                        text: '\n\t\t\t\t\t\t\t\t\tayudar?'
                      )
                    ],
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.black
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      Column(
        children: [
          Padding(
            padding:  EdgeInsets.only(left:size.width*0.04,top: top_padding),
            child: GestureDetector(
              onTap: (){},
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.yellow,width: 1)
                ),
                child: Image.asset('asset/image/hint.png',width: size.width/8 + 4,height: size.width/8 + 4,fit: BoxFit.fill,),
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left:14.0,bottom: 4),
              child: Center(
                child: RichText(
                  text: TextSpan(
                    text:'¿Quieres aprender',
                    children: <TextSpan>[
                      TextSpan(
                          text: '\n\t\t\t\t\t\t\t\t\t\t\tmas?'
                      )
                    ],
                    style: TextStyle(
                        fontSize: 10,
                        color: Colors.black
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      )
    ],
  );
}