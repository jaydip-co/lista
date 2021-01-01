

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lista/templates/clip_rect.dart';
import 'package:lista/widget/calculation_game.dart';
import 'package:lista/widget/card_game.dart';
import 'package:lista/widget/image_button.dart';


class GamePage extends StatelessWidget {
  final String image;
  final String icon;
  final Color color;

  GamePage(
      {Key key,
        @required this.icon,
        @required this.color,
        @required this.image})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          height: size.height * 0.115,
          color: color,
          child: Column(
              children: [
                Expanded(child: Padding(
                  padding: const EdgeInsets.only(top:8.0),
                  child: Image.asset(
                      icon
                  ),
                )),
                Divider(
                  color: Colors.white,
                  thickness: 2,
                )
              ]
          ),
        ),
        Expanded(
          child: Stack(
            children: [
              ImageButton(size,size.height*0.77),
              ClipPath(
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          image: new DecorationImage(
                            fit: BoxFit.fill,
                            // colorFilter:
                            // ColorFilter.mode(Colors.purple.withOpacity(0.4),
                            //     BlendMode.colorDodge),
                            image: new AssetImage(
                                image
                            ),
                          )
                      ),
                    ),
                    Container(
                      color: color.withOpacity(0.7),
                    ),
                    Container(
                      color: Colors.white.withOpacity(0.3),
                    ),

                  ],
                ),
                clipper: CustomRect(),
              ),
              GameDisplay(),
            ],
          ),
        ),
      ],
    );
  }

}

class GameDisplay extends StatefulWidget {
  @override
  _GameDisplayState createState() => _GameDisplayState();
}

class _GameDisplayState extends State<GameDisplay> {

  int page = 0;


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if(page == 0){
      return Stack(
        children: [ Align(
            alignment: Alignment.lerp(Alignment.topCenter, Alignment.bottomCenter, .15),
            child: getSingleButton(size: size, text:'HABILIDAD',image:'asset/Module3/game_button.png',function: (){
              setState(() {
                page = 1;
              });
            })
        ),
          Align(
              alignment: Alignment.lerp(Alignment.topCenter, Alignment.bottomCenter, .60),
              child: getSingleButton(size: size,text: 'HERRAMIENTA',image: 'asset/Module3/cal_button.png',function: (){
                setState(() {
                  page = 2;
                });
              })
          )],
      );

    }
    if(page == 2){
      return CalculationGame(function: (){
        setState(() {
          page = 0;
        });
      },);
    }
    if(page == 1){
      return CardGame(function: (){
        setState(() {
          page = 0;
        });
      },);
    }



  }




  Widget getSingleButton({Size size,String text,String image,Function function}){
    return GestureDetector(
      onTap: (){
        function();
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              height: size.height*0.15,
              width: size.height*0.15,
              child: Image.asset(image,fit: BoxFit.cover,)),
          SizedBox(height: 10,),
          Text(text,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold
            ),)
        ],

      ),
    );

  }
}

