import 'package:flutter/material.dart';
import 'package:mushroom_project_final_year/button.dart';
import 'package:mushroom_project_final_year/navigation.dart';
import 'package:mushroom_project_final_year/testing.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(image: DecorationImage(
              image: AssetImage("assets/mainpage.jpg"),fit: BoxFit.cover,
            )),
            child: Column(
              children: [
                SizedBox(height: 250,),
                Container(
                  height: 250,
                  width: 300,
                  decoration: BoxDecoration(image: DecorationImage(
                    image: AssetImage("assets/mashroom_log.png"),fit: BoxFit.fill,
                  )),
                ),
                SizedBox(height: 50,),
                Container(
                  height: 50,
                  width: 375,
                  child: Buttons(
                    text: "Let's Go ->",
                    press: (){
                      Navigator.pushNamed(context, Navigation.routeNameNavi);
                    },
                  ),
                ),
                SizedBox(height: 20,),

              ],
            ),
          ),
        ));
  }
}