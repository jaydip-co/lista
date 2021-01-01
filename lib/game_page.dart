import 'package:flutter/material.dart';
import 'package:lista/templates/clip_rect.dart';
import 'package:lista/widget/image_button.dart';
class GamePage extends StatefulWidget {
  final String data;
  final String image;
  final String icon;
  final Color color;
  final String title;

  const GamePage({Key key, this.data, this.image, this.icon, this.color, this.title}) : super(key: key);
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: size.height * 0.115,
          color:widget.color,
          child: Column(
              children: [
                Expanded(child: Padding(
                  padding: const EdgeInsets.only(top:8.0),
                  child: Image.asset(
                     widget.icon
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
              ImageButton(size,size.height*0.755),
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
                                widget.image
                            ),
                          )
                      ),
                    ),
                    Container(
                      color: widget.color.withOpacity(0.2),
                    ),
                    Container(
                      color: Colors.white.withOpacity(0.2),
                    )
                  ],
                ),
                clipper: CustomRect(),
              ),
              Align(
                alignment: Alignment.lerp(Alignment.topCenter, Alignment.center, 0.85),
                child: Padding(
                  padding: EdgeInsets.only(left:size.width*0.05,right:size.width*0.05),
                  child: Text(
                    '',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
