import 'package:flutter/material.dart';
import 'package:lista/templates/clip_rect.dart';
import 'package:lista/widget/image_button.dart';

class DescriptionPage extends StatelessWidget {
  final String data;
  final String image;
  final String icon;
  final Color color;
  final String title;

  const DescriptionPage({Key key, @required this.data,@required this.title,@required this.image,@required this.icon,@required this.color}) : super(key: key);
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
                  padding: EdgeInsets.only(top:size.height*0.0125),
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
              ImageButton(size,size.height*0.755),
              ClipPath(
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          image: new DecorationImage(
                            fit: BoxFit.fill,
                            // colorFilter:
                            // ColorFilter.mode(Colors.black.withOpacity(0.6),
                            //     BlendMode.dstATop),
                            image: new AssetImage(
                                image
                            ),
                          )
                      ),
                    ),
                    Container(
                      color: color.withOpacity(0.2),
                    ),
                    Container(
                      color: Colors.white.withOpacity(0.2),
                    )
                  ],
                ),
                clipper: CustomRect(),
              ),
              Align(
                alignment: Alignment.lerp(Alignment.topCenter, Alignment.center, 0.36),
                child: Container(
                  width: size.width/1.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[200].withOpacity(0.7),
                  ),
                  child: Wrap(
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(top:size.height*0.0156, bottom: size.height*0.025),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            '$title',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(left: size.width*0.075,right: size.width*0.075,bottom: size.height*0.03125),
                        child: Text(
                          '$data',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            wordSpacing: 2,
                          ),
                        ),
                      ),
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
