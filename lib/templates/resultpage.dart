import 'package:flutter/material.dart';
import 'package:lista/templates/clip_rect.dart';
import 'package:lista/widget/image_button.dart';

class ResultPage extends StatelessWidget {
  final String data;
  final String icon;
  final Color color;

  const ResultPage({Key key, @required this.data,@required this.icon,@required this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              ImageButton(size,size.height*0.87),
              ClipPath(
                child: Container(
                  color: color,
                ),
                clipper: CustomRect(design_flag: true),
              ),
              Align(
                alignment: Alignment.lerp(Alignment.topCenter, Alignment.center, 0.36),
                child: Container(
                  width: size.width/1.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.transparent,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top:size.height*0.109),
                        child: Center(
                          child: Image.asset(icon,width: size.width/3,height: size.height/5,fit:BoxFit.fill,),
                        ),
                      ),
                      data != null ? Padding(
                        padding: EdgeInsets.only(top:size.height*0.0375,right: size.width*0.025,left: size.width*0.025),
                        child: Center(
                          child: Text(
                            '$data',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20
                            ),
                          ),
                        ),
                      ) : null,
                    ],
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
