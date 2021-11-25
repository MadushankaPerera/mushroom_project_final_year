import 'package:flutter/material.dart';
import 'package:mushroom_project_final_year/Disease_detection/disease_detection_main.dart';
import 'package:mushroom_project_final_year/button.dart';
import 'package:mushroom_project_final_year/enviromental_monitoring/outsideFactors.dart';
import 'package:mushroom_project_final_year/harvesting_Time_detection/timeCaluculating.dart';
import 'package:mushroom_project_final_year/yeildPrediction/mainNaviYeild.dart';
import 'package:mushroom_project_final_year/yeildPrediction/testYeild.dart';

class Navigation extends StatelessWidget {
  static String routeNameNavi ="/navi";
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
          child: Column(
            children: [
              SizedBox(height: 150,),
              Container(
                height: 150,
                width: 200,
                decoration: BoxDecoration(image: DecorationImage(
                  image: AssetImage("assets/mashroom_log.png"),fit: BoxFit.cover,
                )),
              ),
              SizedBox(height: 50,),
              Container(
                height: 60,
                width: 375,
                child: Buttons(
                  text: "Environmental Monitoring",
                  press: (){
                    CircularProgressIndicator(backgroundColor: Color(0xff000000),
                        valueColor:
                        AlwaysStoppedAnimation<Color>(Color(0xfffd7013)));
                    Navigator.pushNamed(context,OutSideFactors.routeNameoutSide);
                  },
                ),
              ),
              SizedBox(height: 25,),
              Container(
                height: 60,
                width: 375,
                child: Buttons(
                  text: "Harvest Time Detection",
                  press: (){
                    Navigator.pushNamed(context,TimeCalculating.routeNameTimecal);
                  },
                ),
              ),
              SizedBox(height: 25,),
              Container(
                height: 60,
                width: 375,
                child: Buttons(
                  text: "Disease Detection",
                  press: (){
                    Navigator.pushNamed(context, Disease_Detection_main.routeNameDiseas);
                  },
                ),
              ),
              SizedBox(height: 25,),
              Container(
                height: 60,
                width: 375,
                child: Buttons(
                  text: "Yield Prediction",
                  press: (){
                    //Navigator.pushNamed(context, MainNaviYeild.routeNameYeild);
                    Navigator.pushNamed(context, Yield_prediction.routeNameYeild1);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
 