import 'package:flutter/material.dart';
import 'package:mushroom_project_final_year/button.dart';

class MainNaviYeild extends StatelessWidget {
  static String routeNameYeild = "/yeild";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(image: DecorationImage(
            image: AssetImage("assets/ordinary.jpg"),fit: BoxFit.cover,
          )),
          child: Column(
            children: [
              SizedBox(height: 80,),
              Container(
                height: 150,
                width: 200,
                decoration: BoxDecoration(image: DecorationImage(
                  image: AssetImage("assets/mashroom_log.png"),fit: BoxFit.cover,
                )),
              ),
              SizedBox(height: 20,),
              Text("Yeild Prediction",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,),),
              SizedBox(height: 20,),
              Container(
                height: 50,
                width: 375,
                child: Buttons(
                  text: "Temperature Details",
                  press: (){},
                ),
              ),
              SizedBox(height: 25,),
              Container(
                height: 50,
                width: 375,
                child: Buttons(
                  text: "Humidity Details",
                  press: (){
                   // Navigator.pushNamed(context,TimeCalculating.routeNameTimecal);
                  },
                ),
              ),
              SizedBox(height: 25,),
              Container(
                height: 50,
                width: 375,
                child: Buttons(
                  text: "Co2 Details",
                  press: (){
                    //Navigator.pushNamed(context, Disease_Detection_main.routeNameDiseas);
                  },
                ),
              ),
              SizedBox(height: 25,),
              Container(
                height: 50,
                width: 375,
                child: Buttons(
                  text: "Diseases Details",
                  press: (){
                   // Navigator.pushNamed(context, MainNaviYeild.routeNameYeild);
                  },
                ),
              ),
              SizedBox(height: 25,),
              Container(
                height: 50,
                width: 375,
                child: Buttons(
                  text: "Harvested In Time Details",
                  press: (){
                    // Navigator.pushNamed(context, MainNaviYeild.routeNameYeild);
                  },
                ),
              ),
              SizedBox(height: 25,),
              Container(
                height: 50,
                width: 375,
                child: Buttons(
                  text: "Yeild Per Day Details",
                  press: (){
                    // Navigator.pushNamed(context, MainNaviYeild.routeNameYeild);
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
