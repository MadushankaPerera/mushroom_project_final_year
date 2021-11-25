import 'package:flutter/material.dart';
class ThaliAttack extends StatefulWidget {
  static String routeNamethali = "/thali";
  String accuracy;
  String Discription;
  String disease;
  String recommendation;

  ThaliAttack({
    this.accuracy,
    this.Discription,
    this.disease,
    this.recommendation
  });

  @override
  _ThaliAttackState createState() => _ThaliAttackState();
}

class _ThaliAttackState extends State<ThaliAttack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(image: DecorationImage(
              image: AssetImage("assets/ordinary.jpg"),fit: BoxFit.cover,
            )),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 50,),
                  Container(
                    height: 150,
                    width: 200,
                    decoration: BoxDecoration(image: DecorationImage(
                      image: AssetImage("assets/mashroom_log.png"),fit: BoxFit.cover,
                    )),
                  ),
                  SizedBox(height: 20,),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          margin: EdgeInsets.only(bottom: 20.0),
                          alignment: Alignment.topCenter,
                          height:250.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                              color: Colors.red,
                              image: DecorationImage(
                                  image: AssetImage("assets/thali.jpeg"),fit: BoxFit.cover
                              )
                          ),
                          //child: Image.asset("assets/bgImage.jpg"),
                        ),
                      ),
                      Container(
                        // width: 700.0,

                          padding: EdgeInsets.only(top: 200, left: 25, right: 25),
                          child: Container(
                            height: 100,
                            width: 500,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(30)
                              ),
                              color: Color(0xFFb2c2a1),
                            ),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Thali Makka Attack",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Color(0xFF064410)),
                                    ),
                                  ),
                                ),
                                Text("Scientific Name : Phorid Files"),
                              ],
                            ),
                          )
                      )
                      //SizedBox(height: 150,),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: _tabSection(context),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

Widget _tabSection(BuildContext context) {
  return DefaultTabController(
    length: 2,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          child: TabBar(tabs: [
          //  Tab(child: Text("Symptoms",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),),
            Tab(child: Text("Description",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),),
            Tab(child: Text("Recommend",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),),
          ]),
        ),
        Container(
          //Add this to give height
          // height: MediaQuery
          //     .of(context)
          //     .size
          //     .height,
          height: 200,
          decoration: BoxDecoration(
              color: Color(0xFF8fb382),
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          child: TabBarView(children: [

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: Text("Construction of cultivation house using insect-resistant net  accordance with the standard.Maintain walls, roof, door so that there are no holes in the house.Regularly close the door of the growing room.",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: Text("The insects lays eggs in the cultivation bag or on the mushroom caps, causing worms and making the mushrooms unfit for human consumption.The adult females are attracted to actively growing mycelium.",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    ),
            ),
          ]),
        ),
      ],
    ),
  );
}