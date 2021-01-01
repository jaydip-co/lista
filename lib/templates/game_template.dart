import 'package:flutter/material.dart';
import 'package:lista/templates/description.dart';
import 'package:lista/templates/namepage.dart';
import 'package:lista/templates/resultpage.dart';
import 'package:lista/templates/text_to_speech.dart';

class GameTemplate extends StatefulWidget {

  final Color color;
  final String name;
  final String title;
  final String icon;
  final String image;
  final String data;
  final String discription;
  final Widget gamemode;
  const GameTemplate({Key key,@required this.color,@required this.name,@required this.title, @required this.icon,@required this.image,@required this.data,@required this.discription,@required this.gamemode}) : super(key: key);

  @override
  _GameTemplateState createState() => _GameTemplateState();
}

class _GameTemplateState extends State<GameTemplate> {

  final _controller  = PageController(initialPage: 0);
  TextToSpeech textToSpeech = TextToSpeech();
  int index = 0;

  @override
  void initState() {
    _controller.addListener(() {
      if(_controller.page < index)
        _controller.jumpToPage(index);
      if(_controller.page == 1){
        textToSpeech.setData(widget.title);
        textToSpeech.speak();
        textToSpeech.setData(widget.data);
        textToSpeech.speak();
      }
      if(_controller.page >= 1.5){
        textToSpeech.stop();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      children: [
        NamePage(color: widget.color, icon: widget.icon,name: widget.name,image: widget.image,),
        DescriptionPage(color: widget.color,icon: widget.icon,title: widget.title,data: widget.discription, image: widget.image,),
        widget.gamemode,
        ResultPage(color: widget.color,icon: widget.icon,data: widget.data,)
      ],
      onPageChanged: (i) {
        index = i;
      },
    );
  }
}
