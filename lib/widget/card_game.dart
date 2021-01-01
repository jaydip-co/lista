

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'dart:math'as math;

class CardGame extends StatefulWidget {
  final Function function;

  const CardGame({Key key, this.function}) : super(key: key);
  @override
  _CardGameState createState() => _CardGameState();
}

class _CardGameState extends State<CardGame> with SingleTickerProviderStateMixin{
  AnimationController controller;
  Animation<double> AnticlockWis;
  Animation<double> Anticlock2;
  double x1 = -0.5,x2 = 0,x3 = 0.5,y1 = 0,y2 = 0,y3=0;
  GlobalKey<FlipCardState> key1 = GlobalKey();
  GlobalKey<FlipCardState> key2 = GlobalKey();
  GlobalKey<FlipCardState> key3 = GlobalKey();
  double currentRadius = 0;
  int turn;
  bool isNormal;
  bool isminus;
  int rotationCount = 0;
  bool isFreshGame = true;
  bool isSelected = false;
  int selected = 0;
  bool isRunning = false;
  int win = 0;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(milliseconds: 700),
      vsync: this,
    );
    AnticlockWis  = Tween<double>(begin: 0,end: 1 * math.pi).animate(controller)..addListener(() {

        calulate(turn);


      setState(() {
      });
    });
    AnticlockWis..addStatusListener((status) {
      if(status == AnimationStatus.completed){
        if(rotationCount <6){
          rotate();
          rotationCount++;
        }
        else{
          rotationCount =0;
          isFreshGame = false;
        }
      }
    });
    Anticlock2  = Tween<double>(begin: 1*math.pi,end: 2*math.pi).animate(controller)..addListener(() {
    });

  }
  void calulate(int turn){
    switch(turn){
      case 0:{
        if (isNormal) {
          double newx1 = math.cos(Anticlock2.value) * currentRadius;
          double newy1 = math.sin(Anticlock2.value) * currentRadius;
          double newx2 = math.cos(AnticlockWis.value) * currentRadius;
          double newy2 = math.sin(AnticlockWis.value) * currentRadius;
          x1 = newx1;
          x2 = newx2;
          y1 = newy1;
          y2 = newy2;
          if(currentRadius < 0.5){
            if(isminus){
              x2 = x2 - currentRadius;
              x1 = x1 - currentRadius;
            }
            else {
              x2 = x2 + currentRadius;
              x1 = x1 + currentRadius;
            }

          }
          break;
        }
        else {
          double newx1 = math.cos(AnticlockWis.value) * currentRadius;
          double newy1 = math.sin(AnticlockWis.value) * currentRadius;
          double newx2 = math.cos(Anticlock2.value) * currentRadius;
          double newy2 = math.sin(Anticlock2.value) * currentRadius;
          x1 = newx1;
          x2 = newx2;
          y1 = newy1;
          y2 = newy2;
          if(currentRadius < 0.5){
            if(isminus){
              x2 = x2 - currentRadius;
              x1 = x1 - currentRadius;
            }
            else{
              x2 = x2 + currentRadius;
              x1 = x1 + currentRadius;
            }

          }
          break;
        }
        break;
      }
      case 1:{
        if(isNormal){
          double newx1 = math.cos(Anticlock2.value)*currentRadius;
          double newy1 = math.sin(Anticlock2.value)*currentRadius;
          double newx2 = math.cos(AnticlockWis.value)*currentRadius;
          double newy2 = math.sin(AnticlockWis.value)*currentRadius;
          x1 = newx1;
          x3 = newx2;
          y1 = newy1;
          y3 = newy2;
          if(currentRadius < 0.5){
            if(isminus){
              x3 = x3 - currentRadius;
              x1 = x1 - currentRadius;
            }
            else {
              x3 = x3 + currentRadius;
              x1 = x1 + currentRadius;
            }

          }
          break;
        }
        else{
          double newx1 = math.cos(AnticlockWis.value)*currentRadius;
          double newy1 = math.sin(AnticlockWis.value)*currentRadius;
          double newx2 = math.cos(Anticlock2.value)*currentRadius;
          double newy2 = math.sin(Anticlock2.value)*currentRadius;
          x1 = newx1;
          x3 = newx2;
          y1 = newy1;
          y3 = newy2;
          if(currentRadius < 0.5){
            if(isminus){
              x3 = x3 - currentRadius;
              x1 = x1 - currentRadius;
            }
            else {
              x3 = x3 + currentRadius;
              x1 = x1 + currentRadius;
            }

          }
          break;

        }
        break;


      }
      case 2:{
        if(isNormal){
          double newx1 = math.cos(Anticlock2.value)*currentRadius;
          double newy1 = math.sin(Anticlock2.value)*currentRadius;
          double newx2 = math.cos(AnticlockWis.value)*currentRadius;
          double newy2 = math.sin(AnticlockWis.value)*currentRadius;
          x2 = newx1;
          x3 = newx2;
          y2 = newy1;
          y3 = newy2;
          if(currentRadius < 0.5){
            if(isminus){
              x3 = x3 - currentRadius;
              x2 = x2 - currentRadius;
            }
            else {
              x3 = x3 + currentRadius;
              x2 = x2 + currentRadius;
            }

          }
          break;
        }
        else{
          double newx1 = math.cos(AnticlockWis.value)*currentRadius;
          double newy1 = math.sin(AnticlockWis.value)*currentRadius;
          double newx2 = math.cos(Anticlock2.value)*currentRadius;
          double newy2 = math.sin(Anticlock2.value)*currentRadius;
          x2 = newx1;
          x3 = newx2;
          y2 = newy1;
          y3 = newy2;
          if(currentRadius < 0.5){
            if(isminus){
              x3 = x3 - currentRadius;
              x2 = x2 - currentRadius;
            }
            else{
              x3 = x3 + currentRadius;
              x2 = x2 + currentRadius;
            }

          }
          break;

        }


      }
    }

  }
  void rotationAgain(){

  }
  BoxShadow getBoxShadow(int a){
    switch(a){
      case -1:
        return BoxShadow(
          color: Colors.red,
          blurRadius: 25,
          spreadRadius: 15,
        );
      case 0:
        return  BoxShadow(
          color: Colors.white,
          blurRadius: 25,
          spreadRadius: 15,
        );
      case 1:
        return  BoxShadow(
          color: Colors.green,
          blurRadius: 25,
          spreadRadius: 15,
        );
    }
  }

  void rotate(){
    isRunning = true;

    math.Random random = math.Random();
    turn = random.nextInt(3);
    switch(turn){
      case 0 :{
        currentRadius = (x1 - x2).abs()/2;
        print(currentRadius.toString());
        if(x1 < x2){
          isNormal = true;
          if(x2 == 0){
            isminus = true;
          }
          else if(x1 == 0){
            isminus = false;
          }
        }
        else{
          isNormal = false;
          if(x2 == 0){
            isminus = false;
          }
          else if(x1 == 0){
            isminus = true;
          }
        }

        break;
      }
      case 1:{
        currentRadius = (x1 - x3).abs()/2;
        if(x1 < x3){
          isNormal = true;
          if(x3 == 0){
            isminus = true;
          }
          else if(x1 == 0){
            isminus = false;
          }
        }
        else{
          isNormal = false;
          if(x3 == 0){
            isminus = false;
          }
          else if(x1 == 0){
            isminus = true;
          }
        }
        break;
      }
      case 2:{
        currentRadius = (x2 - x3).abs()/2;
        if(x2 < x3){
          isNormal = true;
          if(x2 == 0){
            isminus = false;
          }
          else if(x3 == 0){
            isminus = true;
          }
        }
        else{
          isNormal = false;
          if(x2 == 0){
            isminus = true;
          }
          else if(x3 == 0){
            isminus = false;
          }
        }
        break;
      }
    }
    controller.forward(from: 0);
  }

  void flipCard(){
    key1.currentState.toggleCard();
    key2.currentState.toggleCard();
    key3.currentState.toggleCard();
    key1.currentState.controller..addStatusListener((status) {
      if(isFreshGame){
      if(status== AnimationStatus.completed){
        rotate();
      }
    }
    }
    );

  }

  @override
  Widget build(BuildContext context) {
    double cardWidth = MediaQuery.of(context).size.width * 0.1;
    double cardHeight = MediaQuery.of(context).size.height * 0.1;

    return Align(
      alignment: Alignment.lerp(Alignment.topCenter, Alignment.bottomCenter, .15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("HERRAMIENTA",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w800
            ),),
          SizedBox(height: 40,),
          // Text("Follow the  Card",
          //   style: TextStyle(
          //       fontSize: 20,
          //       color: Colors.red,
          //       fontWeight: FontWeight.w800
          //   ),),
          // SizedBox(height: 20,),
          Card(
            shadowColor: Colors.green,
            elevation: 5,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width:  MediaQuery.of(context).size.width * 0.61,
              decoration: BoxDecoration(
                boxShadow: [
                     getBoxShadow(win),
                ],
                image: DecorationImage(
                  image: AssetImage("asset/Module3/carpet.png",),
                  fit: BoxFit.fill
                ),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: (){
                        widget.function();
                      },
                      icon: Icon(Icons.cancel_rounded),
                      color: Colors.red,
                      iconSize: 30,
                    ),
                  ),

                  Align(
                      alignment: Alignment(x1,y1),
                      child: FlipCard(
                        flipOnTouch: false,
                        key: key1,
                        front:  Container(
                          height: cardHeight,
                          width: cardWidth,
                          child: Image.asset("asset/Module3/ace.png",fit: BoxFit.fill,),
                          // color: Colors.yellow,
                        ),
                        back:  GestureDetector(
                          onTap: (){
                            if(AnticlockWis.isCompleted && !isSelected){
                              key1.currentState.toggleCard();
                              key2.currentState.toggleCard();
                              key3.currentState.toggleCard();
                              isSelected = true;
                              selected = 1;
                              isRunning = false;
                              setState(() {
                              win = 1;
                              });
                            }
                          },
                          child: Container(
                            height: cardHeight,
                            width: cardWidth,
                            child: Image.asset("asset/Module3/cardback.png",fit: BoxFit.fill,),
                            // color: Colors.pink,
                          ),
                        ),
                      )
                  ),
                  Align(
                      alignment: Alignment(x2,y2),
                      child: FlipCard(
                        flipOnTouch: false,
                        key: key2,
                        front: Container(
                          height: cardHeight,
                          width: cardWidth,
                          child: Image.asset("asset/Module3/king.png",fit: BoxFit.fill,),
                          // color: Colors.green,
                        ),
                        back: GestureDetector(
                          onTap: (){
                            if(AnticlockWis.isCompleted && !isSelected){
                              key1.currentState.toggleCard();
                              key2.currentState.toggleCard();
                              key3.currentState.toggleCard();
                              isSelected = true;
                              selected = 2;
                              isRunning = false;
                                setState(() {
                                win = -1;
                                });
                            }
                          },
                          child: Container(
                            height: cardHeight,
                            width: cardWidth,
                            // color: Colors.pink,
                            child: Image.asset("asset/Module3/cardback.png",fit: BoxFit.fill,),
                            // child: Image.asset("asset/ace.png",fit: BoxFit.fill,),
                          ),
                        ),
                      )
                  ),
                  Align(
                      alignment: Alignment(x3,y3),
                      child: FlipCard(
                        flipOnTouch: false,
                        key: key3,
                        front: Container(
                          height: cardHeight,
                          width: cardWidth,
                          child:  Image.asset("asset/Module3/king.png",fit: BoxFit.fill,),
                          // color: Colors.red,
                        ),
                        back: GestureDetector(
                          onTap: (){
                            if(AnticlockWis.isCompleted && !isSelected){
                              key1.currentState.toggleCard();
                              key2.currentState.toggleCard();
                              key3.currentState.toggleCard();
                              isSelected = true;
                              selected = 3;
                              isRunning = false;
                              setState(() {
                                win = -1;
                              });
                            }
                          },
                          child: Container(
                            height: cardHeight,
                            width: cardWidth,
                            // color: Colors.pink,
                            child: Image.asset("asset/Module3/cardback.png",fit: BoxFit.fill,),
                          ),
                        ),
                      )
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                      onPressed: () {
                      if(!isRunning){
                        isFreshGame = true;
                        win = 0;
                        isSelected = false;
                        selected = 0;
                        // rotate();
                        flipCard();
                      }


                       // sleep(Duration(seconds: 1));
                      },
                      icon: Icon(isRunning ? Icons.pause_circle_filled : Icons.play_circle_fill,
                        color: Color(0xff9aabc8),
                        size: 30,
                      )
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
