import 'package:clay_containers/clay_containers.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
class TacTac extends StatefulWidget {
  const TacTac({super.key});

  @override
  State<TacTac> createState() => _TacTacState();
}

class _TacTacState extends State<TacTac> {
  TextEditingController user1 = TextEditingController();
  TextEditingController user2 = TextEditingController();

  Color basecolor= Colors.white;
  int Owins=0;
  int Xwins=0;
  int filled=0;

  String currentplayer='O';
  List highlightedindex=[];

  checkPlaces(v1,v2,v3){

    if(value[v1]!=' ' && value[v1]==value[v2] && value[v1]==value[v3]){
      highlightedindex.addAll([v1,v2,v3]);
      return true;
    }
    return false;


  }

  List value=[' ',' ',' ',' ',' ',' ',' ',' ',' '];
  checkWin(){
    if(checkPlaces(0,1,2) || checkPlaces(3,4,5) || checkPlaces(6,7,8)){
      return true;

    }
     else if(checkPlaces(0,3,6) || checkPlaces(1,4,7) || checkPlaces(2,5,8)){
      return true;

    }
     else if(checkPlaces(0,4,8) || checkPlaces(2,4,6)){
       return true;

    }
     else{
      return false;
    }
  }
  reset(){
    currentplayer='O';
    value=[' ',' ',' ',' ',' ',' ',' ',' ',' '];
    highlightedindex=[];
    filled=0;
    setState(() {

    });
  }


  setvalue(index){
    value[index]=currentplayer;
    setState(() {

    });
    var result=checkWin();

    if(result){
      Get.snackbar('yayy player ${currentplayer} ','you win this round',icon: Icon(Icons.celebration),shouldIconPulse: true,snackPosition: SnackPosition.BOTTOM);
      currentplayer=='O'?Owins+=1:Xwins+=1;

     Future.delayed(Duration(milliseconds: 5000),(){
       reset();
     });

    }
    else{
      filled+=1;
      currentplayer=currentplayer=='O'?'X':'O';
      
      if(filled==9){
        Get.snackbar("Round Draw", 'Start new one',icon: Icon(Icons.restart_alt));
        reset();
      }

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 100,),
            Text("Tic Tac Toe",style: TextStyle(fontSize: 50,color: Colors.black,fontWeight: FontWeight.bold),),
            SizedBox(height:60,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('O wins : ${Owins}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,),),
                SizedBox(width: 15,),
                Text('X wins : ${Xwins}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,)),
        ]
             ),


                SizedBox(height: 20,),
                GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                  itemBuilder: (context,index){
                  return GestureDetector(
                    onTap: (){
                      if(value[index]==' '){
                        setvalue(index);
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ClayContainer(
                         color: basecolor,
                         borderRadius: 10,
                        child: Stack(
                          children: [
                            Center(child: Text('${value[index]}',style: TextStyle(fontSize: 30),),
                            ),
                            highlightedindex.contains(index)?SpinKitCircle(color: Colors.red,):Container()
                          ],
                        ),

                      ),
                    ),

                  );
                  },
                  itemCount: 9,
                ),
            SizedBox(height: 20,),
            highlightedindex.isNotEmpty?ClayContainer(
              height: 65,
              width: 65,
              borderRadius: 60,
              curveType: CurveType.concave,
              child: SpinKitRipple(itemBuilder: (context,index){return Icon(FontAwesomeIcons.kiss,color: Colors.red,size: 50,);},),
            ):Container(),


              ],


        ),
      ),

    );
  }
}

