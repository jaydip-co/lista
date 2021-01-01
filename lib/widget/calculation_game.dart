import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class Member {
  String name;
  double Amount;
  double outstanding;
  Member({this.name,this.Amount = 0.0});
  String statement = '';
  String toString(){
    return "{"+name + " :"+outstanding.toString()+ "   //   "+statement+ "}";
  }
}
class CalculationGame extends StatefulWidget {
  final Function function;

  const CalculationGame({Key key, this.function}) : super(key: key);
  @override
  _CalculationGameState createState() => _CalculationGameState();
}

class _CalculationGameState extends State<CalculationGame> {
  List<Member> finalOutstaning = [];
  String nameOfProject = '';
  double totalAmount = 0.0;
  List<Member> members = [Member(name: 'a',Amount: 50),Member(name: 'b',Amount: 0),Member(name: 'c',Amount: 0)
    ,Member(name: 'd',Amount: 20),Member(name: 'e',Amount: 30)];
  TextEditingController _nameContoller = TextEditingController();
  TextEditingController _AmountContoller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    InputDecoration decoration = const InputDecoration.collapsed()
      ..applyDefaults(Theme.of(context).inputDecorationTheme);
    final size = MediaQuery.of(context).size;
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
          Card(
            shadowColor: Colors.grey[800],
            elevation: 5,
            color: Colors.white,
            child: Container(
              height: size.height*.5,
              width: size.width*.61,
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  Row(
                    children: [
                      Text("Nombre :"),
                      Expanded(child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextFormField(
                          controller: _nameContoller,
                          style: TextStyle(
                              fontSize: 18
                          ),
                          decoration: decoration,
                          onChanged: (val){
                            nameOfProject = val;
                          },
                          // InputDecoration(
                          //   prefixText: 'ssss',
                          //   prefix: Text("Nombre :"),
                          // contentPadding: EdgeInsets.symmetric(vertical: 0),
                          // enabledBorder: UnderlineInputBorder(
                          //   borderSide: BorderSide(color: Color(0xff009641))
                          // ),
                          // disabledBorder: UnderlineInputBorder(
                          //     borderSide: BorderSide(color: Color(0xff009641))
                          // )
                          //
                          // ),

                        ),
                      ),
                      )
                    ],
                  ),
                  Divider(height: 20,thickness: 2,color: Color(0xff009641),),
                  Row(
                    children: [
                      Text("Monto:"),
                      Expanded(child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextFormField(
                          controller: _AmountContoller,
                          style: TextStyle(
                              fontSize: 18
                          ),

                          decoration: decoration,
                          keyboardType: TextInputType.number,
                          onChanged: (val){
                            totalAmount = double.parse(val);
                          },
                        ),
                      ))
                    ],
                  ),
                  Divider(height: 20,thickness: 2,color: Color(0xff009641),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      getOneButton(size, "Agrigar",function: () async {
                        final res = await showdialogueBox(context);
                        if(res != null){
                          members.add(Member(name : res[0],Amount: res[1]));
                        }
                      },),

                      getOneButton(size, "Limpiar",function: () {
                        setState(() {
                          members = [];
                          totalAmount =0;
                          nameOfProject ='';
                          finalOutstaning = [];
                          _nameContoller.clear();
                          _AmountContoller.clear();
                        });
                      }),
                      getOneButton(size, "Calcular",function: (){

                        List<Member> outStaningMinus = [];
                        List<Member> outstaningPlus = [];

                        if(totalAmount == 0.0  || nameOfProject.length == 0 ){
                          Fluttertoast.showToast(msg: "Enter Name And Amount");
                        }
                        else if(members.isEmpty){
                          Fluttertoast.showToast(msg: "Enter Members");
                        }
                        else{
                          if(finalOutstaning.length > 0){
                            showResult(context);
                            return;
                          }
                          double avg = totalAmount / members.length;
                          for(Member m in members){
                            m.outstanding = m.Amount - avg;
                            if(m.outstanding > 0){
                              outstaningPlus.add(m);
                            }
                            else if (m.outstanding < 0){
                              outStaningMinus.add(m);
                            }
                            else{
                              finalOutstaning.add(m);
                            }

                          }
                          outstaningPlus.sort((a,b){ return b.outstanding.compareTo(a.outstanding);});
                          outStaningMinus.sort((a,b) => a.outstanding.compareTo(b.outstanding));
                          print(outstaningPlus.toString());
                          print(outStaningMinus.toString());


                          for(Member m in outStaningMinus ){
                            for(Member n in outstaningPlus){
                              if(m.outstanding+n.outstanding == 0){
                                int index1 = outStaningMinus.indexOf(m);
                                int index2 = outstaningPlus.indexOf(n);
                                m.statement= " have to  pay ${n.outstanding} to "+n.name;
                                m.outstanding = 0;
                                n.outstanding = 0;
                                outStaningMinus.removeAt(index1);
                                outStaningMinus.insert(index1, m);
                                outstaningPlus.removeAt(index2);
                                outstaningPlus.insert(index2,n);
                                finalOutstaning.add(m);
                              }
                            }
                          }
                          outstaningPlus.removeWhere((element) => element.outstanding == 0);
                          outStaningMinus.removeWhere((element) => element.outstanding == 0);
                          print(outstaningPlus.toString());
                          print(outStaningMinus.toString());
                          int pt1 = 0;
                          int pt2 = 0;
                          bool b = true;
                          while(b){
                            if(pt1 == outStaningMinus.length || pt2 == outstaningPlus.length)
                            {
                              break;
                            }
                            Member m1 = outStaningMinus[pt1];
                            Member m2 = outstaningPlus[pt2];
                            print(pt1.toString()+"   /// "+pt2.toString());
                            if(m1.outstanding == 0){
                              pt1++;
                              continue;
                            }
                            if(m2.outstanding == 0){
                              pt2++;
                              continue;
                            }
                            if(m1.outstanding + m2.outstanding < 0){
                              m1.outstanding = m1.outstanding + m2.outstanding;
                              if(m1.statement == ''){
                                m1.statement =  " have to pay ${m2.outstanding} to ${m2.name}";
                              }
                              else{
                                m1.statement = m1.statement + " , and ${m2.outstanding} to ${m2.name}";
                              }
                              m2.outstanding = 0;
                              outStaningMinus.removeAt(pt1);
                              outStaningMinus.insert(pt1, m1);
                              outstaningPlus.removeAt(pt2);
                              outstaningPlus.insert(pt2,m2);
                            }
                            if(m1.outstanding + m2.outstanding >= 0){
                              m2.outstanding = m2.outstanding +m1.outstanding;

                              if(m1.statement == '') {
                                m1.statement =
                                "have  to pay ${m1.outstanding *
                                    -1} to ${m2.name}";
                              }
                              else{
                                m1.statement = m1.statement + ", and ${m1.outstanding * -1} to ${m2.name}";

                              }
                              m1.outstanding = 0;
                              outStaningMinus.removeAt(pt1);
                              outStaningMinus.insert(pt1, m1);
                              outstaningPlus.removeAt(pt2);
                              outstaningPlus.insert(pt2,m2);
                              finalOutstaning.add(m1);
                            }

                          }
                          print(outstaningPlus.toString());
                          print(outStaningMinus.toString());
                          for(Member m in finalOutstaning){
                            print(m.statement);
                          }
                          showResult(context);
                        }

                      }),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      'participantes',
                      style: TextStyle(color: Color(0xff009641)),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: members.length,
                      itemBuilder: (context,i){
                        return Padding(
                          padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:[
                              Text(members[i].name,style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),),
                              Text("\$ "+members[i].Amount.toString())
                            ], ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getOneButton(Size size,String text,{Function function}){
    return GestureDetector(
      onTap: (){
        function();
      },
      child: Container(
        color: Color(0xff009641),
        child: Padding(
            padding: EdgeInsets.all(10),
            child: Text(text,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
              ),)),
      ),
    );
  }
  Future<List<dynamic>> showdialogueBox(BuildContext context){
    String name;
    double part = 0.0;
    InputDecoration decoration = const InputDecoration.collapsed()
      ..applyDefaults(Theme.of(context).inputDecorationTheme);
    return showDialog(
        context: context,
        child: AlertDialog(
          title: Text("Add Member Name and share"),

          actions: [
            GestureDetector(
              onTap: (){
                if(name != null) {
                  // members.add(Member(name: name, Amount: part));
                  Navigator.pop(context,[name,part]);
                  // return "jay";
                }

              },
              child: Container(
                color: Color(0xff009641),
                child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text("Add",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),)),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                color: Color(0xff009641),
                child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text("cancel",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),)),
              ),
            )
          ],
          content:Column(
            mainAxisSize: MainAxisSize.min,
            children: [Row(
              children: [
                Text("Nombre :"),
                Expanded(child: TextFormField(
                    onChanged: (val){
                      name = val;
                    },
                    decoration: decoration
                  // InputDecoration(
                  //   prefixText: 'ssss',
                  //   prefix: Text("Nombre :"),
                  // contentPadding: EdgeInsets.symmetric(vertical: 0),
                  // enabledBorder: UnderlineInputBorder(
                  //   borderSide: BorderSide(color: Color(0xff009641))
                  // ),
                  // disabledBorder: UnderlineInputBorder(
                  //     borderSide: BorderSide(color: Color(0xff009641))
                  // )
                  //
                  // ),

                ),
                )
              ],
            ),
              Divider(height: 20,thickness: 2,color: Color(0xff009641),),
              Row(
                children: [
                  Text("Monto:"),
                  Expanded(child: TextFormField(
                    onChanged: (val) {
                      part = double.parse(val);
                    },
                    textInputAction: TextInputAction.done,
                    decoration: decoration,
                    keyboardType: TextInputType.number,
                  ))
                ],
              ),

            ],
          ) ,

        )

    );
  }
  void showResult(BuildContext context){
    showDialog(
        context: context,
        child: AlertDialog(
          title: Text("Result"),
          actions: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Total Amount $totalAmount"),
                Text("Total Participant ${members.length}"),
                Text("Every One Have to pay ${totalAmount / members.length}"),

                Text("Participants :" ,style: TextStyle(
                    fontWeight: FontWeight.bold
                ),),
                for(Member m in members)
                  Text(m.name),
                Text("result",style: TextStyle(
                    fontWeight: FontWeight.bold
                ),),
                for(Member m in finalOutstaning)
                  Text("${m.name } ${m.statement}"),


              ],
            ),
          ],
        )
    );
  }
}
