import 'package:flutter/material.dart';
import 'package:mushroom_project_final_year/Disease_detection/add_disease_image.dart';
import 'package:mushroom_project_final_year/Disease_detection/disease5/black.dart';
import 'package:mushroom_project_final_year/Disease_detection/disease5/greenMud.dart';
import 'package:mushroom_project_final_year/Disease_detection/disease5/miteAttack.dart';
import 'package:mushroom_project_final_year/Disease_detection/disease5/neurospora.dart';
import 'package:mushroom_project_final_year/Disease_detection/disease5/thali.dart';
import 'package:mushroom_project_final_year/button.dart';

class Disease_Detection_main extends StatefulWidget {
  static String routeNameDiseas = "/diseas";
  @override
  _Disease_Detection_mainState createState() => _Disease_Detection_mainState();
}

class _Disease_Detection_mainState extends State<Disease_Detection_main> {
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
             SizedBox(height: 80,),
             Container(
               height: 150,
               width: 200,
               decoration: BoxDecoration(image: DecorationImage(
                 image: AssetImage("assets/mashroom_log.png"),fit: BoxFit.cover,
               )),
             ),
             SizedBox(height: 20,),
             Padding(
               padding: const EdgeInsets.all(30.0),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Container(
                     height: 130,
                     width: 150,
                     decoration: BoxDecoration(
                       image: DecorationImage(
                         image: AssetImage("assets/disease_button_background.jpg"),fit: BoxFit.cover,)
                       ),
                     child: Column(
                       children: [
                         SizedBox(height: 10,),
                         CircleAvatar(
                           child: Image.asset("assets/disease_button.png"),
                           backgroundColor: Colors.transparent,
                           radius: 30,
                         ),
                         SizedBox(height: 05,),
                         SpecialButton(
                           text: "Mite Attack",
                           press: (){
                             Navigator.pushNamed(context, MiteAttack.routeNamemite);
                           },
                         )
                       ],
                     )
                   ),
                   SizedBox(width: 50,),
                   Container(
                     height: 130,
                     width: 150,
                     decoration: BoxDecoration(
                         image: DecorationImage(
                           image: AssetImage("assets/disease_button_background.jpg"),fit: BoxFit.cover,)
                     ),
                     child: Column(
                       children: [
                         SizedBox(height: 10,),
                         CircleAvatar(
                           child: Image.asset("assets/disease_button.png"),
                           backgroundColor: Colors.transparent,
                           radius: 30,
                         ),
                         SizedBox(height: 05,),
                         SpecialButton(
                           text: "Green Mould",
                           press: (){
                             Navigator.pushNamed(context,TestScreen.routeNameGreen);
                           },
                         )
                       ],
                     ),
                   ),
                 ],
               ),
             ),
             Container(
               height: 130,
               width: 350,
               decoration: BoxDecoration(
                   image: DecorationImage(
                     image: AssetImage("assets/disease_button_background.jpg"),fit: BoxFit.cover,)
               ),
               child: Column(
                 children: [
                   SizedBox(height: 10,),
                   CircleAvatar(
                     child: Image.asset("assets/disease_button.png"),
                     backgroundColor: Colors.transparent,
                     radius: 30,
                   ),
                   SizedBox(height: 05,),
                   SpecialButton(
                     text: "Neurospora",
                     press: (){
                       Navigator.pushNamed(context,Neurospora.routeNameNeurospora);
                     },
                   )
                 ],
               ),
             ),
             Padding(
               padding: const EdgeInsets.all(30.0),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Container(
                     height: 130,
                     width: 150,
                     decoration: BoxDecoration(
                         image: DecorationImage(
                           image: AssetImage("assets/disease_button_background.jpg"),fit: BoxFit.cover,)
                     ),
                     child: Column(
                       children: [
                         SizedBox(height: 10,),
                         CircleAvatar(
                           child: Image.asset("assets/disease_button.png"),
                           backgroundColor: Colors.transparent,
                           radius: 30,
                         ),
                         SizedBox(height: 05,),
                         SpecialButton(
                           text: "Black Mould",
                           press: (){
                             Navigator.pushNamed(context,BlackMould.routeNameBlack);
                           },
                         )
                       ],
                     ),
                   ),
                   SizedBox(width: 50,),
                   Container(
                     height: 130,
                     width: 150,
                     decoration: BoxDecoration(
                         image: DecorationImage(
                           image: AssetImage("assets/disease_button_background.jpg"),fit: BoxFit.cover,)
                     ),
                     child: Column(
                       children: [
                         SizedBox(height: 10,),
                         CircleAvatar(
                           child: Image.asset("assets/disease_button.png"),
                           backgroundColor: Colors.transparent,
                           radius: 30,
                         ),
                         SizedBox(height: 05,),
                         SpecialButton(
                           text: "Makka Attack",
                           press: (){
                             Navigator.pushNamed(context, ThaliAttack.routeNamethali);
                           },
                         )
                       ],
                     ),
                   ),
                 ],
               ),
             ),
             SpecialButton(
               text: "Add Images",
                  press:(){
                    Navigator.pushNamed(context,   Add_disease.routeNameDiseasDetect);
                 }
             )
           ],
         ),
       ),
      ),
    );
  }
}
