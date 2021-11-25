import 'package:flutter/material.dart';
class TestScreen extends StatefulWidget {
  static String routeNameGreen = "/green";

  String Discription;
  String disease;
  String recommendation;

  TestScreen({
    this.Discription,
    this.disease,
    this.recommendation,

  });
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {

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
                                  image: AssetImage("assets/green.jpeg"),fit: BoxFit.cover
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
                                      "Green Mould",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Color(0xFF064410)),
                                    ),
                                  ),
                                ),
                                Text("Scientific Name : Trichoderma spp"),
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
            //Tab(child: Text("Symptoms",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),),
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
                //Symptoms - Green patches on casing or compost.Grow very rapidly on general isolation media.The spores are easily dispersed by air currents, water, and mechanical means.They can infect mushroom crops at any stage of production.The optimum temperature for growth of mould is 22 to 26°C.Sporulation can be observed within 10 days of infestation.
                child: Text("Symptoms - Green patches on casing or compost.Grow very rapidly on general isolation media.The spores are easily dispersed by air currents, water, and mechanical means.They can infect mushroom crops at any stage of production.The optimum temperature for growth of mould is 22 to 26°C.Sporulation can be observed within 10 days of infestation.",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: Text("Careful preparation of compost,Spawning in a clean-air environment,Lowering the humidity in the growing room.Standard post-crop pasteurization (65°C) for eight hours.If the mushroom production room is affected by green mold, it should be re-steamed again before restarting for the next growing cycle.",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              ),
            ),
          ]),
        ),
      ],
    ),
  );
}